def declare_gems(activerecord_version)
  source :rubygems

  gem 'activerecord', activerecord_version

  if activerecord_version < '3.1'
    gem 'mysql2', '< 0.3'
  else
    # use our own fork for bulk load support until issue fixed:
    # https://github.com/brianmario/mysql2/pull/242
    gem 'mysql2', '~> 0.3.16'
  end

  gem 'mysql'

  gem 'pg'
  gem 'activerecord-sqlserver-adapter'
  gem 'test-unit'
  gem 'awesome_print'
  gem 'rake'
  gem 'flexmock'
end
