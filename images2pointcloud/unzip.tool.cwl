#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
doc: "Unzips a zip file"
baseCommand: unzip
inputs:
  zipfile:
    type: File
    inputBinding:
      position: 1
outputs:
  outdir:
    type: Directory
    outputBinding:
      glob: .
