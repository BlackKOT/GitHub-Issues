class Issue < ApplicationRecord
  scope :filtered, ->(filter) { where('title LIKE ? OR body LIKE ?', "%#{filter}%", "%#{filter}%") }
end
