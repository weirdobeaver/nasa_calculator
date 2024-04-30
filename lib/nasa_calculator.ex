defmodule NasaCalculator do
  @moduledoc """
  This is a module for calculating the amount of fuel need to travel from one planet to another.
  """

  alias NasaCalculator.Planets

  @spec calculate_fuel_for_travel(String.t(), String.t(), number() | String.t()) :: integer() | String.t()
  def calculate_fuel_for_travel(launch_planet, landing_planet, rocket_mass) do
    case parse_rocket_mass(rocket_mass) do
      {:error, error} -> error
      {:ok, mass} ->
        with {:ok, launch_gravity} <- Planets.get_planet_gravity(launch_planet),
            {:ok, landing_gravity} <- Planets.get_planet_gravity(landing_planet) do
          calculate_launch_fuel(launch_gravity, mass) +
            calculate_landing_fuel(landing_gravity, mass)
        else
          {:error, error} -> error
        end
    end
  end

  defp calculate_launch_fuel(gravity, mass) do
    Float.floor(mass * gravity * 0.042 - 33)
    |> trunc()
  end

  defp calculate_landing_fuel(gravity, mass) do
    Float.floor(mass * gravity * 0.033 - 42)
    |> trunc()
  end

  defp parse_rocket_mass(rocket_mass) when is_number(rocket_mass), do: {:ok, rocket_mass}
  defp parse_rocket_mass(nil), do: {:error, "Please provide valid rocket mass."}
  defp parse_rocket_mass(rocket_mass) do
    case Float.parse(rocket_mass) do
      :error -> {:error, "Please provide valid rocket mass."}
      {mass, _} -> {:ok, mass}
    end
  end
end
