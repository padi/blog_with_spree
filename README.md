# Blog With Spree

Sample app that demonstrates a spree issue: https://github.com/spree/spree/issues/8298
The issue was previously deemed fixed but I'm not sure which tests cover it,
since https://github.com/spree/spree/pull/8297 did not have a test.

## Local Installation

```
git clone git@github.com:padi/blog_with_spree.git
cd blog_with_spree
bundle install
```

## Test that demonstrates the bug

```
DISABLE_SPRING=1 rails test test/models/application_record_test.rb
```

The temporary fix is created in: `app/models/application_record.rb`,
specifically overriding `ApplicationRecord.belongs_to_required_by_default`

```ruby
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
   # Temporary fix by opting out from mattr_accessor :belongs_to_required_by_default
  def self.belongs_to_required_by_default
    true
  end
end
```

... but that fix would only work for models that inherit from ApplicationRecord,
which may not include other models from other engines.
