require 'middleman-core/renderers/erb'

module Middleman
  module Renderers
    class ERb::Template
      def precompiled_template(locals)
        super.dup.force_encoding('utf-8')
      end
    end
  end
end
