# Installation

## Java
ubuntu
1. `apt-get update`
2. `apt-get install openjdk-13-jdk`

MacOS
1. `brew update`
2. `brew tap adoptopenjdk/openjdk`
3. `brew search jdk`
4. `brew install --cask adoptopenjdk13`

brew install example `brew install --cask adoptopenjdk11`, `brew install --cask adoptopenjdk14`

## Shell Environments
ubuntu
1. add shell variable `JAVA_HOME="/usr/lib/jvm/java-13-openjdk-amd64"` to `/etc/environment` or user shell rc file like `~/.zshrc`, `~/.bashrc`

MacOS
1. add shell variable `JAVA_HOME="/usr/lib/jvm/java-13-openjdk-amd64"` to `/etc/environment` or user shell rc file like `~/.zshrc`, `~/.bashrc`

# Execution
[CMD]
`java -jar plantuml.jar -verbose sequenceDiagram.txt`

link : https://plantuml.com/ko/faq-install

[Script]

1. type terminal `mkpuml [file1.pu] [file2.pu] [file3.pu] ...`
