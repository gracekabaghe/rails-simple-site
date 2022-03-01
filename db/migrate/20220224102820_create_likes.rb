class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    unless table_exists? :likes
     create_table :likes, &:timestamps
   end
 end
end
