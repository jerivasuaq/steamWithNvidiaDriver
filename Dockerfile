FROM sassmann/ubuntu-steam
MAINTAINER jerivas

USER root

RUN apt-get update
RUN apt-get install -y mesa-utils

# install nvidia driver
RUN apt-get install -y binutils module-init-tools libgl1-mesa-dri:i386 pciutils
ADD NVIDIA-DRIVER.run /tmp/NVIDIA-DRIVER.run
RUN sh /tmp/NVIDIA-DRIVER.run -a -N --ui=none --no-kernel-module
RUN rm /tmp/NVIDIA-DRIVER.run

RUN usermod -aG audio steam

USER steam
ENV HOME /home/steam
VOLUME /home/steam
ENV PULSE_SERVER unix:/tmp/pulse

CMD ["steam"]


