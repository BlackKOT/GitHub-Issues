class Issue < ApplicationRecord
  scope :filtered, ->(filter) { where('title LIKE ? OR body LIKE ?', "%#{filter[:predicate]}%", "%#{filter[:predicate]}%") }

  def self.parse(user_name: 'plataformatec', project_name: 'devise')
    issues = RestClient.get("https://api.github.com/repos/#{user_name}/#{project_name}/issues")

    i = 0

    ActiveRecord::Base.transaction do

    end
  end
end
