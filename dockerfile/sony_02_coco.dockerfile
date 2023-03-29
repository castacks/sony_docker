ARG base_image=yaoyuh/u20c116sony:01_mmcv
FROM ${base_image}

RUN pip3 install --no-cache-dir \
	scipy \
	kiwisolver \
    matplotlib \
    imageio \
    pypng \
    Cython \
    PyOpenGL \
    triangle \
    glumpy \
    opencv-python \
    Pillow \
    vispy

# MartinSmeyer/cocoapi.
RUN pip3 install -e "git+https://github.com/MartinSmeyer/cocoapi.git@v1.0#egg=pycocotools&subdirectory=PythonAPI"

# Entrypoint command.
CMD /bin/bash
