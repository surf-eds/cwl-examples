#!/usr/bin/env cwl-runner

# docker run -u $UID -v $PWD:/data potreeconverter PotreeConverter -l 5 --output-format LAZ /data/input.laz

class: CommandLineTool

hints:
  - class: DockerRequirement
    dockerPull: sverhoeven/potreeconverter

inputs:
  - id: "#outdir"
    type: string
    inputBinding: { position: 0, prefix: "-o" }

  - id: "#levels"
    type: int
    inputBinding: { position: 1, prefix: "-l" }

  - id: "#output-format"
    type:
      type: enum
      symbols: ["BINARY", "LAS", "LAZ"]
      name: output-formats
    default: LAZ
    inputBinding: { position: 2, prefix: "--output-format" }

  - id: "#source"
    type: File
    inputBinding: { position: 3 }

outputs:
  - id: "#cloudjs"
    type: "File"
    outputBinding: { "glob": "cloud.js" }
  - id: "#octreedir"
    type: "File"
    outputBinding: { "glob": "data/" }

baseCommand: ["PotreeConverter"]

stdout: "output.txt"
