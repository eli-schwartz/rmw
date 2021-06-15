FROM andy5995/meson
COPY . /usr/src/rmw
WORKDIR /usr/src/rmw
RUN meson builddir
RUN ninja -C builddir
RUN ninja -C builddir dist
