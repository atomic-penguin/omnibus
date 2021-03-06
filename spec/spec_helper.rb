require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start!

RSpec.configure do |config|
  config.before(:each) do
    # We need to stub the build_user_home because ChefSpec isn't smart enough
    # to realize that a resource has already been touched once the attribute
    # changes. Global state is hard...
    Chef::Recipe.any_instance.stub(:build_user_home)
      .and_return('/home/omnibus')
  end

  config.log_level = :fatal

  # Why aren't these the defaults?
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  # Set a default platform (this is overriden as needed)
  config.platform  = 'ubuntu'
  config.version   = '12.04'

  # Be random!
  config.order = 'random'
end
