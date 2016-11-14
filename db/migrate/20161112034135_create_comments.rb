class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer "newchunk_id"
      t.index ["newchunk_id"], name: "index_comments_on_newchunk_id"
      t.integer "user_id"
      t.index ["user_id"], name: "index_comments_on_user_id"
    end
  end
end
