class CreateOldChunks < ActiveRecord::Migration[5.0]
  def change
    create_table :oldchunks do |t|
      t.string :title
      t.string :text
    end
  end
end
