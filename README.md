# Single-cell, clonal and spatial atlases of neural plate border and neurogenic placodes illuminate their specification and evolution.



## About the project
Description of project and paper. 
In this project we investigate the cranial placodes during development.

![Flowchart of study workflow](workflow-glial-isoforms.png)

Details in this repository include:
- Setting up environment
- Downloading and aligning reads
- Extracting clodeIDs using TREX
- Preprocessing data
- Clonal clusering
- Annotations and subsetting
- Plotting result shown in paper


>If you have any questions please reach out to me at:
>> felix.waern@ki.se

## Copy repository
git clone https://github.com/FelixWaern/clonal-placodes-2026.git


## Setup
First install [docker](https://www.docker.com/get-started/).

Before creating docker get the latest URL for Cell Ranger version 7.1.0 on:
https://www.10xgenomics.com/support/software/cell-ranger/downloads/previous-versions

Example: "https://cf.10xgenomics.com/releases/cell-exp/cellranger-7.1.0.tar.gz?Expires=1764967206&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=TQalbcU6LUNXrLkHn9nqqs06TLOWzthfXTpfTOx-ru0y0466j~y8f9FeS1FR8tgbGfqg5XpzTKgqKed55HdqV3CCVhntHo4ixfvMXIZk5Z5wMNCYdOuUzi35XBg7keHvukgxG~pd7oAPZVhLs5GycpVOLwzh~dxWBruVK8U5MscTxED7IXeKFIjsDozSGIli2J8jKH4cioS9coYezQGM4px-WFA4uWwBkTVXAVjqpuzcpAqBIDbVCQ2KZkGf2zJ~U64SWbmwfIiBMcmTN3XnGI2DfxjrN2~V4xKtL9fV0-z-lIcROey6WfIZXIBG1IokX~Ha~CbrwhKo31ktS5LVFA__"


Create docker image using the URL by running:

/home/felix/data/translational_control

```
docker build -t docker_placodes --build-arg CELLRANGER_URL="<url-here>" -f Dockerfile .
```

Run docker container using:
```
#docker container run -it docker_placodes bash


docker container run -it -v ./data:/placodes/data -v ./results:/placodes/results docker_placodes bash
```


After creating docker container and running it check installs.
```
nextflow info

which cellranger
```


## Download

- Download reference
- Download fastq
- Download annotation

## 00_align

## 01_trex

## 02_process_data


## Install conda environement
Install [conda](https://docs.conda.io/projects/conda/en/stable/user-guide/install/index.html)

Download `environement.yml`. 



***

### Further information:
#### If you want to remove docker container and images afterwards:

- ``` ctrl+d```: To exit session
- ``` docker ps -a ```: To see all the running containers in your machine.
- ``` docker stop <container_id> ```: : To stop a running container.
- ``` docker rm <container_id>```: To remove/delete a docker container(only if it stopped).
- ``` docker image ls ```: To see the list of all the available images with their tag, image id, creation time and size.
- ``` docker rmi <image_id> ```: To delete a specific image.
- ```docker system prune -a``` : To clean the docker environment, removing all the containers and images.



Learn more about  [Adameykolab](https://adameykolab.eu/)!


