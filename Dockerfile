FROM archlinux:base-devel

RUN pacman -Syu --noconfirm
RUN mkdir /panoramas

# freepv
RUN pacman -S 'libxml2' \
    'libpng' \
    'freeglut' \
    'zlib' \
    'libjpeg-turbo' \
    'libxmu' \
    'libxt' \
    'libxxf86vm' \
    'cmake' \
    'mesa' \
    'git' \
    'glu' --noconfirm
RUN git clone https://github.com/bartoszwalicki/freepv.git
RUN cd freepv \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr/local . \
    && make && make install

# Hugin
RUN pacman -S hugin --noconfirm

# Perl Panotools-Script
RUN export PERL_MM_USE_DEFAULT=1 \
    && export PERL_EXTUTILS_AUTOINSTALL="--defaultdeps" \
    && perl -MCPAN -e 'install Panotools::Script'

# Bash config
RUN touch ~/.bashrc \
    && echo 'PATH="${PATH}:/usr/bin/site_perl"' >> ~/.bashrc