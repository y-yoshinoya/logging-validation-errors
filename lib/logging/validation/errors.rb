require "logging/validation/errors/version"
require "active_record"

module Logging
  module Validation
    module Errors
      extend ActiveSupport::Concern

      included do
        after_validation :logging_validation_errors
      end

      def logging_validation_errors
        return if errors.messages.blank?
        error_messages = errors.messages.map { |k, v|
          [k, self.class.human_attribute_name(k) + v.first]
        }.to_h
        dump_validation_errors(error_messages)
      end

      private
        def dump_validation_errors(error_messages)
          logger.info("Validation errors:")
          if defined?(Pry::ColorPrinter)
            Pry::ColorPrinter.pp(error_messages, logger)
          else
            logger.info(error_messages.inspect)
          end
        end
    end
  end
end

ActiveSupport.on_load(:active_record) do
  class ActiveRecord::Base
    include Logging::Validation::Errors
  end
end
