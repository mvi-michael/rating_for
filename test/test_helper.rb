require 'rubygems'
require 'active_record'
require 'active_record/test_case'
require 'active_record/fixtures'
require 'rating_for'

require 'test/unit'
require File.join(File.dirname(__FILE__) + '/../lib/generators/rating_for/migration/templates/migration')

ActiveRecord::Base.establish_connection({
  :adapter => 'sqlite3', :database => ':memory:'
})
# this is VERY important! during setting up fixtures there is checked if ActiveRecord::Base.configurations is not blank.
ActiveRecord::Base.configurations = {:test => true}

ActiveRecord::Schema.define do
  create_table :users, :force => true do |t|
    t.string :name
    t.timestamps
  end

  create_table :hotels, :force => true do |t|
    t.string :name
    t.timestamps
  end

  create_table :newspapers, :force => true do |t|
    t.string :name
    t.timestamps
  end
end

CreateRatingForTables.up
