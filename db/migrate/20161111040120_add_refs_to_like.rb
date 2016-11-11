class AddRefsToLike < ActiveRecord::Migration[5.0]
  def change
    add_reference :likes, :user, index: true, foreign_key: true
    add_reference :likes, :newchunk, index: true, foreign_key: true
  end
end
