-- ~/.config/nvim/ftplugin/java.lua
local has_jdtls, jdtls = pcall(require, "jdtls")
if not has_jdtls then
  return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls-workspace/" .. project_name

local install_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local launcher_jar = vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local lombok_jar = install_path .. "/lombok.jar"
local config_dir = install_path .. "/config_linux" -- ajuste se for mac/win

local cmd = {
  "java",
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.product=org.eclipse.jdt.ls.core.product",
  "-javaagent:" .. lombok_jar,
  "-jar",
  launcher_jar,
  "-configuration",
  config_dir,
  "-data",
  workspace_dir,
}

local config = {
  cmd = cmd,
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),
  settings = {
    java = {
      eclipse = { downloadSources = true },
      configuration = { updateBuildConfiguration = "interactive" },
    },
  },
}

jdtls.start_or_attach(config)
