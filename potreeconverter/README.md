# PotreeConverter

Builds a potree octree from las, laz or binary ply files.

See http://potree.org to integrate potree octree into a web visualization.

## Run

Run by

```
./potreeconverter-tool.cwl potreeconverter-job.json
```

## Example input generation

The input file was made by the Structure From Motion Pipeline (https://github.com/NLeSC/structure-from-motion) using https://github.com/NLeSC/structure-from-motion/tree/develop/examples/rock-section as input images.

The output of the Structure From Motion Pipeline was converted from ply to laz with:

```
docker run -u $UID -v $PWD:/data sverhoeven/potreeconverter:1.1 txt2las --parse xyzsssRGB /data/rock.ply /data/rock.las
docker run -u $UID -v $PWD:/data sverhoeven/potreeconverter:1.1 las2las -c -i /data/rock.las -o /data/rock.laz
```
