#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
doc: "Generate point cloud (ply) file from zip file of jpg images"
inputs:
  input: File
  output: string
outputs:
  outputfile:
    type: File
    outputSource: rename/outfile
steps:
  unzip:
    run: unzip.tool.cwl
    in:
      zipfile: input
    out:
    - outdir
  sfm:
    run: sfm.tool.cwl
    in:
      imagesdir: unzip/outdir
    out:
    - densepointcloud
  rename:
    run: rename.tool.cwl
    in:
      srcfile: sfm/densepointcloud
      newname: output
    out:
    - outfile
