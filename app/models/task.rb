class Task < ApplicationRecord
  enum status: { todo: 0, doing: 1, done: 2 }
  validates :title, presence: true
  validates :status, presence: true
  validates :deadline, presence: true

  searchable_columns = %w[title description] # Remplacez ces colonnes par celles de votre modèle Task

  def self.ransackable_attributes(auth_object = nil)
    searchable_columns + _ransackers.keys
  end
  # validate :deadline, :must_start_from_today

  # def must_start_from_today
  #   errors.add(:deadline, 'must start from today.') if deadline.present? && deadline < Date.current
  # end
end
