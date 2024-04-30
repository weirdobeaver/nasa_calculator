defmodule NasaCalculatorTest do
  use ExUnit.Case
  doctest NasaCalculator

  test "greets the world" do
    assert NasaCalculator.hello() == :world
  end
end
