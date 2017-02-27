###
# Page options, layouts, aliases and proxies
###

ignore '/templates/*'

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Home
proxy "/index.html", "/templates/index.html"

# Localization
# activate :i18n

# Assets
set :css_dir, 'dist/stylesheets'
set :js_dir, 'dist/javascripts'
set :images_dir, 'dist/images'

# External pipeline
activate :external_pipeline,
  name: :gulp,
  command: build? ? 'gulp build --production' : './node_modules/gulp/bin/gulp.js',
  source: "dist",
  latency: 1

# Build-specific configuration
configure :build do
  ignore 'assets/*'
  activate :gzip
  activate :minify_html, remove_intertag_spaces: true
  activate :asset_hash
  activate :relative_assets
end

#helpers
helpers do
  def markdown(text)
    Tilt['markdown'].new { text }.render(scope=self)
  end
end
