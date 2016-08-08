#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
doc: "Structure from Motion Pipeline, see https://github.com/NLeSC/structure-from-motion"
requirements:
- class: DockerRequirement
  dockerPull: nlesc/structure-from-motion
- class: InitialWorkDirRequirement
  listing: $(inputs.imagesdir.listing)
inputs:
  imagesdir: Directory
outputs:
  densepointcloud:
    type: File
    outputBinding:
      glob: pmvs/models/option-0000.ply
