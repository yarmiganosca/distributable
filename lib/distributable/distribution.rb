module Distributable
  class Distribution
    def initialize(distributable, recipients)
      @distributable = distributable
      @recipients    = recipients
    end

    def call
      @recipients.each_index do |index|
        @recipients[index] += quotient
      end

      remainder.times do |index|
        @recipients[index] += 1
      end
    end

    private

    def quotient
      @distributable / @recipients.size
    end

    def remainder
      @distributable % @recipients.size
    end
  end
end
