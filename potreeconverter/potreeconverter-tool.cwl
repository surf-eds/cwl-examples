#!/usr/bin/env cwl-runner

# docker run -u $UID -v $PWD:/data sverhoeven/potreeconverter PotreeConverter -l -1 --output-format LAZ /data/input.laz

class: CommandLineTool

hints:
  - class: DockerRequirement
    dockerPull: sverhoeven/potreeconverter

inputs:
  - id: "#levels"
    type: int
    default: -1
    description: |
      Number of levels that will be generated. 0: only root, 1: root and
      its children, ...
    inputBinding:
      prefix: "-l"

  - id: "#output-format"
    type:
      type: enum
      symbols: ["BINARY", "LAS", "LAZ"]
      name: output-formats
    default: LAZ
    inputBinding:
      prefix: "--output-format"

  - id: "#source"
    type: File
    description: |
      Source file. Can be LAS, LAZ, PTX or PLY
    inputBinding:
      prefix: "--source"

outputs:
  - id: "#cloudjs"
    type: "File"
    outputBinding:
      glob: cloud.js
  - id: "#octreedir"
    type: File
    outputBinding:
      glob: data/r/r.hrc
      # glob should be extended to all files, but number of files and type of files depends on input parameters and source

# outdir is hardcoded to cwd, the cwl specification requires output in cwd
baseCommand: ["PotreeConverter", "--outdir", "."]
