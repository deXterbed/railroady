['version', 'options_struct', 'models_diagram', 'controllers_diagram', 'aasm_diagram'].each { |f| require "railroad/#{f}" }

