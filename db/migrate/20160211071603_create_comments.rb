class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.boolean :status
      t.belongs_to :post, index: true, foreign_key: true
      t.belongs_to :visitor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
