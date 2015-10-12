#!/usr/bin/env cwl-runner

# docker run -u $UID -v $PWD:/data potreeconverter PotreeConverter -l 5 --output-format LAZ /data/input.laz

class: CommandLineTool

hints:
  - class: DockerRequirement
    dockerPull: sverhoeven/potreeconverter

inputs:
  - id: "#levels"
    type: int
    inputBinding: { position: 0, prefix: "-l" }

  - id: "#output-format"
    type:
      type: enum
      symbols: ["BINARY", "LAS", "LAZ"]
      name: output-formats
    default: LAZ
    inputBinding: { position: 1, prefix: "--output-format" }

  - id: "#source"
    type: File
    inputBinding: { position: 3 }

outputs:
  - id: "#cloudjs"
    type: "File"
    outputBinding: { "glob": "cloud.js" }
  - id: "#octreedir"
    type: "File"
    outputBinding: { "glob": "data/r/r.hrc" }
    # glob should be extended to all files, but number of files and type of files depends on input parameters and source

baseCommand: ["PotreeConverter", "--outdir", "."]
