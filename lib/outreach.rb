require "outreach/version"
require "outreach/errors"
require "outreach/request"
require "outreach/authorization"
require "outreach/client"
require "outreach/prospect"
require "outreach/sequece_step"
require "outreach/sequence_state"
require "outreach/sequence"
require "outreach/service/prospect"
require "outreach/service/sequence_step"
require "outreach/service/sequence_state"
require "outreach/service/sequence"

module Outreach
  class << self
    attr_accessor :application_identifier
    attr_accessor :application_secret
    attr_accessor :scopes
    attr_accessor :redirect_uri
    attr_accessor :debug
  end
end
