require 'spec_helper'

describe 'ruby-build dependencies' do
  describe package('autoconf') do
    it { is_expected.to be_installed }
  end

  describe package('bison') do
    it { is_expected.to be_installed }
  end

  describe package('build-essential') do
    it { is_expected.to be_installed }
  end

  describe package('libssl-dev') do
    it { is_expected.to be_installed }
  end

  describe package('libyaml-dev') do
    it { is_expected.to be_installed }
  end

  describe package('libreadline6-dev') do
    it { is_expected.to be_installed }
  end

  describe package('zlib1g-dev') do
    it { is_expected.to be_installed }
  end

  describe package('libncurses5-dev') do
    it { is_expected.to be_installed }
  end

  describe package('libffi-dev') do
    it { is_expected.to be_installed }
  end

  describe package('libgdbm3') do
    it { is_expected.to be_installed }
  end

  describe package('libgdbm-dev') do
    it { is_expected.to be_installed }
  end
end
