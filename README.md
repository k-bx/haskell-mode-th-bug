Simple repo to show TH-related problems with `stack ghci` (initially I
thought it's in `haskell-mode`).

Two minimal projects, `subproj-base` providing lib and `subproj-main`
using that lib. `subproj-base` uses `embedFile` to embed its file.

The problem can be seen as:

```
➜  haskell-mode-th-bug git:(master) stack build
➜  haskell-mode-th-bug git:(master) stack exec subproj-main
"contents of a file.txt\n"
hello world
➜  haskell-mode-th-bug git:(master) stack ghci
Configuring GHCi with the following packages: subproj-base, subproj-main
Using main module: 1. Package `subproj-main' component exe:subproj-main with main-is file: /Users/kb/workspace/playground/haskell-mode-th-bug/subproj-main/src/Main.hs
GHCi, version 8.0.2: http://www.haskell.org/ghc/  :? for help
Loaded GHCi configuration from /Users/kb/.ghci
[1 of 1] Compiling BaseLib          ( /Users/kb/workspace/playground/haskell-mode-th-bug/subproj-base/src/BaseLib.hs, interpreted )

/Users/kb/workspace/playground/haskell-mode-th-bug/subproj-base/src/BaseLib.hs:9:7: error:
    • Exception when trying to run compile-time code:
        data/file.txt: openBinaryFile: does not exist (No such file or directory)
      Code: embedFile "data/file.txt"
    • In the untyped splice: $(embedFile "data/file.txt")
Failed, modules loaded: none.
[1 of 2] Compiling BaseLib          ( /Users/kb/workspace/playground/haskell-mode-th-bug/subproj-base/src/BaseLib.hs, interpreted )

/Users/kb/workspace/playground/haskell-mode-th-bug/subproj-base/src/BaseLib.hs:9:7: error:
    • Exception when trying to run compile-time code:
        data/file.txt: openBinaryFile: does not exist (No such file or directory)
      Code: embedFile "data/file.txt"
    • In the untyped splice: $(embedFile "data/file.txt")
Failed, modules loaded: none.

<no location info>: error:
    Could not find module ‘BaseLib’
    It is a member of the hidden package ‘subproj-base-0.1.0.0@subproj-base-0.1.0.0-Adn4PANlZk36fThAtlOT1G’.
Loaded GHCi configuration from /private/var/folders/7l/3ys9j0lx20j6z69lm6s_9r780000gn/T/ghci48652/ghci-script
λ
```
