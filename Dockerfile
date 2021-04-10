FROM ubuntu
LABEL maintainer="gosha20777 <gosha20777@live.ru>"

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
ENV DIR /bachelor-diploma

RUN mkdir $DIR
RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections
RUN apt update && \
    apt install -y wget \
        git \
        make \
        apt-transport-https \
        unzip && \
    apt install -y texlive-base \
        texlive-latex-extra \
        texlive-xetex \
        texlive-lang-cyrillic \
        texlive-fonts-extra \
        texlive-science \
        texlive-latex-recommended \
        latexmk

# Times New Roman and other fonts
RUN apt install -y --reinstall ttf-mscorefonts-installer && \
    wget -O /usr/share/fonts/xits-math.otf https://github.com/khaledhosny/xits-math/raw/master/XITSMath-Regular.otf && \
    wget https://ftp.tw.freebsd.org/distfiles/xorg/font/PTSansOFL.zip && \
    wget https://ftp.tw.freebsd.org/distfiles/xorg/font/PTMonoOFL.zip && \
    unzip -o PTSansOFL.zip -d /usr/share/fonts/ && unzip -o PTMonoOFL.zip -d /usr/share/fonts/ && \
    rm -f PTSansOFL.zip PTMonoOFL.zip && \
    fc-cache -f -v

VOLUME $DIR
WORKDIR $DIR

CMD make build && make clean