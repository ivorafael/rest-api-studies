# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4 
# requires secret_key_base or secret_token to be defined, otherwise an 
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
RestApiPrototypeV3::Application.config.secret_token = 'fab8eaeb2e91332e733b3d4e70a5f702da81f310aa39f62a1e01aac8d99e523e58cea0023dcdd4d4ea0e423ab0f13ddf7ebe5b2a73d0a5ffc88b66eed8067569'
