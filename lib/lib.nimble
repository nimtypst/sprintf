# Package

version       = "0.1.0"
author        = "litlighilit"
description   = "src of typst plugin"
license       = "MIT"
srcDir        = "."


# Dependencies

requires "nim > 2.0.8"

var pylibPre = "https://github.com/nimpylib"
let envVal = getEnv("NIMPYLIB_PKGS_BARE_PREFIX")
if envVal != "": pylibPre = ""
elif pylibPre[^1] != '/':
  pylibPre.add '/'
template pylib(x, ver) =
  requires if pylibPre == "": x & ver
           else: pylibPre & x

pylib "pyformats", " ^= 0.1.0"
pylib "wasm_minimal_protocol", " ^= 0.1.1"

from std/os import `/`
task buildTypst, "build typst plugin":
  const typSrc = "../src"
  exec"nim-typst-plugin lib.nim"
  template mv2d(f, d) =
    mvFile f, d/f
  mv2d "lib.typ", typSrc
  mv2d "lib.wasm", typSrc
