# -*- encoding: utf-8 -*-
# stub: vagrant-goodhosts 1.1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "vagrant-goodhosts".freeze
  s.version = "1.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniele Scasciafratte".freeze]
  s.date = "2022-05-17"
  s.description = "Enables Vagrant to update hosts file on the host machine with goodhosts".freeze
  s.email = ["mte90net@gmail.com".freeze]
  s.homepage = "https://github.com/goodhosts/vagrant".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2".freeze)
  s.rubygems_version = "3.1.6".freeze
  s.summary = "Enables Vagrant to update hosts file on the host machine with goodhosts".freeze

  s.installed_by_version = "3.1.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, [">= 2.2.10"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<os>.freeze, [">= 0"])
  else
    s.add_dependency(%q<bundler>.freeze, [">= 2.2.10"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<os>.freeze, [">= 0"])
  end
end
