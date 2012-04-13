#
# Cookbook Name:: sendmail
# Recipe:: default
#
# Copyright 2011, Woof! Inc. Bryan Berry (bryan.berry@gmail.com) 
#
# Apache 2.0 license 
#


package 'sendmail' do
	action :install
end

service 'sendmail' do
	action [ :enable,:start ]
end

template "/etc/mail/sendmail.cf" do
	source "sendmail.cf.erb"
	notifies :restart,"service[sendmail]"
	variables({ :relay_host => node['smtp_relay_host'] })
end

template "/etc/mail/relay-domains" do
	source "relay-domains"
	notifies :restart,"service[sendmail]"
end



