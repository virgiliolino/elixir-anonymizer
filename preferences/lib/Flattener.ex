defmodule Flattener do
	@doc """
	Apply fun to every element of the list passed as parameter. This method supports
	multiple nested lists. 
  iex(1)> Flattener.flatten_and_apply(list, "../output/", fn x-> x end)
	"""
	def flatten_and_apply(elements, path, fun) do
		{:ok, device} = File.open(path, [:write, :append, :utf8])
		flatten(elements, device, fun)
		File.close(device)
	end

	defp flatten([head|elements], device, fun) when is_list(head) do
		flatten(head, device, fun)
		flatten(elements, device, fun)
	end

	defp flatten([head|elements], device, fun) do
		fun.(device, head)
		flatten(elements, device, fun)
	end

	defp flatten([], _, _) do
	end
	
end
