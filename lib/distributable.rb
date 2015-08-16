require "distributable/version"
require 'distributable/even_distribution'
require 'distributable/proportional_distribution'

module Distributable
  def distribute_evenly_across(recipients)
    EvenDistribution
      .new(self, recipients)
      .call
  end

  alias_method :distribute_across, :distribute_evenly_across

  def distribute_proportionally_across(recipients)
    ProportionalDistribution
      .new(self, recipients)
      .call
  end
end

Fixnum.send(:include, Distributable)
Bignum.send(:include, Distributable)
