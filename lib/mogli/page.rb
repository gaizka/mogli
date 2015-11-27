module Mogli
  class Page < Profile
    set_search_type

    define_properties :id, :name, :category, :username, :access_token, :namespace, :options, :nickname

    # General
    define_properties :likes, :link, :picture, :has_added_app, :website, :description, :can_post, :checkins, :general_info, :cover, :is_published, :about, :talking_about_count, :perms

    # Retail
    define_properties :founded, :products, :mission, :company_overview

    # Musicians
    define_properties :record_label, :hometown, :band_members, :genre

    # Restaurants
    define_properties :parking, :public_transit, :hours, :payment_options, :restaurant_services, :restaurant_specialties

    # As a like
    define_properties :created_time

    has_association :tabs, "Tab"

    has_association :global_brand_children, "Page"
    define_properties :global_brand_parent_page

    def client_for_page
      if access_token.nil? || access_token.empty?
        raise MissingAccessToken.new("You can only get a client for this page if an access_token has been provided. i.e. via /me/accounts")
      end
      Client.new(access_token)
    end

    def self.recognize?(hash)
      hash.has_key?("category")
    end

    class MissingAccessToken < StandardError
    end

  end

end
