# hadolint ignore=DL3007
FROM archlinux:latest

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-archlinux-latest-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-archlinux-latest-action"

LABEL "com.github.actions.name"="check-ansible-archlinux-latest"
LABEL "com.github.actions.description"="Check ansible role or playbook with Archlinux"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

# TEMP-FIX for pacman issue from https://github.com/sickcodes/Docker-OSX/pull/150/files
# RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
# curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
# bsdtar -C / -xvf "$patched_glibc"

RUN pacman -Sy --noconfirm && pacman -S --noconfirm \
    ansible \
    git \
    && ansible --version

COPY ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
