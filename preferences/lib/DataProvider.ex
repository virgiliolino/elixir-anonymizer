defmodule DataProvider do

	@doc """
	Return a list of sources to processs. 
  iex> DataProvider.get_sources("./", "*.json")
  ["output.json"]
	"""
  def get_sources(path, wildcard) do
    Path.wildcard(path <> wildcard)
	end

	@doc """
	Return the content of a file with name "source"
  iex> iex(4)> DataProvider.fetch_element("output.json", "./")
	"""
	def fetch_element(source, root) do
    File.open!(Path.absname(source, root), [:read, :utf8])
		|> IO.read(:all)
	end

end
