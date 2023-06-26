class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.references :teacher, foreign_key: true
      t.references :subject, foreign_key: true
      t.references :classroom, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.integer :duration
      t.timestamps
    end
  end
end
