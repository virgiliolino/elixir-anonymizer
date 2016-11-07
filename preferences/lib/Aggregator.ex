defmodule Aggregator do
	@data "../output/"
	@data_wildcard "*"

	@doc """
	Given the output of the isolated user processing step(Preferences.process), performs the necessary
	anonymization and post-processing steps. The final output of this step will be printed to the 
	terminal  and contain the derived min, max, average, median values
	iex(1)> Aggregator.process_by_type("airline")
	Final result of the processing 
	min:150
	max:10000
	median:150.0
	average:3781.25
	"""
  def process_by_type(type_to_process) do
		type_to_process
		|> aggregate
		|> List.flatten
		|> count_occurrences
		|> Anonymizer.filter
		|> denormalize
		|> Statistical.process
	end

	defp aggregate(type_to_process) do
			Enum.map(
			DataProvider.get_sources(@data, @data_wildcard),
			fn path ->
				elements = DataProvider.fetch_element(path, @data)
				|> String.split("\n")
				Enum.map(elements, fn x -> String.split(x, ",") end)
				|> Enum.filter_map(
					fn [type|_] -> type == type_to_process end,
					fn [_|amount] ->
						[head|_] = amount
						String.to_integer(head)
					end
				)
				end
		)
	end

	defp count_occurrences(elements) do
		Enum.reduce(
			elements,
			%{},
			fn x, acc -> Map.update(acc, x, 1, fn occ -> occ + 1 end)
		end)
  end

	defp denormalize(elements) do
		Enum.flat_map(elements, fn {price, count} -> List.duplicate(price, count) end)
	end

	defp print_to_terminal({min, max, median, average}) do
		IO.write("Final result of the processing \n")
		IO.write("min:" <> Integer.to_string(min) <> "\n")
		IO.write("max:" <> Integer.to_string(max)  <> "\n")
		IO.write("median:" <> Float.to_string(median, [decimals: 2, compact: true])  <> "\n")
    IO.write("average:" <> Float.to_string(average, [decimals: 2, compact: true])  <> "\n")
	end
end
