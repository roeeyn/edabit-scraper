# Uploader

## Copy the list

```bash
# This will be ignored by git, but it's useful for the python scripts
cp -a ../ut_merged_list.json exercises_list.json
```

Run Jupyter documents with command

## Run the jupyter notebook

```bash
docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -e GRANT_SUDO=yes --user root -v "$PWD":/home/jovyan/work jupyter/scipy-notebook
```
