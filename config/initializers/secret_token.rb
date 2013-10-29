# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
WIMS::Application.config.secret_key_base = '2997e25262f4b3cc98fef3a6844697f158c7eb88f3fa6528a5e2cbf793a438a46695fd4aa3c78a9db7b2ce999125852b40f1719d5f3446f204584cf94890e38b'
