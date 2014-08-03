include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

# Override /etc/profile.d/rbenv.sh
begin
  rbenv_template = resources(template: "/etc/profile.d/rbenv.sh")
  rbenv_template.source "rbenv.sh.erb"
  rbenv_template.cookbook "g5-rbenv"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "could not find template /etc/profile.d/rbenv.sh to modify"
end

# Install a global ruby and bundler
rbenv_ruby node[:rbenv][:ruby_version] do
  global true
end

rbenv_gem "bundler" do
  ruby_version node[:rbenv][:ruby_version]
end

# Should probably fix the apparently busted rbenv recipe.
execute "Set rbenv directory group permissions" do
  command "chmod -R 775 /opt/rbenv"
  action :run
end

# Should probably fix the apparently busted rbenv recipe.
execute "Add vagrant user to the rbenv group" do
  command "sudo usermod -a -G rbenv vagrant"
end
