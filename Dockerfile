FROM archlinux:latest

RUN pacman -Syu --noconfirm --disable-download-timeout \
    curl tar sudo grep binutils mono libzip unzip base-devel \
    jre8-openjdk jdk8-openjdk libxtst lib32-gcc-libs lib32-glibc \
    git lsb-release vim p7zip nuget zip gtk-sharp-2 referenceassemblies-pcl \
    && pacman -Scc --noconfirm

RUN pacman -Syu --noconfirm dotnet-runtime dotnet-sdk
RUN export dotnet6="https://download.visualstudio.microsoft.com/download/pr/20283373-1d83-4879-8278-0afb7fd4035e/56f204f174743b29a656499ad0fc93c3/dotnet-sdk-6.0.100-rc.2.21505.57-linux-x64.tar.gz" \
    && echo "${dotnet6}" \
    && curl -O "${dotnet6}" 


ARG USER_ID=1000
RUN useradd -m -u $USER_ID builduser \
    && passwd -d builduser \
    && printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers

RUN export NET="dotnet-sdk-6.0.100-rc.2.21505.57-linux-x64.tar.gz" \
    && mv "${NET}" /usr/share/dotnet/ \
    && cd /usr/share/dotnet/ \
    && tar xf "${NET}"
RUN dotnet --list-sdks

COPY msbuild /usr/local/bin
COPY build-xa.sh /
RUN chmod +rx /build-xa.sh /usr/local/bin/msbuild
WORKDIR /home/builduser/

USER builduser
CMD [ "/build-xa.sh" ]
