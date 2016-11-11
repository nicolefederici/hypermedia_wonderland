class AddUserRefToNewChunk < ActiveRecord::Migration[5.0]
  def change
    add_reference :newchunks, :user, index: true, foreign_key: true
  end
end
