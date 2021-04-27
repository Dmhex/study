module Exercise
  module Fp2
    class MyArray < Array
      def my_each
        index = 0
        while index < length
          yield self[index]
          index += 1
        end
        self
      end

      def my_map
        result = MyArray.new
        my_each { |el| result << yield(el) }
        result
      end

      def my_compact
        result = MyArray.new
        my_each { |el| result << el unless el.nil? }
        result
      end

      def my_reduce(acc = nil)
        my_each { |el| acc = acc.nil? ? el : yield(acc, el) }
        acc
      end
    end
  end
end
