# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twisteners_session',
  :secret      => '8ce5b77a9157062172b7be19602aaea8711a5f9b4ebd925e88f9a4e163b3e1c182ead0202a9916bbbdf31f074fbc24811fa49d1b17ad461a1ab840b5cdcd8507'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
