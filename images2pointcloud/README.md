# Images 2 pointcloud

Converts a zip file of jpg image files to a point cloud file in ply format.

Example images are available at https://github.com/NLeSC/structure-from-motion/tree/master/examples/rock

The example images must be zipped without sub-directories.

The workflow can then be run using

```
./images2pointcloud.workflow.cwl --input rock.zip --output rock.ply
```

The ply file can be viewed using MeshLab or viewed in potree using the potreeconverter.
