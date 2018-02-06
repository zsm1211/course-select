class AddVisitAttribute < ActiveRecord::Migration
  def change
    add_column :grades,:open,:boolean,:default=>false
  end
end
