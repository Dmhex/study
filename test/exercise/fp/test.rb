require 'csv'
require './test/test_helper.rb'
require_relative './solution.rb'

class Exercise::FpTest < Minitest::Test
  def test_rating
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Exercise::Fp.rating(array)
    assert result == 6.809410385259628
  end

  def test_chars_count
    array = CSV.readlines('./test/fixtures/films.csv', headers: true)

    result = Exercise::Fp.chars_count(array, 5)
    assert result == 3850

    result = Exercise::Fp.chars_count(array, 8.5)
    assert result == 40
  end
end
