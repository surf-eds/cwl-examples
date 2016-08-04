# Images 2 pointcloud

Converts a zip file of jpg image files to a point cloud file in ply format.

An example images are available at https://github.com/NLeSC/structure-from-motion/tree/master/examples/rock

The example images must be zipped without sub-directory.

The workflow can be run using

```
./images2pointcloud.workflow.cwl --input rock.zip --output rock.ply
```

