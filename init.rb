require 'redmine'

Redmine::Plugin.register :redmine_ldap_sync do
  name 'Redmine LDAP Sync'
  author 'Ricardo Santos, Taine Woo'
  author_url 'https://github.com/tainewoo'
  description 'Syncs users and groups with ldap'
  url 'https://github.com/tainewoo/redmine_ldap_sync'
  version '2.2.0'
  requires_redmine :version_or_higher => '2.1.0'

  settings :default => HashWithIndifferentAccess.new()
  menu :admin_menu, :ldap_sync, { :controller => 'ldap_settings', :action => 'index' }, :caption => :label_ldap_synchronization,
                    :html => {:class => 'icon icon-ldap-sync'}
end

RedmineApp::Application.config.after_initialize do
  require "#{File.dirname(__FILE__)}/lib/ldap_sync/core_ext"
  require "#{File.dirname(__FILE__)}/lib/ldap_sync/infectors"
end

# hooks
require "#{File.dirname(__FILE__)}/lib/ldap_sync/hooks"
