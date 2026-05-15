FROM archlinux:latest

LABEL maintainer="Mint OS Team"
LABEL description="Mint OS ISO Builder — runs on any machine with Docker"
LABEL version="2.0"

# Update keyring first, then install build dependencies
RUN pacman -Sy --noconfirm archlinux-keyring && \
    pacman -Su --noconfirm && \
    pacman -S --noconfirm --needed \
        archiso \
        dosfstools \
        e2fsprogs \
        libisoburn \
        squashfs-tools \
        mtools \
        grub \
        efibootmgr \
        syslinux \
        curl \
        wget \
        git \
        rsync \
        imagemagick \
        perl-image-exiftool \
        plymouth \
    && pacman -Scc --noconfirm

# Create build & output directories
WORKDIR /build
RUN mkdir -p /output /build/mint-os/build-logs

# Copy the Mint OS profile into the container
COPY .. /build/mint-os/

# Set execute permissions on all scripts
RUN find /build/mint-os/airootfs/usr/local/bin/ -name "mint-*" -exec chmod +x {} \; && \
    chmod +x /build/mint-os/build.sh && \
    chmod 440 /build/mint-os/airootfs/etc/sudoers.d/mintos 2>/dev/null || true && \
    chmod 400 /build/mint-os/airootfs/etc/shadow 2>/dev/null || true

# Install Plymouth theme
RUN if [ -d /build/mint-os/airootfs/usr/share/mint-os/plymouth-theme ]; then \
        mkdir -p /usr/share/plymouth/themes/mintos && \
        cp -r /build/mint-os/airootfs/usr/share/mint-os/plymouth-theme/. \
              /usr/share/plymouth/themes/mintos/ && \
        if [ -f /build/mint-os/airootfs/usr/share/pixmaps/mintos-logo.png ]; then \
            cp /build/mint-os/airootfs/usr/share/pixmaps/mintos-logo.png \
               /usr/share/plymouth/themes/mintos/logo.png; \
        fi; \
        convert -size 1920x1080 gradient:'#0a0f0a-#0d160d' \
            /usr/share/plymouth/themes/mintos/background.png 2>/dev/null || true; \
    fi

# Install GRUB theme
RUN if [ -d /build/mint-os/grub/themes/mint ]; then \
        mkdir -p /usr/share/grub/themes/mint && \
        cp -r /build/mint-os/grub/themes/mint/. /usr/share/grub/themes/mint/ && \
        if [ -f /build/mint-os/airootfs/usr/share/pixmaps/mintos-logo.png ]; then \
            cp /build/mint-os/airootfs/usr/share/pixmaps/mintos-logo.png \
               /usr/share/grub/themes/mint/logo.png; \
        fi; \
        convert -size 1920x1080 gradient:'#0a0f0a-#0d160d' \
            /usr/share/grub/themes/mint/background.png 2>/dev/null || true; \
    fi

VOLUME ["/output"]

ENTRYPOINT ["/bin/bash", "-c", \
    "echo '=== Mint OS Docker Builder ===' && \
     cd /build/mint-os && \
     ./build.sh --output /output && \
     echo '' && \
     echo '=== Build complete! ISO is in the output/ folder ==='"]
