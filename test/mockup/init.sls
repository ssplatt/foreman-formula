{% from "foreman/map.jinja" import foreman with context %}

mockup_foreman_repos_foreman:
  pkgrepo.managed:
    - humanname: foreman
    - name: deb http://deb.theforeman.org/ jessie stable
    - file: /etc/apt/sources.list.d/foreman.list
    - key_url: http://deb.theforeman.org/pubkey.gpg

mockup_foreman_repos_foreman_plugins:
  pkgrepo.managed:
    - humanname: foreman plugins
    - name: deb http://deb.theforeman.org/ plugins stable
    - file: /etc/apt/sources.list.d/foreman.list
    - key_url: http://deb.theforeman.org/pubkey.gpg

mockup_foreman_set_hostname:
  cmd.run:
    - name: hostnamectl set-hostname localhost.local
    - onlyif:
      - which hostnamectl
    - unless:
      - test $(hostname -f) = "localhost.local"

mockup_foreman_edit_hosts_file:
  file.managed:
    - name: /etc/hosts
    - contents:
      - 127.0.0.1 localhost.local localhost
      - 127.0.1.1 localhost.local localhost
      - ::1 localhost.local localhost ip6-localhost ip6-loopback
      - ff02::1 ip6-allnodes
      - ff02::2 ip6-allrouters

mockup_foreman_edit_hostname_file:
  file.managed:
    - name: /etc/hostname
    - contents:
      - localhost.local

mockup_foreman_install_saltmaster:
  pkg.installed:
    - name: salt-master

mockup_foreman_salt_api_user:
  user.present:
    - name: saltuser
    - password: "$6$axpWTBXo$IOCQ6EwwB6nn1t/4cINNBssv.RPghw2Fhy3BM.b0FRbVjS6d3sjN9eQgINu.Eg8PwkDyYrfZ9wpK2DzZToSNN/"

mockup_foreman_saltmaster_settings:
  file.managed:
    - name: /etc/salt/master
    - source: salt://test/mockup/files/salt-master-conf.j2
    - user: root
    - group: root
    - mode: 644

mockup_foreman_saltmaster_service:
  service.running:
    - name: salt-master
    - enable: true
