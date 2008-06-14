require 'webgen/tag'

module Webgen::Tag

  # Provides easy access to the meta information of a node.
  class Metainfo

    include Base

    def call(tag, body, context)
      output = ''
      if tag == 'lang'
        output = context.content_node.lang
      elsif context.content_node[tag]
        output = context.content_node[tag].to_s
      else
        log(:warn) { "No value for tag '#{tag}' in <#{context.ref_node.absolute_lcn}> found in <#{context.content_node.absolute_lcn}>" }
      end
      output
    end

  end

end
