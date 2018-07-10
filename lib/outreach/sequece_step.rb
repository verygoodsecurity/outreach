require 'outreach/helpers'

module Outreach

  class SequenceStep
    include Helpers

    @@api_fields = [
        'id',
        'bounceCount',
        'clickCount',
        'deliverCount',
        'failureCount',
        'negativeReplyCount',
        'neutralReplyCount',
        'openCount',
        'optOutCount',
        'pauseReason',
        'positiveReplyCount',
        'repliedAt',
        'replyCount',
        'scheduleCount',
        'state',
        'stateChangedAt',
        'createdAt',
        'updatedAt',
        'activeAt',
    ]

    class << self
    end

    def initialize(attrs)
      @@api_fields.each do |f|
        self.class.send(:attr_accessor, Helpers.underscore(f))
      end

      # self.class.send(:attr_accessor, name)

      @@api_fields.each do |f|
        self.send("#{Helpers.underscore(f)}=", attrs[f])
      end

      # @id = attrs['id']
      # @bounce_count = attrs['bounceCount']
      # @click_count = attrs['clickCount']
      # @deliver_count = attrs['deliverCount']
      # @failure_count = attrs['failureCount']
      # @negative_reply_count = attrs['negativeReplyCount']
      # @neutral_reply_count = attrs['neutralReplyCount']
      # @open_count = attrs['openCount']
      # @out_out_count = attrs['optOutCount']
      # @positive_reply_count = attrs['positiveReplyCount']
      # @reply_count = attrs['replyCount']
      # @schedule_count = attrs['scheduleCount']
      #
      # @step_type = attrs['stepType']
      # @task_note = attrs['taskNote']
      #
      # @created_at = attrs['createdAt']
      # @updated_at = attrs['updatedAt']
    end

    def self.build_from_attributes_hash(attrs)
      result = {}

      result['id'] = attrs['id']
      result.merge!(attrs['attributes'])

      new(result)
    end

    private

    def self.to_ostruct(hash)
      o = OpenStruct.new(hash)
      hash.each.with_object(o) do |(k, v), o|
        o.send(:"#{k}=", to_ostruct(v)) if v.is_a? Hash
      end
      o
    end

    def self.nested_hash_value(attrs, keys)
      keys.reduce(attrs) {|m, k| m && m[k]}
    end
  end
end

