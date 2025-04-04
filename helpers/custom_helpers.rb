module CustomHelpers
  def inspect(*objs)
    return unless development?
    out = []
    out << '<div class="debug-inspect">'
    out << objs.map{|obj| escape_html(obj) }
    out << '</div>'
    out.join("\n")
  end

  def get_resource_title_and_url_by_path(path)
    sitemap_obj = sitemap.find_resource_by_path(path)
    title = sitemap_obj.metadata[:page][:title]
    title = 'Home' if path == 'index.html'
    return [title, sitemap_obj.url]
  end

  def get_page_title_and_link(folder)
    return ['NO TITLE FOUND', '#'] unless config[:proxy_map][lang][:pages].include?(folder)

    sitemap_obj = sitemap.find_resource_by_path("#{lang}/#{folder}/index.html")
    return ['NO TITLE FOUND', '#'] unless sitemap_obj.present?

    title = 'TITLE NOT EXISTS'
    title = sitemap_obj.metadata[:page][:title] if sitemap_obj.metadata[:page]&.key?(:title)
    link = sitemap_obj.url
    
    return [title, link]
  end

  def markdown(input)
    mdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, config[:markdown])
    mdown.render(input)
  end

  def markdownify_text_only(text, **options)
    allowed_tags = options[:allowed_tags] || ['em', 'strong', 'a', 'code', 'kbd']
    attributes = options[:attributes] || {'a' => ['href']}
    Sanitize.fragment(markdown(text), elements: allowed_tags, attributes: attributes)
  end
end