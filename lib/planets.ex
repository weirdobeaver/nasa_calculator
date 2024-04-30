defmodule NasaCalculator.Planets do
  @moduledoc """
  This is a module for retrieveing planet data.
  """

  @planets_gravity %{"earth" => 9.807, "moon" => 1.62, "mars" => 3.711}

  @spec get_planet_gravity(String.t()) :: {:error, String.t()} | {:ok, float()}
  def get_planet_gravity(planet) when is_binary(planet) do
    case @planets_gravity[String.downcase(planet)] do
      nil -> {:error, "Please enter existing planet."}
      gravity -> {:ok, gravity}
    end
  end

  def get_planet_gravity(_), do: {:error, "Please provide valid data type."}
end
