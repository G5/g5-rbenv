# G5 Rbenv #

A wrapper cookbook to install [rbenv](https://github.com/sstephenson/rbenv)
with the defaults for a G5 development environment.

## Current version ##

0.2.0

## Requirements ##

* [Chef](http://www.getchef.com) >= 10
* [Vagrant](http://www.vagrantup.com) >= 1.5
* [ChefDK](https://downloads.chef.io/chef-dk/) >= 0.4.0

## Installation ##

### New cookbook ###

We recommend using [ChefDK generators](https://docs.chef.io/ctl_chef.html)
to generate your new cookbook:

```console
$ chef generate cookbook my-cookbook
```

### Existing cookbook ###

The cookbook is currently only available via git. We recommend
using [Berkshelf](http://berkshelf.com) to manage the installation.

To initialize Berkshelf in your project, if you haven't done so
already:

```console
$ cd my-chef-cookbook
$ chef exec berks init
```

### All cookbooks ###

Add a dependency on g5-rbenv to your cookbook's metadata.rb:

```ruby
depends 'g5-rbenv'
```

To reference the git version of this cookbook, simply add the following line
to your `Berksfile`:

```ruby
cookbook 'g5-rbenv', git: 'git@github.com:G5/g5-rbenv.git', tag: '0.1.0'
```

## Usage ##

### Attributes ###

* `node['rbenv']['ruby_version']` - ruby version to install as global default

See the wrapped [rbenv cookbook](https://github.com/RiotGames/rbenv-cookbook#attributes)
for more attributes.

### Recipes ###

#### default ####

Installs rbenv, ruby_build, a default ruby, and bundler in a system-wide installation
accessible by users in the `rbenv` group (including the `vagrant` user).

### Resources / Providers ###

See the wrapped [rbenv cookbook](https://github.com/RiotGames/rbenv-cookbook#resources--providers)
for resources such as `rbenv_ruby`, `rbenv_gem`, and `rbenv_execute`.

## Examples ##

### Default installation ###

To install rbenv, include the default recipe in one of your cookbook's
recipes:

```ruby
include_recipe 'g5-rbenv::default'
```

### Changing the global ruby version ###

Override the `ruby_version` attribute:

```ruby
node.set['rbenv']['ruby_version'] = '1.9.3'
```

### Installing additional rubies ###

Use the `rbenv_ruby` resource to install other rubies in addition
to the default ruby:

```ruby
rbenv_ruby '2.0.0'
rbenv_ruby '1.9.3'
```

### Installing additional gems ###

Use the `rbenv_gem` resource to install gems for rbenv-managed
rubies:

```ruby
rbenv_gem 'rake' do
  ruby_version '2.1.2'
end
```

## Authors ##

* Maeve Revels / [@maeve](https://github/maeve)

## Contributions ##

1. Fork it
2. Set up your [development environment](#development-setup)
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Write your code and **specs**
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request

If you find bugs, have feature requests or questions, please
[file an issue](https://github.com/G5/g5-rbenv/issues).

### Development Setup ###

1. Clone the repository locally:

  ```console
  $ git clone git@github.com:G5/g5-rbenv.git
  $ cd g5-rbenv
  ```

2. Install required cookbooks using [Berkshelf](http://berkshelf.com/):

  ```console
  $ chef exec berks install
  ```

3. Provision an instance for testing using [test-kitchen](http://kitchen.ci):

  ```console
  $ chef exec kitchen converge
  ```

  See `chef exec kitchen help` for more test-kitchen commands.

### Specs ###

The unit tests use [ChefSpec](http://sethvargo.github.io/chefspec/),
and live in the `test/unit` directory. To execute the entire
suite:

```console
$ chef exec rspec
```

To run the [foodcritic](http://acrmp.github.io/foodcritic) linting tool:

```console
$ chef exec foodcritic .
```

The integration tests use [ServerSpec](http://serverspec.org), and live
in the `test/integration/default/serverspec` directory. To execute
the test suite:

```console
$ chef exec kitchen verify
```

## License ##

Copyright (c) 2014 G5

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
