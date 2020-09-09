FROM archlinux/base:latest

# I use custom mirrorlist closest to my country than the default one
COPY mirrorlist /etc/pacman.d/

RUN pacman -Syu --noconfirm --disable-download-timeout \
    curl tar sudo grep binutils mono libzip unzip base-devel \
    jre8-openjdk jdk8-openjdk libxtst lib32-gcc-libs lib32-glibc \
    git lsb-release vim p7zip nuget \
    && pacman -Scc --noconfirm

ARG USER_ID=1000
RUN pacman -Syu --noconfirm mono-msbuild \
    && useradd -m -u $USER_ID builduser \
    && passwd -d builduser \
    && printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers

COPY build-xa.sh /
RUN chmod +rx /usr/bin/msbuild /build-xa.sh
WORKDIR /home/builduser/
USER builduser
CMD [ "/build-xa.sh" ]
