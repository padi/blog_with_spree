require 'test_helper'

class ApplicationRecordTest < ActiveSupport::TestCase
  test "Spree::Base shouldn't override Rails 5 default belongs_to_required_by_default" do
    refute Spree::Base.belongs_to_required_by_default, 'Spree::Base.belongs_to_required_by_default should be false'
    refute Spree::Product.belongs_to_required_by_default, 'Spree::Base.belongs_to_required_by_default should be false'
    assert ApplicationRecord.belongs_to_required_by_default, 'ApplicationRecord.belongs_to_required_by_default should be true'
    assert User.belongs_to_required_by_default, 'User.belongs_to_required_by_default should be true'
  end
end
