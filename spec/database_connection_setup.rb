require './lib/database_connection'

def database_connection_setup
  if ENV['ENVIRONMENT'] == 'test'
    p "Setting up test database..."

    DatabaseConnection.setup('bookmark_manager_test')
    DatabaseConnection.query("TRUNCATE bookmarks;")
  else
    DatabaseConnection.setup('bookmark_manager')
  end
end
