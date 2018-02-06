class AddIsOpenAttribute < ActiveRecord::Migration
  def change
    add_column :semesters,:is_open,:boolean,:default=>false
  end
end
