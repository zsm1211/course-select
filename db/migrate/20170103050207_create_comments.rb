class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :course, index: true
      t.belongs_to :user, index: true
      t.integer :item_one
      t.integer :item_two
      t.integer :item_three
      t.integer :item_four
      t.integer :item_five
      t.integer :item_six
      t.integer :item_seven
      t.integer :item_eight
      t.integer :item_nine
      t.integer :item_ten
      t.integer :item_eleven
      t.integer :item_twelve
      t.integer :item_thirteen
      t.integer :item_fourteen
      t.integer :item_fifteen
      t.integer :item_sixteen
      t.integer :item_seventeen
      t.text :comment_advantage
      t.text :comment_disadvantage
      t.boolean :commented,default: false
      t.timestamps null: false
    end
  end
end
