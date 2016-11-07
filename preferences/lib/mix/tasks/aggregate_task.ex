defmodule Mix.Tasks.AggregateTask do
	use Mix.Task

	def run([type]) do
		IO.puts "Welcome to Aggregation task."
		type
		|> Aggregator.process_by_type
		|> print_result_terminal
		IO.puts "Task completed" 
	end

	def run(_) do
		display_error_message()
	end

	defp display_error_message do
		IO.puts "Missing parameter: you need to specify the purchase type to consider in the Aggregation process"
		IO.puts "Usage mix report_aggregate <>"
		IO.puts "i.e.: mix report_task ../data/"
	end

	defp print_result_terminal({min, max, median, average}) do
		IO.write("Final result of the processing \n")
		IO.write("min:" <> Integer.to_string(min) <> "\n")
		IO.write("max:" <> Integer.to_string(max)  <> "\n")
		IO.write("median:" <> Float.to_string(median, [decimals: 2, compact: true])  <> "\n")
    IO.write("average:" <> Float.to_string(average, [decimals: 2, compact: true])  <> "\n")
	end


end
