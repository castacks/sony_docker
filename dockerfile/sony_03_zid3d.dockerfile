ARG base_image=yaoyuh/u20c116sony:02_coco
FROM ${base_image}

WORKDIR /libraries

# Jaraxxus-Me/bop_toolkit and zid3d are subject to change.
# So we only do a temporary install. Later when the image
# is loaded into a container, the user is responsible to mount
# the appropriate host directories.

# RUN pip3 install -e "git+https://github.com/Jaraxxus-Me/bop_toolkit.git"
RUN cd /libraries \
 && git clone https://github.com/Jaraxxus-Me/bop_toolkit.git \
 && cd bop_toolkit \
 && pip3 install -v -e .
 
#  && cd .. \
#  && rm -rf bop_toolkit/

# Since zid3d is private, we need to copy it from the host.
COPY sony_Zid3D /libraries/sony_Zid3D
RUN cd /libraries/sony_Zid3D \
 && pip3 install -v -e .

#  && cd .. \
#  && rm -rf sony_Zid3D/
	
# Entrypoint command.
CMD /bin/bash
