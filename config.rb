activate :i18n

set :markdown_engine, :redcarpet
set :markdown, {
  fenced_code_blocks: true,
  smartypants: true,
  tables: true,
  underline: true,
  strikethrough: true,
  superscript: true,
  highlight: true,
}

activate :livereload
activate :directory_indexes
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/sitemap.xml", layout: false



proxy_map = {
  en: {
    pages: ['about', 'contact', 'services', 'faq', 'privacy-policy', 'terms-of-service'],
    services: [
      'technical-consulting',
      'software-development-management',
      'technical-assessment-and-risk-management',
      'data-management-and-analytics-solutions',
      'software-and-architecture-training',
      'digital-transformation-and-innovation',
    ]
  },
}
set :proxy_map, proxy_map

# -----------------------------------------------------------------------------
page '/en/services/*', layout: 'page'
proxy_map[:en][:services].each do |service_folder_name|
  proxy "/en/services/#{service_folder_name}/index.html", 
        "/pages/en/services/#{service_folder_name}/index.html", 
        ignore: true,
        locals: { lang: :en }
end
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
proxy_map[:en][:pages].each do |folder_name|
  page "/en/#{folder_name}/*", layout: 'page'
  proxy "/en/#{folder_name}/index.html", 
        "/pages/en/#{folder_name}/index.html", 
        ignore: true,
        locals: { lang: :en }
end
# -----------------------------------------------------------------------------

# proxy '/en/services/technical-consulting/index.html', '/pages/en/services/technical-consulting/index.html', ignore: true
# proxy '/en/services/software-development-management/index.html', '/pages/en/services/software-development-management/index.html', ignore: true

# proxy "/target-path.html", "/template-file.html", locals: { some_variable: "value" }

# page '/en/services/*', layout: 'page'
# proxy '/en/services/technical-consulting/index.html', '/pages/en/services/technical-consulting.html'


# proxy "/en/apps/trivia-wars/support/index.html", "/pages/en/apps/trivia-wars/support/index.html", ignore: true
#
# proxy "/tr/uygulamalar/yengec/index.html", "/pages/tr/uygulamalar/yengec/index.html", ignore: true
# proxy "/tr/uygulamalar/yengec/destek/index.html", "/pages/tr/uygulamalar/yengec/destek/index.html", ignore: true
# proxy "/tr/uygulamalar/yengec/gizlilik/index.html", "/pages/tr/uygulamalar/yengec/gizlilik/index.html", ignore: true

activate :external_pipeline,
  name: :tailwind,
  command: "npx --prefix ./tailwindcss tailwindcss -c ./tailwindcss/tailwind.config.js -i ./tailwindcss/source.css -o ./dist/stylesheets/site.css -m #{"--watch" unless build?}",
  latency: 2,
  source: "./dist/"
