require 'adapter_extensions/base'

module ActiveRecordWithAdapterExtensions
  def establish_connection(*args)
    super(*args)
    ActiveSupport.run_load_hooks(:active_record_connection_established, connection_pool)
  end
end

ActiveRecord::Base.singleton_class.prepend ActiveRecordWithAdapterExtensions

ActiveSupport.on_load(:active_record_connection_established) do |connection_pool|
  AdapterExtensions.load_from_connection_pool connection_pool
end
