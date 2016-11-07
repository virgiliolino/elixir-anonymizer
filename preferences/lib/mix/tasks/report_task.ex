defmodule Mix.Tasks.ReportTask do
	use Mix.Task

	def run([folder]) do
		IO.puts "Welcome to the User Preferences Report Task."
		Preferences.process(folder)
		IO.puts "Task completed. You'll find the output of this process in ../output" 
	end

	def run(_) do
		display_error_message()
	end

	defp display_error_message do
		IO.puts "Missing parameter: you need to specify the folder"
		IO.puts "Usage mix report_task <folder>"
		IO.puts "i.e.: mix report_task ../data/"
	end

end
