server '52.198.243.0', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/ubuntu/.ssh/id_rsa'
