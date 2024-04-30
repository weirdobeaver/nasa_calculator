defmodule NasaCalculatorTest do
  use ExUnit.Case

  describe "calculate fuel for travel" do
    test "calculates fuel to travel from earth to the moon" do
      assert NasaCalculator.calculate_fuel_for_travel("earth", "moon", 2500) == 1087
    end

    test "calculates fuel to travel from the moon to earth" do
      assert NasaCalculator.calculate_fuel_for_travel("moon", "earth", 2500) == 904
    end

    test "calculates fuel to travel from the mars to earth" do
      assert NasaCalculator.calculate_fuel_for_travel("mars", "earth", 2500) == 1123
    end

    test "calculates fuel to travel from the earth to mars" do
      assert NasaCalculator.calculate_fuel_for_travel("earth", "mars", 2500) == 1260
    end

    test "calculates fuel to travel from the earth to mars if rocket mass is a string" do
      assert NasaCalculator.calculate_fuel_for_travel("earth", "mars", "2500") == 1260
    end

    test "calculates fuel to launch rocket to planet orbit and come back" do
      assert NasaCalculator.calculate_fuel_for_travel("earth", "earth", 2500) == 1763
    end

    test "returns error if launch planet does not exist" do
      assert NasaCalculator.calculate_fuel_for_travel("uranus", "moon", 2500) ==
               "Please enter existing planet."
    end

    test "returns error if landing planet does not exist" do
      assert NasaCalculator.calculate_fuel_for_travel("mars", "uranus", 2500) ==
               "Please enter existing planet."
    end

    test "returns error if rocket mass is missing" do
      assert NasaCalculator.calculate_fuel_for_travel("mars", "moon", nil) ==
               "Please provide valid rocket mass."
    end

    test "returns error if rocket mass is invalid format" do
      assert NasaCalculator.calculate_fuel_for_travel("mars", "moon", "text") ==
               "Please provide valid rocket mass."
    end

    test "returns error if launch planet is missing" do
      assert NasaCalculator.calculate_fuel_for_travel(nil, "moon", 2500) ==
               "Please provide valid planet data type."
    end

    test "returns error if landing planet is missing" do
      assert NasaCalculator.calculate_fuel_for_travel("earth", nil, 2500) ==
               "Please provide valid planet data type."
    end
  end
end
