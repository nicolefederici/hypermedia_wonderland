class CreateNewChunks < ActiveRecord::Migration[5.0]
  def change
    create_table :newchunks do |t|
      t.string :title
      t.string :text
      t.string :video_link
      t.string :image_link
      t.string :sound_link
    end
  end
end
