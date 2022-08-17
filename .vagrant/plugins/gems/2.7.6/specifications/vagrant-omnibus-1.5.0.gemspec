# -*- encoding: utf-8 -*-
# stub: vagrant-omnibus 1.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "vagrant-omnibus".freeze
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Seth Chisamore".freeze]
  s.date = "2016-08-31"
  s.description = "A Vagrant plugin that ensures the desired version of Chef is installed via the platform-specific Omnibus packages.".freeze
  s.email = ["schisamo@chef.io".freeze]
  s.homepage = "https://github.com/chef/vagrant-omnibus".freeze
  s.licenses = ["Apache 2.0".freeze]
  s.rubygems_version = "3.1.6".freeze
  s.summary = "A Vagrant plugin that ensures the desired version of Chef is installed via the platform-specific Omnibus packages.".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 11.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<chefstyle>.freeze, ["~> 0.4.0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, ["~> 11.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<chefstyle>.freeze, ["~> 0.4.0"])
  end
end
