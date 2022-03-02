class CreateComments < ActiveRecord::Migration[7.0]
  def change
    return if table_exists? :comments

    create_table :comments do |t|
      t.text :text
      t.belongs_to :post, index: true
      t.timestamps
    end
  end
end
