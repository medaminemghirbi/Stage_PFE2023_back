class CreateCandidature < ActiveRecord::Migration[7.0]
  def change
    create_table :candidatures, id: :uuid do |t|
      t.date :date_postulation
      t.integer :etat, :default => 0
      t.datetime :interview_date
      t.timestamps
    end
  end
end
