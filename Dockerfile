FROM archlinux as build

RUN pacman -Syu --noconfirm
RUN pacman -S base-devel doxygen git libcurl-compat libusb libusb-compat python svn wget tcl tar make cmake unzip --noconfirm

ENV PSPDEV /usr/local/pspdev
ENV PATH $PATH:$PSPDEV/bin

RUN git clone https://github.com/pspdev/psptoolchain.git
WORKDIR /psptoolchain
RUN /bin/sh ./toolchain-sudo.sh

FROM archlinux
COPY --from=build ${PSPDEV} ${PSPDEV}