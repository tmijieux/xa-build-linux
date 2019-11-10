FROM xa-build

WORKDIR /src
COPY ./build.sh /
RUN sudo chmod +x /build.sh \
    && sudo chown builduser:builduser /build.sh
USER builduser
CMD ["/build.sh"]

