require 'i18n'
I18n.config.available_locales = :en
I18n.config.enforce_available_locales = true
I18n.fallbacks = [I18n.default_locale]

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


page '/en/services/*', layout: 'page'

services_en = %w[
  technical-consulting
  software-development-management
]

set :services_en, services_en

services_en.each do |foldername|
  proxy "/en/services/#{foldername}/index.html", "/pages/en/services/#{foldername}/index.html", ignore: true
end

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
