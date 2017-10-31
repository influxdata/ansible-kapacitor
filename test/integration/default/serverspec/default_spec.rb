require 'serverspec'

set :backend, :exec

describe service('kapacitor') do
  it { should be_running }
  it { should be_enabled }
end
