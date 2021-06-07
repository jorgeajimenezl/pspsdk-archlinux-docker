FROM archlinux

RUN pacman -Syu --noconfirm
RUN pacman -S basedevel doxygen git libcurl-compat curl openssl libusb libusb-compat ncurses python svn wget tcl tar make cmake 

ENV PSPDEV /usr/local/pspdev
ENV PATH $PATH:$PSPDEV/bin

RUN git clone https://github.com/pspdev/psptoolchain.git
RUN cd psptoolchain
RUN /bin/sh ./toolchain-sudo.sh