class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences, id: :uuid do |t|
      t.string :entreprise
      t.string :position_held
      t.string :start_date
      t.string :end_date
      t.belongs_to :user , type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
