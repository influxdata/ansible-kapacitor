require 'serverspec'

set :backend, :exec

describe service('kapacitor') do
  it { should be_running }
  it { should be_enabled }
end

describe service('kapacitor') do
  it { should be_running }
  it { should be_enabled }
end

describe file('/usr/local/etc/kapacitor/tick') {
  it { should be_directory }
}

describe file('/usr/local/etc/kapacitor/tick/script') {
  it { should be_directory }
}

describe file('/usr/local/etc/kapacitor/tick/template') {
  it { should be_directory }
}

describe file('/usr/local/etc/kapacitor/tick/var') {
  it { should be_directory }
}

describe file('/usr/local/etc/kapacitor/tick/template/example.tick') do
  it { should be_file }
end

describe file('/usr/local/etc/kapacitor/tick/var/example.json') do
  it { should be_file }
end

describe file('/etc/kapacitor/kapacitor.conf') do
  its(:content) { should match /[[httppost]]/ }
  its(:content) { should match /headers = {  Example = "your-key",  ExampleTwo = "your-key-2",  }/ }
  it { should be_file }
end

describe command('kapacitor list templates') do
  its(:stdout) { should match /example.*stream/ }
end

describe command('kapacitor list tasks') do
  its(:stdout) { should match /example.*disabled.*false/ }
  its(:stdout) { should match /template_test.*enabled.*true/ }
end
