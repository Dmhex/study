module Exercise
  module Fp
    class << self
      def rating(array)
        filtered_films = array.filter { |film| film['rating_kinopoisk'].to_f.nil? || film['rating_kinopoisk'].to_f.zero? }
                              .select { |film| film['country'].split(',').length > 1 }
        rating = filtered_films.map { |film| film['rating_kinopoisk'].to_f }
        rating.reduce(:+) / rating.length
      end

      def chars_count(films, threshold)
        search_letter = 'и'
        films.select { |film| film['rating_kinopoisk'].to_f > threshold }
             .map { |film| film['name'] }
             .reduce(0) { |result, name| result + name.count(search_letter) }
      end
    end
  end
end
