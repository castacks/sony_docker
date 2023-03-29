# For camera calibration

## Pull the image.

```bash
docker pull yaoyuh/tartancalib:01_base
```

## Add the local user to the Docker image.

```bash
cd script
./add_user_2_image.sh yaoyuh/tartancalib:01_base <new image name and tag>
```

## Launch a Docker container.



