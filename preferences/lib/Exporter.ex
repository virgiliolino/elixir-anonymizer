defmodule Exporter do
	def export(content, target) do
		 File.open!(target, [:write, :append, :utf8])
		 |>	IO.write(content)
		 IO.write("\n")
	end

end
