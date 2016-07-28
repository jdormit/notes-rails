module ApplicationHelper
  def markdown(text)
    options = {
      hard_wrap: true,
      link_attributes: {rel: 'nofollow', target: "_blank"},
      space_after_headers: true
    }

    extensions = {
      autolink: true,
      superscript: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true
    }

    @renderer ||= Redcarpet::Render::HTML.new(options)
    @markdown ||= Redcarpet::Markdown.new(renderer, extensions)

    @markdown.render(text)
  end
end
