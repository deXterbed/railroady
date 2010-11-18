require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "railroady"
    gem.executables = "railroady"
    gem.email = ['conmotto@gmail.com', 'tcrawley@gmail.com', 'peter@hoeg.com', 'p.hoeg@northwind.sg', 'javier@smaldone.com.ar']
    gem.homepage = "http://github.com/preston/railroady"
    gem.authors = ["Preston Lee", "Tobias Crawley", "Peter Hoeg", "Javier Smaldone"]
    gem.summary = "Ruby on Rails 3 model and controller UML class diagram generator."
    gem.description = "Ruby on Rails 3 model and controller UML class diagram generator. Originally based on the 'railroad' plugin and contributions of many others. (`sudo port install graphviz` before use!)"
    gem.files = FileList["[A-Z]*", "{autotest,bin,lib,spec,tasks}/**/*", ".document"]
    gem.extra_rdoc_files = FileList["*.rdoc"]
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rspec'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
#  spec.libs << 'lib' << 'rspec'
  spec.pattern = FileList['rspec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
#  spec.libs << 'lib' << 'rspec'
  spec.pattern = 'rspec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
require 'railroady/version'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "railroady #{RailRoady::VERSION::STRING}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('CHANGELOG*')
  rdoc.rdoc_files.include('AUTHORS*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
