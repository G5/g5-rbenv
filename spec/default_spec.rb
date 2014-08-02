require 'spec_helper'

describe 'g5-rbenv::default' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  it 'includes the rbenv default recipe' do
    expect(chef_run).to include_recipe('rbenv::default')
  end

  it 'includes the ruby_build recipe' do
    expect(chef_run).to include_recipe('rbenv::ruby_build')
  end

  it 'installs the default global ruby'
  it 'installs bundler in the default ruby'
  it 'sets permissions on the rbenv dir'
  it 'adds vagrant to the rbenv group'
end
