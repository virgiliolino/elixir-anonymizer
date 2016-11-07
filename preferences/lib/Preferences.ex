defmodule Preferences do
	@data_wildcard "*.json"
	@output "../output/"

	@doc """
	Process in isolation the purchases of user contained in a directory. Every user is in on
file. As result of this step, the output folder will be populated by a set of files. The name
of the file should will not be anymore the user id, but a random name.
  iex(1)> Preferences.process("../data/")
	{:ok}
	"""
  def process(folder) do
		Enum.map(
			DataProvider.get_sources(folder, @data_wildcard),
			fn path ->
				DataProvider.fetch_element(path, folder)
				|> Poison.decode!
				|> filter_purchases
				|> Map.keys
				|> Flattener.flatten_and_apply(
					@output <> UUID.uuid1(),
				  fn target, {type, amount} ->
						{type, amount}
						IO.write(target, type <> "," <> Integer.to_string(amount) <> "\n")
			  	end
				)
			end
		)
		{:ok}
  end

	defp filter_purchases(elements) do
		Enum.reduce(
			Map.get(elements, "purchases"),
      Map.new,
			fn purchase, acc ->
				Map.put(acc, {Map.get(purchase, "type"), Map.get(purchase, "amount")}, :true)
			end
		)
	end


end


