class SkillApplicant < ApplicationRecord
  belongs_to :skill
  belongs_to :applicant
end
