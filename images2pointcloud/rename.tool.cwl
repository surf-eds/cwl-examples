#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
doc: "Rename file"
baseCommand: "true"
requirements:
  InitialWorkDirRequirement:
    listing:
      - entryname: $(inputs.newname)
        entry: $(inputs.srcfile)
inputs:
  srcfile: File
  newname: string
outputs:
  outfile:
    type: File
    outputBinding:
      glob: $(inputs.newname)
