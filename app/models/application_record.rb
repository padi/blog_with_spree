class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.belongs_to_required_by_default
    true
  end
end
