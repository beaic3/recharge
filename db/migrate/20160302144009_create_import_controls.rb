class CreateImportControls < ActiveRecord::Migration
  def change
    create_table :import_controls do |t|
      t.integer :last_id, default:0
      t.timestamps
    end
  end
end