# -*- encoding: utf-8 -*-

module Webgen::ContentProcessor

  # Converts content in RDoc markup (the native Ruby documentation format) to HTML. Needs the newer
  # RDoc implementation provided as +rdoc+ gem!
  class RDoc

    # Convert the content in RDoc markup to HTML.
    def call(context)
      require 'rdoc/markup/to_html'
      context.content = ::RDoc::Markup::ToHtml.new.convert(context.content)
      context
    rescue LoadError
      raise Webgen::LoadError.new('rdoc/markup/to_html', self.class.name, context.dest_node, 'rdoc')
    end

  end

end
