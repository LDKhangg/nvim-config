return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  dependencies = {
    "mfussenegger/nvim-dap",
    "JavaHello/spring-boot.nvim",
  },
  config = function()
    local mason_path = vim.fn.stdpath("data") .. "/mason"
    local jdtls_path = mason_path .. "/packages/jdtls"
    local debug_path = mason_path .. "/packages/java-debug-adapter"
    local test_path = mason_path .. "/packages/java-test"

    local debug_jar = vim.fn.glob(debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar")
    local test_jars = vim.fn.split(vim.fn.glob(test_path .. "/extension/server/*.jar"), "\n")

    local bundles = { debug_jar }
    vim.list_extend(bundles, test_jars)

    local status_ok, spring_boot = pcall(require, "spring_boot")
    if status_ok then
      vim.list_extend(bundles, spring_boot.java_extensions())
    end

    local config = {
      cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx2g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration", jdtls_path .. "/config_linux",
        "-data", vim.fn.stdpath("cache") .. "/jdtls/workspace" .. vim.fn.getcwd(),
      },
      root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
      settings = {
        java = {
          eclipse = { downloadSources = true },
          configuration = { updateBuildConfiguration = "interactive" },
          maven = { downloadSources = true },
          implementationsCodeLens = { enabled = true },
          referencesCodeLens = { enabled = true },
          references = { includeDecompiledSources = true },
        },
      },
      init_options = {
        bundles = bundles,
      },
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        require("jdtls").start_or_attach(config)
      end,
    })
  end,
}
