require 'bundler/setup'
require 'uglifier'
# require_relative './lib/middleware/rack/downcase_headers'
require_relative './lib/patch/erb_force_encoding_fix'

Time.zone = 'Europe/Istanbul'

activate :syntax
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

set :date_format_long, {
  tr: "%d %B %Y, %A %H:%M",
  en: "%A, %B %-d, %Y, %-I:%M %p",
}
set :date_format_short, {
  tr: "%d %B %Y, %A",
  en: "%A, %B %-d, %Y",
}

config[:js_dir]     = 'public/js'
config[:css_dir]    = 'public/css'
config[:images_dir] = 'public/images'

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :blog do |blog|
  blog.name              = 'en'
  blog.prefix            = 'blog/en/'
  blog.permalink         = '{year}/{month}/{day}/{title}/index.html'
  blog.sources           = '{year}/{year}-{month}-{day}-{title}.html'
  blog.taglink           = 'tag/{tag}/index.html'
  blog.year_link         = 'year/{year}/index.html'
  blog.paginate          = true
  blog.per_page          = 10
  blog.page_link         = 'page/{num}'
  blog.summary_separator = /READ_MORE/
  # blog.summary_length    = nil
  blog.layout            = 'blog_detail'
  # blog.tag_template      = 'templates/blog-tag.html'
  # blog.calendar_template = 'templates/blog-calendar.html'
end

activate :directory_indexes


# page "/tr/blog/feed.xml", layout: false
# page "/en/blog/feed.xml", layout: false

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page "/sitemap.xml", layout: false
page "/google*.html", layout: false, directory_index: false
page "/version.txt", layout: false, directory_index: false


proxy_map = {
  en: {
    pages: ['about', 'contact', 'services', 'faq', 'privacy-policy', 'terms-of-service', 'blog', 'careers'],
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
  locals_val = { lang: :en }
  
  locals_val[:no_optimize] = true if ['contact', 'careers'].include?(folder_name)
  proxy "/en/#{folder_name}/index.html", 
        "/pages/en/#{folder_name}/index.html", 
        ignore: true,
        locals: locals_val
end
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
apps_folder_name = {
  tr: 'uygulamalar',
  en: 'apps',
}

proxy_map_apps = {
  tr: {
    'yengec': ['', 'destek', 'gizlilik'],
  },
}

proxy_map_apps.each do |lang, app_folders|
  app_folders.each do |app_name, folders|
    folders.each do |folder_name|
      proxy_web_url = "/#{lang}/#{apps_folder_name[lang]}/#{app_name}/#{folder_name}/index.html"
      proxy_web_url = "/#{lang}/#{apps_folder_name[lang]}/#{app_name}/index.html" if folder_name == ''
      
      proxy_render_url = "/pages/#{lang}/#{apps_folder_name[lang]}/#{app_name}/#{folder_name}/index.html"
      proxy_render_url = "/pages/#{lang}/#{apps_folder_name[lang]}/#{app_name}/index.html" if folder_name == ''
      proxy proxy_web_url, proxy_render_url, ignore: true
    end
  end
end
# -----------------------------------------------------------------------------
# proxy "/target-path.html", "/template-file.html", locals: { some_variable: "value" }

configure :development do
  # use ::Rack::DowncaseHeaders
  activate :livereload, host: '127.0.0.1'
  config[:post_form_url] = 'http://localhost:3000'
end

configure :build do
  activate :minify_javascript,
    compressor: proc {
      ::Uglifier.new(:harmony => true, :mangle => {:toplevel => false}, :compress => {:unsafe => true})
    }
  config[:post_form_url] = 'https://form-to-slack-vercel-8yto.vercel.app'
end

unless ARGV.include?('console')
  activate :external_pipeline,
    name: :tailwind,
    command: "BROWSERSLIST_IGNORE_OLD_DATA=true npx --prefix ./tailwindcss tailwindcss -c ./tailwindcss/tailwind.config.js -i ./tailwindcss/source.css -o ./dist/public/css/site.css -m #{"--watch" unless build?}",
    latency: 2,
    source: "./dist/",
    ignore_exit_code: true
end
