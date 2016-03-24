module ShallowAttributes
  module Type
    # This class needs for cange object type to Float.
    #
    # @abstract
    #
    # @since 0.1.0
    class Float
      # Convert value to Float type
      #
      # @private
      #
      # @param [Object] value
      # @param [Hash] option
      # @option options [boolean] :allow_nil cast `nil` to integer or float
      #
      # @example Convert string to float value
      #   ShallowAttributes::Type::Float.new.coerce('2001')
      #     # => 2001.0
      #
      # @raise [InvalidValueError] if values is invalid
      #
      # @return [Float]
      #
      # @since 0.1.0
      def coerce(value, options = {})
        case value
        when nil then options[:allow_nil] ? 0.0 : nil
        when ::TrueClass then 1.0
        when ::FalseClass then 0.0
        else
          value.respond_to?(:to_f) ? value.to_f
            : raise(ShallowAttributes::Type::InvalidValueError, %(Invalid value "#{value}" for type "Float"))
        end
      end
    end
  end
end
