# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

#Microblog::Application.config.secret_key_base = '826670f6fb47191fc6359e55d3165801cb2fcb2d63790dcaf65e7cb00bc68f831baec1ea2b921beebb980bee69652d0e31dd488b3313610304861f76bef84a52'

require 'securerandom'

def secure_token
    token_file = Rails.root.join('.secret')
    if File.exist?(token_file)
        # Use the existing token.
        File.read(token_file).chomp
    else
        # Generate a new token and store it in token_file.
        token = SecureRandom.hex(64)
        File.write(token_file, token)
        token
    end
end

Microblog::Application.config.secret_key_base = secure_token
