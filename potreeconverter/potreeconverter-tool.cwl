#!/usr/bin/env cwl-runner

# docker run -u $UID -v $PWD:/data sverhoeven/potreeconverter PotreeConverter -l -1 --output-format LAZ /data/input.laz

class: CommandLineTool
cwlVersion: v1.0
hints:
  - class: DockerRequirement
    dockerPull: sverhoeven/potreeconverter
baseCommand: PotreeConverter
inputs:
  levels:
    type: ["null", "int"]
    doc: |
      Number of levels that will be generated. 0: only root, 1: root and
      its children, ...
    inputBinding:
      prefix: --levels
  output_format:
    type:
      type: enum
      symbols: ["BINARY", "LAS", "LAZ"]
      name: output-formats
    default: BINARY
    inputBinding:
      prefix: --output-format
  source:
    type: File
    doc: |
      Source file. Can be LAS, LAZ, PTX or PLY
    inputBinding:
      prefix: --source
  outdir:
    type: string
    default: .
    inputBinding:
      prefix: --outdir
outputs:
  outdir:
    type: Directory
    outputBinding:
      glob: .
