class Issue < ApplicationRecord
  scope :filtered, ->(filter) { where('title LIKE ? OR body LIKE ?', "%#{filter[:predicate]}%", "%#{filter[:predicate]}%") }

  def self.parse(options = {user_name: 'plataformatec', project_name: 'devise'})
    page_num = 0
    last_page = 1

    ActiveRecord::Base.transaction do
      while((page_num += 1) <= last_page) do
        begin
        issues_content = RestClient.get(
          "https://api.github.com/repos/#{options[:user_name]}/#{options[:project_name]}/issues?per_page=100&page=#{page_num}"
        )
        rescue => e
          return e.message
        end

        links = issues_content.headers[:link].to_s.split(',')
        last_page = links.last.split('page=').last.to_i if links.present? && last_page == 1

        JSON::parse(issues_content).each do |issue|
          Issue.create(
            title: issue['title'],
            body: issue['body'],
            issue_number: issue['number'],
            project_name: options[:project_name],
            user_name: options[:user_name]
          )
        end
      end
    end

    false
  end
end
