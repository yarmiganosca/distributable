module Distributable
  class EvenDistribution
    def initialize(distributable, recipients)
      @distributable = distributable
      @recipients    = recipients
    end

    def call
      quotient, remainder = @distributable.divmod(@recipients.size)

      @recipients.map.with_index do |recipients, index|
        quotient + (index < remainder ? 1 : 0)
      end
    end
  end
end
