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

    local function get_root_dir()
      local fname = vim.api.nvim_buf_get_name(0)
      local current_dir = fname ~= "" and vim.fs.dirname(fname) or vim.fn.getcwd()
      local root = vim.fs.find({ ".git", "mvnw", "gradlew" }, { path = current_dir, upward = true })[1]
      if root then
        return vim.fs.dirname(root)
      end
      root = vim.fs.find({ "pom.xml", "build.gradle" }, { path = current_dir, upward = true })[1]
      return root and vim.fs.dirname(root) or vim.fn.getcwd()
    end

    local root_dir = get_root_dir()
    local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
    local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. project_name

    local config = {
      cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx2g",
        "-javaagent:" .. jdtls_path .. "/lombok.jar",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration", jdtls_path .. "/config_linux",
        "-data", workspace_dir,
      },
      root_dir = root_dir,
      settings = {
        java = {
          eclipse = { downloadSources = true },
          configuration = { updateBuildConfiguration = "automatic" },
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
