module CustomHelpers
  def inspect(*objs)
    out = []
    out << '<pre class="overflow-auto whitespace-pre-line border p-5 mb-5">'
    objs.each do |obj|
      out << escape_html(obj)
    end
    out << '</pre>'
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