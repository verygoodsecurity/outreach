require 'outreach/helpers'

module Outreach

  class Sequence
    include Helpers

    @@api_fields = [
        'id',
        'createdAt',
        'updatedAt',

        'bounceCount',
        'clickCount',
        'deliverCount',
        'description',
        'enabled',
        'enabledAt',
        'failureCount',
        'finishOnReply',
        'lastUsedAt',
        'locked',
        'lockedAt',
        'maxActivations',
        'name',
        'negativeReplyCount',
        'neutralReplyCount',
        'openCount',
        'optOutCount',
        'positiveReplyCount',
        'replyCount',
        'scheduleCount',
        'scheduleIntervalType',
        'sequenceType',
        'shareType',
        'tags',
    ]

    class << self
    end

    def initialize(attrs)
      @@api_fields.each do |f|
        self.class.send(:attr_accessor, Helpers.underscore(f))
      end

      @@api_fields.each do |f|
        self.send("#{Helpers.underscore(f)}=", attrs[f])
      end
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

