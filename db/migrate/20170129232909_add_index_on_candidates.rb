class AddIndexOnCandidates < ActiveRecord::Migration[5.0]
  def change
    add_index :jam_sessions, :candidate_id
  end
end
