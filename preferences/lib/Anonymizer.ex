defmodule Anonymizer do
	@min_occurrences_to_be_anonym 6

	@doc """
	Filter the list or map pass as parameter by returning the same structure with just the occurrences
  that appear at least on 6 users
	"""
  def filter(elements) when is_map(elements) do
		Map.to_list(elements)
		|> filter
  end

	def filter(elements) do
    Enum.filter(elements, fn (element) -> elem(element, 1) >= @min_occurrences_to_be_anonym end)
  end


end
