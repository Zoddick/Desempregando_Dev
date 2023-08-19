class Position < ApplicationRecord
  belongs_to :company
  has_many :applicants

  enum career: [:developer, :business_inteligence, :information_technology,
                :design, :product, :technology, :other]
  enum contract: [:clt, :pj, :match]

  validates :name, :career, :contract, :city, :state, :summary, presence: true

  before_save :set_slug

  def is_remote
    if self.remote == true
      return true
    else
      return false
    end
  end

  def is_full_time
    if self.full_time == true
      return true
    else
      return false
    end
  end

  private

  def set_slug
    self.slug = "#{self.company.name.parameterize}-#{self.name.parameterize}"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["career", "city", "company_id", "contract", "created_at", "description", "id", "name", "publish", "remote", "slug", "state", "summary", "updated_at"]
  end


end
