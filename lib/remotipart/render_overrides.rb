module Remotipart
  # Responder used to automagically wrap any non-xml replies in a text-area
  # as expected by iframe-transport.
  module RenderOverrides
    include ERB::Util

    def self.included(base)
      base.class_eval do
        # Use neither alias_method_chain nor prepend for compatibility
        alias render_without_remotipart render
        alias render render_with_remotipart
      end
    end

    def render_with_remotipart *args
      render_without_remotipart(*args)
      response_body
    end
  end
end
