return{
  cmd = {"jdtls"},
  root_dir = require("lspconfig").util.root_pattern(".git", "mvnw", "gradlew", "build.gradle", "pom.xml")
}
