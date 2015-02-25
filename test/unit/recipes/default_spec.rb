require 'spec_helper'

describe 'g5-rbenv::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['rbenv']['ruby_version'] = ruby_version
    end.converge(described_recipe)
  end

  let(:ruby_version) { '1.9.3' }

  it 'includes the rbenv default recipe' do
    expect(chef_run).to include_recipe('rbenv::default')
  end

  it 'includes the ruby_build recipe' do
    expect(chef_run).to include_recipe('rbenv::ruby_build')
  end

  it 'installs the default global ruby' do
    expect(chef_run).to install_rbenv_ruby(ruby_version).with(global: true)
  end

  it 'installs bundler for the default ruby' do
    expect(chef_run).to install_rbenv_gem('bundler').with(ruby_version: ruby_version)
  end

  it 'sets permissions on the rbenv dir' do
    expect(chef_run).to run_execute('chmod -R 775 /opt/rbenv')
  end

  it 'adds vagrant to the rbenv group' do
    expect(chef_run).to create_group('rbenv').with(members: ['vagrant'])
  end

  it 'uses the overridden template for rbenv.sh' do
    expect(chef_run).to create_template('/etc/profile.d/rbenv.sh').with(
      source: 'rbenv.sh.erb',
      cookbook: 'g5-rbenv'
    )
  end
end
