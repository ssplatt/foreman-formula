require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('foreman') do
  it { should be_installed }
end

describe file('/etc/foreman-proxy/settings.d/salt.yml') do
  it { should exist }
end

describe file('/etc/sudoers.d/99_foreman-salt') do
  it { should exist }
end

describe file('/etc/foreman-proxy/settings.d/salt.yml') do
  it { should exist }
end

describe file('/etc/salt/autosign.conf') do
  it { should exist }
end

describe file('/etc/salt/foreman.yml') do
  it { should exist }
end

describe service('foreman') do
  it { should be_running }
end

describe service('foreman-proxy') do
  it { should be_running }
end
