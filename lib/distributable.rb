require "distributable/version"

module Distributable
  def distribute_across(objects)
  end
end

Numeric.send(:include, Distributable)
