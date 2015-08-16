module Distributable
  class ProportionalDistribution
    def initialize(distributable, recipients)
      @distributable = distributable
      @recipients    = recipients

      @multiplier = multiplier
      @remainder  = remainder
    end

    def call
      @recipients.each_index do |index|
        @recipients[index] *= @multiplier
      end
    end

    private

    def multiplier
      (@distributable + recipients_sum) / recipients_sum
    end

    def recipients_sum
      @recipients.reduce(:+)
    end

    def remainder
      (@distributable + recipients_sum) % recipients_sum
    end
  end
end
