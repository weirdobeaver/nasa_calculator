NasaCalculator.calculate_fuel_for_travel(
  Enum.at(System.argv(), 0),
  Enum.at(System.argv(), 1),
  Enum.at(System.argv(), 2)
)
|> IO.inspect()
