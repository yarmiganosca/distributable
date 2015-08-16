require "distributable/version"
require 'distributable/distribution'

module Distributable
  def distribute_across(recipients)
    distribution = Distribution.new(self, recipients)

    distribution.call
  end
end

Fixnum.send(:include, Distributable)
Bignum.send(:include, Distributable)
