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
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


# proxy "/target-path.html", "/template-file.html", locals: { some_variable: "value" }

proxy "/en/apps/trivia-wars/support/index.html", "/pages/en/apps/trivia-wars/support/index.html", ignore: true

proxy "/tr/uygulamalar/yengec/index.html", "/pages/tr/uygulamalar/yengec/index.html", ignore: true
proxy "/tr/uygulamalar/yengec/destek/index.html", "/pages/tr/uygulamalar/yengec/destek/index.html", ignore: true
proxy "/tr/uygulamalar/yengec/gizlilik/index.html", "/pages/tr/uygulamalar/yengec/gizlilik/index.html", ignore: true

activate :external_pipeline,
  name: :tailwind,
  command: "npx --prefix ./tailwindcss tailwindcss -c ./tailwindcss/tailwind.config.js -i ./tailwindcss/source.css -o ./dist/stylesheets/site.css -m #{"--watch" unless build?}",
  latency: 2,
  source: "./dist/"
