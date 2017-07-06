# -*- coding: utf-8 -*-
# vim: ft=sls
# Init foreman
{%- from "foreman/map.jinja" import foreman with context %}

{# Below is an example of having a toggle for the state #}
{% if foreman.enabled %}
include:
  - foreman.install
  - foreman.config
  - foreman.service
{% else %}
'foreman-formula disabled':
  test.succeed_without_changes
{% endif %}
