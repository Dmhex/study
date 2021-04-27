module Exercise
  module Arrays
    class << self
      def replace(array)
        max_el = find_max(array)
        array.map { |el| el.positive? ? max_el : el }
      end

      def find_max(array)
        array.reduce { |max, el| el > max ? el : max }
      end

      def search(array, query)
        index = (array.length - 1) / 2
        return -1 if array.length.zero? || (array.length == 1 && array[index] != query)

        if query == array[index]
          index
        elsif query > array[index]
          acc = search(array[index + 1, array.length], query)
          acc == -1 ? -1 : index + 1 + acc
        else
          search(array[0, index], query)
        end
      end
    end
  end
end
