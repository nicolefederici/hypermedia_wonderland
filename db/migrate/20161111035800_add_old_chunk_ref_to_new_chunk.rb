class AddOldChunkRefToNewChunk < ActiveRecord::Migration[5.0]
  def change
    add_reference :newchunks, :oldchunk, index: true, foreign_key: true
  end
end
