module Outreach
  module Service
    class SequenceState
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

        "https://api.outreach.io/api/v2/sequenceStates"
      end

      def collection_class
        Outreach::SequenceState
      end

    end
  end
end