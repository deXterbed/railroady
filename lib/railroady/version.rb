require 'yaml'
module RailRoady
  module VERSION #:nodoc:
    f = File.join(File.dirname(__FILE__), '..', '..', 'VERSION.yml')
    if File.exist?(f)
      config = YAML.load(File.read(f))
      MAJOR = config[:major]
      MINOR = config[:minor]
      PATCH = config[:patch]
    else
      MAJOR = MINOR = PATCH = 0
    end
    STRING = [MAJOR, MINOR, PATCH].join('.')
  end
end
