class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.references :student, foreign_key: true
      t.references :section, foreign_key: true
      t.timestamps
    end
  end
end
