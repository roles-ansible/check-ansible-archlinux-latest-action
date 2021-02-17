FROM archlinux:latest

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-archlinux-latest-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-archlinux-latest-action"

LABEL "com.github.actions.name"="check-ansible-archlinux-latest"
LABEL "com.github.actions.description"="Check ansible role or playbook with Archlinux"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

RUN pacman -Syu --noconfirm && pacman -S --noconfirm \
    ansible \
    git

RUN ansible --version

ADD ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
