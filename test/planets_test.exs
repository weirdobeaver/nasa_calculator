defmodule NasaCalculator.PlanetsTest do
  use ExUnit.Case

  alias NasaCalculator.Planets

  describe "get planets gravity" do
    test "returns existing planet gravity" do
      assert Planets.get_planet_gravity("moon") == {:ok, 1.62}
    end

    test "returns existing planet gravity after downcasing the name" do
      assert Planets.get_planet_gravity("Moon") == {:ok, 1.62}
    end

    test "returns error if planet not defined" do
      assert Planets.get_planet_gravity("uranus") == {:error, "Please enter existing planet."}
    end

    test "returns error if invalid type provided" do
      assert Planets.get_planet_gravity(nil) == {:error, "Please provide valid planet data type."}
    end
  end
end
