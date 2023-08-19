class CreateSkillApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :skill_applicants do |t|
      t.references :skill, null: false, foreign_key: true
      t.references :applicant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
