# Docker container for antlr

"ANTLR (ANother Tool for Language Recognition) is a powerful parser generator for reading, processing, executing, or translating structured text or binary files. It's widely used to build languages, tools, and frameworks. From a grammar, ANTLR generates a parser that can build and walk parse trees."

www.antlr.org

## Setup

Use the docker-antlr helper script to fire up the container conveniently. docker-antlr accepts the very same command line options as antlr itself. it bind-mounts all the necessary directories (directories of your input and output files) and calls antlr within the container. You can get docker-antlr form the git repository or copy it directly from the container's root directory.

```
docker create --name antlr ivanakcheurov/antlr
sudo docker cp antlr:docker-antlr /usr/local/bin/
docker rm antlr
```

#### MacOS X
`realpath` isn't shipped with MacOS. You should install `coreutils`

```bash
brew install coreutils
```

### Usage

Use the docker-antlr script exactly as you would use antlr itself.

```bash
docker-antlr <antlr-options>
```
For example,

```bash
# given a simple grammar file to parse a postal code
cat postalcode.g4
# outputs:

grammar postalcode;

postalcode
   : LETTER DIGIT LETTER DIGIT LETTER DIGIT
   ;

DIGIT
   : '0' .. '9'
   ;

LETTER
   : 'A' .. 'Z'
   ;

WS
   : [ \t\r\n] -> skip

# then we generate a parser for this grammar:
docker-antlr -Dlanguage=CSharp postalcode.g4

# would create the following files in your working folder:

# postalcode.interp
# postalcode.tokens
# postalcodeBaseListener.cs
# postalcodeLexer.cs
# postalcodeLexer.interp
# postalcodeLexer.tokens
# postalcodeListener.cs
# postalcodeParser.cs
```

## Credits and changes

This is a fork of the original repo by [peter-vaczi/docker-antlr](https://github.com/peter-vaczi/docker-antlr)

Changes:
* upgraded to Antlr 4.9
* Added info how to run on MacOS
* Added an example for usage