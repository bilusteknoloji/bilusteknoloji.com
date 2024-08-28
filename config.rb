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

activate :external_pipeline,
  name: :tailwind,
  command: "npx tailwindcss -c ./tailwindcss/tailwind.config.js -i ./tailwindcss/source.css -o ./dist/stylesheets/site.css -m #{"--watch" unless build?}",
  latency: 2,
  source: "./dist/"
