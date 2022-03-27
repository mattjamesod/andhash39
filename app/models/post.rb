require "redcarpet"

class Post < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true, length: { minimum: 10 }
	
	def title_as_html
		markdown = Redcarpet::Markdown.new(RenderWithoutWrap, extensions = {})
		markdown.render(title)
	end
	
	def body_as_html
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
		markdown.render(body)
	end
end

class RenderWithoutWrap < Redcarpet::Render::HTML
	def postprocess(full_document)
    	Regexp.new(/\A<p>(.*)<\/p>\Z/m).match(full_document)[1] rescue full_document
	end
end
