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

For the following instructions, let's assuem the new image name and tage are `yaoyuh/tartancabli:99_local`.

## Launch a Docker container.

Copy the `script/start_calib_container.sh` to something like `script/start_calib_container_local.sh` and modify the content to reflect the local file structure. Note that any file that has the filename pattern as `*_local.*` will be ignored by Git. So it's convenient to do the above copy without notifying Git that there is an untracked file.



