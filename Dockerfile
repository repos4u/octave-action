# gnuoctave/octave

# Please follow docker best practices
# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/

# Docker images to build GNU Octave <https://www.octave.org>.

ARG OCTAVE_VERSION_MAJOR=8
FROM  gnuoctave/octave-build:${OCTAVE_VERSION_MAJOR}


# Update builder image with latest security updates
RUN apt-get --yes update  && \
    apt-get --yes upgrade && \
    pip3 install --upgrade --no-cache-dir \
      pip                           \
      sympy                         \
      || true                    && \
    apt-get --yes clean          && \
    apt-get --yes autoremove     && \
    rm -Rf /var/lib/apt/lists/*


# Install Octave
ARG OCTAVE_VERSION=8.4.0
ARG GNU_MIRROR=https://ftpmirror.gnu.org/octave
RUN mkdir -p /tmp/build  \
    && cd    /tmp/build  \
    && wget -q "${GNU_MIRROR}/octave-${OCTAVE_VERSION}.tar.gz"  \
    && tar -xf octave-${OCTAVE_VERSION}.tar.gz     \
    && cd      octave-${OCTAVE_VERSION}            \
    && ./configure    ${OCTAVE_CONFIGURE_ARGS}     \
          F77_INTEGER_8_FLAG="-fdefault-integer-8" \
    && make -j8      \
    && make install  \
    && rm -rf /tmp/build


COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]