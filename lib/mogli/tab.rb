module Mogli
  class Tab < Profile
    define_properties :id, :name, :link, :is_permanent, :position
    define_properties :custom_name, :is_non_connection_landing_tab
    
    hash_populating_accessor :application, "Application"
  end

end
