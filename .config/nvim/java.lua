-- JDTLS (Java LSP) configuration
local jdtls = require 'jdtls'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.env.HOME .. '/jdtls-workspace/' .. project_name

-- See https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Language-Server-Settings-&-Capabilities#java-formatter-options
local extendedClientCapabilities = require('jdtls').extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
extendedClientCapabilities.generateConstructorsPromptSupport = true

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.workspace = {
  configuration = true,
}
capabilities.language = {
  status = true,
}

-- Needed for debugging
local bundles = {
  vim.fn.glob(vim.env.HOME .. '/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar'),
}

-- Needed for running/debugging unit tests
vim.list_extend(bundles, vim.split(vim.fn.glob(vim.env.HOME .. '/.local/share/nvim/mason/share/java-test/*.jar', 1), '\n'))
local root_markers = {
  -- Multi-module projects
  { '.git', 'build.gradle', 'build.gradle.kts' },
  -- Single-module projects
  {
    'build.xml', -- Ant
    'pom.xml', -- Maven
    'settings.gradle', -- Gradle
    'settings.gradle.kts', -- Gradle
  },
}

local lspconfig_util = require 'lspconfig.util'
local get_root_dir = function(fname)
  for _, patterns in ipairs(root_markers) do
    local root = lspconfig_util.root_pattern(unpack(patterns))(fname)
    if root then
      return root
    end
  end
  return vim.fn.getcwd()
end
local root_dir = get_root_dir(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. vim.env.HOME .. '/.local/share/nvim/mason/share/jdtls/lombok.jar',
    '-Xmx4g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',

    -- Eclipse jdtls location
    '-jar',
    vim.env.HOME .. '/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar',
    -- TODO Update this to point to the correct jdtls subdirectory for your OS (config_linux, config_mac, config_win, etc)
    '-configuration',
    vim.env.HOME .. '/.local/share/nvim/mason/packages/jdtls/config_mac',
    '-data',
    workspace_dir,
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = root_dir,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = {
    java = {
      home = '/Users/ruthwikhm/.sdkman/candidates/java/17.0.10-sem/bin/java',
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = 'interactive',
        -- The runtime name parameters need to match specific Java execution environments.  See https://github.com/tamago324/nlsp-settings.nvim/blob/2a52e793d4f293c0e1d61ee5794e3ff62bfbbb5d/schemas/_generated/jdtls.json#L317-L334
        runtimes = {
          {
            name = 'Java 17 Semeru',
            path = '~/.sdkman/candidates/java/17.0.10-sem/bin/java',
          },
          {
            name = 'Java 11 Semeru',
            path = '~/.sdkman/candidates/java/11.0.22-sem/bin/java',
          },
        },
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      signatureHelp = { enabled = true },
      format = {
        enabled = true,
        -- Formatting works by default, but you can refer to a specific file/URL if you choose
        -- settings = {
        --   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
        --   profile = "GoogleStyle",
        -- },
      },
    },
    completion = {
      favoriteStaticMembers = {
        'org.hamcrest.MatcherAssert.assertThat',
        'org.hamcrest.Matchers.*',
        'org.hamcrest.CoreMatchers.*',
        'org.junit.jupiter.api.Assertions.*',
        'java.util.Objects.requireNonNull',
        'java.util.Objects.requireNonNullElse',
        'org.mockito.Mockito.*',
      },
      importOrder = {
        'java',
        'javax',
        'com',
        'org',
      },
    },
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
      },
      useBlocks = true,
    },
  },
  -- Needed for auto-completion with method signatures and placeholders
  capabilities = capabilities,
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    -- References the bundles defined above to support Debugging and Unit Testing
    bundles = bundles,
  },
}

-- Needed for debugging
config['on_attach'] = function(client, bufnr)
  jdtls.setup_dap { hotcodereplace = 'auto' }
  require('jdtls.dap').setup_dap_main_class_configs()
end

-- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
jdtls.start_or_attach(config)
