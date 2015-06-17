set :rails_env, "fulltext_prod"
set :application, "fulltext_prod"
set :domain,      "rossini.cul.columbia.edu"
set :deploy_to,   "/local/passenger/#{application}/"
set :user, "deployer"
set :scm_passphrase, "Current user can full owner domains."

role :app, domain
role :web, domain
role :worker, domain
role :db,  domain, :primary => true
