


For unit test file arrangement, the top-level lib directory of your application is
assumed to be in Ruby’s load path by all other components of the application. 
Your test code would then be as follows: 
```ruby
require 'test/unit'
require 'roman'

class TestRoman < Test::Unit::TestCase
    # ...
end
```

And run it using this:
```bash
ruby -I path/to/app/lib path/to/app/test/test_roman.rb
```

