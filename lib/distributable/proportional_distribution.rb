module Distributable
  class ProportionalDistribution
    def initialize(distributable, recipients)
      @distributable = distributable
      @recipients    = recipients

      @multiplier, @remainder = (@distributable + recipients_sum).divmod(recipients_sum)
    end

    def call
      distribution = @recipients.map { |recipient| recipient * @multiplier }

      @remainder.times do
        distribution[index_of_least_disturbance] += 1
      end

      distribution
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

    def recipients_sum
      @recipients.reduce(:+)
    end
  end
end
