domain = 'bilusteknoloji.com'
xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc "https://#{domain}/"
    xml.changefreq "weekly"
    xml.priority "1.0"
    xml.lastmod Time.now.strftime('%Y-%m-%d')
  end
  
  %w[
    technical-consulting
  ].each do |page|
    xml.url do
      xml.loc "https://#{domain}/en/services/#{page}/"
      xml.changefreq "monthly"
      xml.priority "0.7"
      xml.lastmod File.mtime(sitemap.find_resource_by_path("pages/en/services/#{page}.html").source_file).strftime('%Y-%m-%d')
    end
  end
end