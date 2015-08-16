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

      @remainder.times do
        @recipients[index_of_least_disturbance] += 1
      end
    end

    private

    def index_of_least_disturbance
      disturbances.each.with_index.min_by(&:first).last
    end

    def disturbances
      @recipients.map do |recipient|
        ((recipient + 1) / (recipients_sum + 1).to_f) - (recipient / recipients_sum.to_f)
      end
    end

    def multiplier
      (@distributable + recipients_sum) / recipients_sum
    end

    def remainder
      (@distributable + recipients_sum) % recipients_sum
    end

    def recipients_sum
      @recipients.reduce(:+)
    end
  end
end
