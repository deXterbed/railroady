require 'rspec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'railroady'

# For RSpec v1
# Spec::Runner.configure do |config|
# end

# For RSpec v2
RSpec.configure do |c|
  # ....
end