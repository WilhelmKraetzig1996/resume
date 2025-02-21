FROM debian:12

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
 apt-get install --yes --no-install-recommends \
 git \
 ca-certificates \
 inotify-tools \
 lmodern \
 make \
 texlive-fonts-recommended \
 texlive-latex-recommended \
 texlive-lang-english \
 texlive-lang-portuguese \
 texlive-fonts-extra \
 texlive-xetex \
 fonts-font-awesome \
 fontconfig && \
 apt-get autoclean && apt-get --purge --yes autoremove && \
 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN fc-cache -f -v

CMD pdflatex main.tex

WORKDIR /latex
