return{
  cmd = {"jdtls"},
  root_dir = require("lspconfig").util.root_pattern(".git", "mvnw", "gradlew", "build.gradle", "pom.xml", ".")
}

--[
-- se le esta agragando el "." para que lea cualquier archivo que no sea los que se estan
-- estableciendo en la lista 
-- esperemos que esta funcion funcione
--]
