class CreateSectionsDays < ActiveRecord::Migration[6.0]
  def change
    create_join_table :sections, :days do |t|
      t.index [:section_id, :day_id]
      t.index [:day_id, :section_id]
    end
  end
end
