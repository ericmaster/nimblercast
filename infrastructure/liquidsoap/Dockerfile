FROM debian:jessie

MAINTAINER Eric Aguayo ericmaster@nimblersoft.com

RUN apt-get -q update && \
    apt-get install -y apt-utils && \
    apt-get install -y lame libmp3lame-dev libmad0-dev libshout3-dev libvorbis-dev libtag1-dev libid3tag0-dev libpcre3-dev && \
    apt-get install -y build-essential && \
    apt-get install -y pkg-config m4 opam && \
    apt-get clean

RUN adduser --disabled-password --gecos "" liquidsoap

WORKDIR /home/liquidsoap

USER liquidsoap

RUN opam init -y && opam config setup -a && eval `opam config env` && \
    opam install base-bytes -y && \
    opam install taglib mad lame vorbis cry liquidsoap -y

#RUN opam config env >> .bashrc

ENV CAML_LD_LIBRARY_PATH "/home/liquidsoap/.opam/system/lib/stublibs:/usr/lib/ocaml/stublibs"
ENV MANPATH "/home/liquidsoap/.opam/system/man:"
ENV MAKELEVEL ""
ENV MAKEFLAGS ""
ENV PERL5LIB "/home/liquidsoap/.opam/system/lib/perl5"
ENV OCAML_TOPLEVEL_PATH "/home/liquidsoap/.opam/system/lib/toplevel"
ENV PATH "/home/liquidsoap/.opam/system/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

VOLUME ["/etc/liquidsoap", "/var/log/liquidsoap"]

CMD ["liquidsoap", "/etc/liquidsoap/nimblercast.liq"]

