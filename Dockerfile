FROM archlinux/base:latest

# I use custom mirrorlist closest to my country than the default one
COPY mirrorlist /etc/pacman.d/

RUN pacman -Syu --noconfirm --disable-download-timeout \
    curl tar sudo grep binutils mono libzip unzip base-devel \
    jre8-openjdk jdk8-openjdk libxtst lib32-gcc-libs lib32-glibc \
    git lsb-release vim p7zip nuget \
    && pacman -Scc --noconfirm

ARG USER_ID=1000

# Mono MSBuild 16.3
RUN cd /tmp \
    && curl https://aur.archlinux.org/cgit/aur.git/snapshot/msbuild-16-bin.tar.gz -O \
    && tar xf msbuild-16-bin.tar.gz \
    && useradd -m -u $USER_ID builduser \
    && passwd -d builduser \
    && printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers \
    && chown -R builduser:builduser /tmp/msbuild-16-bin \
    && cd msbuild-16-bin \
    && sudo -u builduser makepkg --noconfirm \
    && pacman -U *.pkg.tar.xz --noconfirm \
    && cd /tmp \
    && rm msbuild-* -rf

COPY build.sh /
RUN chmod +rx /usr/bin/msbuild /build.sh
WORKDIR /home/builduser/
USER builduser
CMD [ "/build.sh" ]
