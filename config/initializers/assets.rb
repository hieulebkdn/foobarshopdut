# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w( main.js )
Rails.application.config.assets.precompile += %w( owl.carousel.min.js )
Rails.application.config.assets.precompile += %w( jquery.sticky)
Rails.application.config.assets.precompile += %w( jquery.easing.1.3.min )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( font-awesome.min.css )
Rails.application.config.assets.precompile += %w( owl.carousel.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( responsive.css )
Rails.application.config.assets.precompile += %w( bxslider.min.js )
Rails.application.config.assets.precompile += %w( script.slider.js )
Rails.application.config.assets.precompile += %w( css/styles.css )
Rails.application.config.assets.precompile += %w( css/responsive.css )
Rails.application.config.assets.precompile += %w( css/bootstrap.css )
Rails.application.config.assets.precompile += %w( css/font-awesome.min.css )
Rails.application.config.assets.precompile += %w( login/main.css )
Rails.application.config.assets.precompile += %w( login/util.css )
