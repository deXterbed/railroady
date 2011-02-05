# This suite of tasks generate graphical diagrams via code analysis.
# A UNIX-like environment is required as well as:
# 
# * The railroady gem. (http://github.com/preston/railroady)
# * The graphviz package which includes the `dot` and `neato` command-line utilities. MacPorts users can install in via `sudo port install graphviz`.
# * The `sed` command-line utility, which should already be available on all sane UNIX systems.
#
# Author: Preston Lee, http://railroady.prestonlee.com 
 
# Returns an absolute path for the following file.
def full_path(name = 'test.txt')
  f = File.join(Rails.root.to_s.gsub(' ', '\ '), 'doc', name)
  f.to_s
end
  
namespace :diagram do
 
  @MODELS_ALL_SVG = full_path('models_complete.svg').freeze
  @MODELS_BRIEF_SVG = full_path('models_brief.svg').freeze
  @CONTROLLERS_ALL_SVG = full_path('controllers_complete.svg').freeze
  @CONTROLLERS_BRIEF_SVG = full_path('controllers_brief.svg').freeze
 
  namespace :models do
 
    desc 'Generates an SVG class diagram for all models.'
    task :complete do
      f = @MODELS_ALL_SVG
      puts "Generating #{f}"
      sh "railroady -ilamM | dot -Tsvg > #{f}"
    end
 
    desc 'Generates an abbreviated SVG class diagram for all models.'
    task :brief do
      f = @MODELS_BRIEF_SVG
      puts "Generating #{f}"
      sh "railroady -bilamM | dot -Tsvg > #{f}"
    end
    
  end
  
  namespace :controllers do
 
    desc 'Generates an SVG class diagram for all controllers.'
    task :complete do
      f = @CONTROLLERS_ALL_SVG
      puts "Generating #{f}"
      sh "railroady -ilC | neato -Tsvg > #{f}"
    end
 
    desc 'Generates an abbreviated SVG class diagram for all controllers.'
    task :brief do
      f = @CONTROLLERS_BRIEF_SVG
      puts "Generating #{f}"
      sh "railroady -bilC | neato -Tsvg > #{f}"
    end
 
  end
 
  desc 'Generates all SVG class diagrams.'
  task :all => ['diagram:models:complete', 'diagram:models:brief', 'diagram:controllers:complete', 'diagram:controllers:brief']
 
end