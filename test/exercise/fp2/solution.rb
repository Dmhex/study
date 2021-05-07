module Exercise
  module Fp2
    class MyArray < Array
      def my_each(&func)
        head, *tail = self
        func.call(head)
        rest = MyArray.new(tail)
        rest.my_each(&func) if tail.any?
        self
      end

      def my_map
        my_reduce(MyArray.new) { |acc, el| acc << yield(el) }
      end

      def my_compact
        my_reduce(MyArray.new) { |acc, el| el.nil? ? acc : acc << el }
      end

      def my_reduce(acc = nil, &func)
        head, *tail = self
        acc = acc.nil? ? head : func.call(acc, head)
        return acc if tail.empty?

        MyArray.new(tail).my_reduce(acc, &func)
      end
    end
  end
end
