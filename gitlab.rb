#nano /srv/gitlab/config/gitlab.rb

external_url 'https://services-data.com:4443'
letsencrypt['enable'] = false

nginx['listen_https'] = true
nginx['listen_port'] = 443
nginx['redirect_http_to_https'] = true

nginx['ssl_certificate'] = "/etc/gitlab/ssl/services-data.com.crt"
nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/services-data.com.key"
