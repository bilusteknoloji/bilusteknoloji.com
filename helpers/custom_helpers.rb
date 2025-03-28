module CustomHelpers
  def inspect(*objs)
    out = []
    out << '<div class="debug-inspect">'
    out << objs.map{|obj| escape_html(obj) }
    out << '</div>'
    out.join("\n")
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

end