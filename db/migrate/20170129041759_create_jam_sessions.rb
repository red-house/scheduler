class CreateJamSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :jam_sessions do |t|
      t.integer  :band_id, null: false
      t.integer  :band_member_id, null: false
      t.integer  :candidate_id, null: false
      t.tstzrange :duration, null: false

      t.timestamps
    end
    execute "ALTER TABLE jam_sessions ADD COLUMN start_time timestamp with time zone NOT NULL"
    execute "ALTER TABLE jam_sessions ADD COLUMN end_time timestamp with time zone NOT NULL"
    # Add constraint on band members scheduled for same session times
    execute "CREATE EXTENSION btree_gist;"
    execute <<-SQL
      ALTER TABLE jam_sessions
        ADD CONSTRAINT one_session_duration_per_band_member
          EXCLUDE USING GIST (band_member_id WITH =, duration WITH &&);
    SQL
    add_index :jam_sessions, :band_id
    add_index :jam_sessions, :band_member_id
  end
end
