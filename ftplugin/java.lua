local jdtls = require("jdtls")
local root = vim.fs.root(0, { "gradlew", "mvnw", "pom.xml", "build.gradle", ".git" })
local workspace = vim.fn.stdpath("data") .. "/jdtls-workspace/"
  .. vim.fs.basename(root or vim.fn.getcwd())

jdtls.start_or_attach({
  cmd = { "jdtls", "-data", workspace },
  root_dir = root,
})
