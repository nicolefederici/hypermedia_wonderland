class AddRefToOldChunk < ActiveRecord::Migration[5.0]
  def change
    add_reference :oldchunks, :project, index: true, foreign_key: true
  end
end
