defmodule Statistical do
	@doc """
	Performs the statistical calculation requested in this project
	"""	
	def process(list) do
		sortedList = Enum.sort(list)
		listLen = Enum.count(list)
    [min|_] = sortedList
		max = Enum.max(sortedList)
		median = median(sortedList, listLen)
		average = average(list, listLen)
		{min, max, median, average}
	end
	
	defp median([], _), do: nil

	defp median(sortedList, listLen) do
		mid = div(listLen, 2)
		rem = rem(listLen, 2)
		(Enum.at(sortedList, mid) + Enum.at(sortedList, mid + rem - 1)) / 2
	end

	defp average(list, listLen) do
		Enum.sum(list) / listLen
	end

end
