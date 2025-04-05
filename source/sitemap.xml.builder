domain = 'bilusteknoloji.com'
xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc "https://#{domain}/"
    xml.changefreq "weekly"
    xml.priority "1.0"
    xml.lastmod Time.now.strftime('%Y-%m-%d')
  end
  

  xml.url do
    xml.loc "https://#{domain}/en/blog/"
    xml.changefreq "weekly"
    xml.priority "0.8"
    sitemap_obj = sitemap.find_resource_by_path("en/blog/index.html")
    xml.lastmod File.mtime(sitemap_obj.source_file).strftime('%Y-%m-%d')
  end

  xml.url do
    xml.loc "https://#{domain}/en/contact/"
    xml.changefreq "monthly"
    xml.priority "0.7"
    sitemap_obj = sitemap.find_resource_by_path("en/contact/index.html")
    xml.lastmod File.mtime(sitemap_obj.source_file).strftime('%Y-%m-%d')
  end

  xml.url do
    xml.loc "https://#{domain}/en/about/"
    xml.changefreq "monthly"
    xml.priority "0.7"
    sitemap_obj = sitemap.find_resource_by_path("en/about/index.html")
    xml.lastmod File.mtime(sitemap_obj.source_file).strftime('%Y-%m-%d')
  end

  xml.url do
    xml.loc "https://#{domain}/en/services/"
    xml.changefreq "monthly"
    xml.priority "0.7"
    sitemap_obj = sitemap.find_resource_by_path("en/services/index.html")
    xml.lastmod File.mtime(sitemap_obj.source_file).strftime('%Y-%m-%d')
  end

  %w[
    technical-consulting
    software-development-management
    technical-assessment-and-risk-management
    data-management-and-analytics-solutions
    software-and-architecture-training
    digital-transformation-and-innovation

  ].each do |folder_name|
    xml.url do
      xml.loc "https://#{domain}/en/services/#{folder_name}/"
      xml.changefreq "monthly"
      xml.priority "0.7"
      sitemap_obj = sitemap.find_resource_by_path("en/services/#{folder_name}/index.html")
      xml.lastmod File.mtime(sitemap_obj.source_file).strftime('%Y-%m-%d')
    end
  end

  %w[
    yengec
  ].each do |folder_name|
    xml.url do
      xml.loc "https://#{domain}/tr/uygulamalar/#{folder_name}/"
      xml.changefreq "monthly"
      xml.priority "0.7"
      sitemap_obj = sitemap.find_resource_by_path("tr/uygulamalar/#{folder_name}/index.html")
      xml.lastmod File.mtime(sitemap_obj.source_file).strftime('%Y-%m-%d')
    end
    xml.url do
      xml.loc "https://#{domain}/tr/uygulamalar/#{folder_name}/destek/"
      xml.changefreq "monthly"
      xml.priority "0.3"
      sitemap_obj = sitemap.find_resource_by_path("tr/uygulamalar/#{folder_name}/destek/index.html")
      xml.lastmod File.mtime(sitemap_obj.source_file).strftime('%Y-%m-%d')
    end
    xml.url do
      xml.loc "https://#{domain}/tr/uygulamalar/#{folder_name}/gizlilik/"
      xml.changefreq "monthly"
      xml.priority "0.3"
      sitemap_obj = sitemap.find_resource_by_path("tr/uygulamalar/#{folder_name}/gizlilik/index.html")
      xml.lastmod File.mtime(sitemap_obj.source_file).strftime('%Y-%m-%d')
    end
  end

end