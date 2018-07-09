require 'active_support/core_ext'

module Outreach
  module Service
    class SequenceStep
      def initialize(client)
        @request = client.request
      end

      def find(id)
        response = @request.get("#{api_url}/#{id}")
        collection_class.build_from_attributes_hash(response['data'])
      end

      def find_all(attrs={})
        response = @request.get(api_url)
        response['data'].map do |attrs|
          collection_class.build_from_attributes_hash(attrs)
        end
      end

      protected

      def api_url

        "https://api.outreach.io/api/v2/sequenceSteps"
      end

      def collection_class
        Outreach::SequenceStep
      end

      def filter_attribute_mapping(attrs)
        if attrs[:first_name]
          attrs["filter[personal/name/first]"] = attrs.delete(:first_name)
        end
        if attrs[:last_name]
          attrs["filter[personal/name/last]"] = attrs.delete(:last_name)
        end
        attrs["filter[contact/email]"] = attrs.delete(:email) if attrs[:email]
        if attrs[:company_name]
          attrs["filter[company/name]"] = attrs.delete(company_name)
        end
        attrs
      end
    end
  end
end