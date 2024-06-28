FROM opensuse/leap:15

LABEL "maintainer"="hvsharma12"
LABEL "repository"="https://github.com/HVSharma12/check-ansible-opensuseleap-15-action.git"
LABEL "homepage"="https://github.com/HVSharma12/check-ansible-opensuseleap-15-action"

LABEL "com.github.actions.name"="check-ansible-opensuse-leap-15"
LABEL "com.github.actions.description"="Check ansible role or playbook with opensuse leap 15"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

RUN zypper refresh && zypper install -y \
  ansible \
  systemd \
  python3-rpm \
  git \
  && zypper clean -a

RUN ansible --version

ADD ansible-docker.sh /ansible-docker.sh
RUN chmod +x /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
