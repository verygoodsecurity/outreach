module Outreach
  class SequenceStep
    attr_accessor :id

    attr_accessor :bounce_count
    attr_accessor :click_count
    attr_accessor :deliver_count
    attr_accessor :failure_count
    attr_accessor :negative_reply_count
    attr_accessor :neutral_reply_count
    attr_accessor :open_count
    attr_accessor :out_out_count
    attr_accessor :positive_reply_count
    attr_accessor :reply_count
    attr_accessor :schedule_count

    attr_accessor :step_type
    attr_accessor :task_note

    attr_accessor :created_at
    attr_accessor :updated_at

    def initialize(attrs)
      @id = attrs['id']
      @bounce_count = attrs['bounceCount']
      @click_count = attrs['clickCount']
      @deliver_count = attrs['deliverCount']
      @failure_count = attrs['failureCount']
      @negative_reply_count = attrs['negativeReplyCount']
      @neutral_reply_count = attrs['neutralReplyCount']
      @open_count = attrs['openCount']
      @out_out_count = attrs['optOutCount']
      @positive_reply_count = attrs['positiveReplyCount']
      @reply_count = attrs['replyCount']
      @schedule_count = attrs['scheduleCount']

      @step_type = attrs['stepType']
      @task_note = attrs['taskNote']

      @created_at = attrs['createdAt']
      @updated_at = attrs['updatedAt']
    end

    def self.build_from_attributes_hash(attrs)
      result = {}
      result['id'] = attrs['id']
      new(result)
    end

    private

    def self.to_ostruct(hash)
      o = OpenStruct.new(hash)
      hash.each.with_object(o) do |(k,v), o|
        o.send(:"#{k}=", to_ostruct(v)) if v.is_a? Hash
      end
      o
    end

    def self.nested_hash_value(attrs, keys)
      keys.reduce(attrs) {|m,k| m && m[k] }
    end
  end
end

