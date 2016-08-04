# PotreeConverter

Builds a potree octree from las, laz or binary ply files.

See http://potree.org to integrate potree octree into a web visualization.

## Run

Run by

```
./potreeconverter-tool.cwl --source ../images2pointcloud/rock.ply
```

It will create a Potree visualization data files in the current working directory.

It can be viewed by downloading & uncompressing a Potree release from https://github.com/potree/potree/releases

1. Move `data/` directory and `cloud.js` file to `potree-*/examples/` of Potree release.
2. Set the 'path' property value of the sceneProperties variable in the `potree-*/examples/viewer.html` file to `./cloud.js`.
3. Host potree release with web server
```
cd potree-*/
python3 -m http.server 8000
```

TODO: wrap `potreeconverter-tool.cwl` file and steps above in a workflow.

## Example input generation

The input file was made by the Structure From Motion Pipeline (https://github.com/NLeSC/structure-from-motion) using https://github.com/NLeSC/structure-from-motion/tree/develop/examples/rock-section as input images.

The output of the Structure From Motion Pipeline was converted from ply to laz with:

```
docker run -u $UID -v $PWD:/data sverhoeven/potreeconverter:1.1 txt2las --parse xyzsssRGB /data/rock.ply /data/rock.las
docker run -u $UID -v $PWD:/data sverhoeven/potreeconverter:1.1 las2las -c -i /data/rock.las -o /data/rock.laz
```
