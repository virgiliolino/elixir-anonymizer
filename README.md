## Facts

1. An example of anonymation process done with Elixir

2. I created two tasks that correspond to the two requested programs:

   -repot_task                              mix report_task "../data/"

   -agregate_task                           mix aggregate_task "airline"

3. Aggregation involve just one particular type of purchase. In our case "airline" purchases. The type 
will be passed as parameter and the aggregate task will filter the purchases by letting in just the one indicated on the param.

4. Obviously the derived values differ from the values indicated in your README.mmd cause we're A
nonymizing the data. This involves removing some occurrences.

5. I tried to work with the simplest structures. Even if many times I couldn't really keep the structures simple I could in the end produce a normal list of user preferences.

## Installation

from the root folder:
cd preferences
mix deps.get


## Execution

from the root folder:
cd preferences
mix report_task "../data/"

this will fill a directory "../output"
To process the latter, please write as folllow:

mix aggregate_task "airline"

the result will be printed on the screen. Please notice that the report task add new files to the output directory without removing anything. So you'll have wrong data.

## What I don't like from my solution

Nearly everywere you'll find hard coded strategies and multiple concerns mixed in single functions. This is something that I really don't like. But I couldn't manage to produce a better solution in the available amount of time with the available knowledge I own regarding Elixir. I could have implemented protocols for sure, and other particular characteristics of Elixir. I think a collectable module would also have been useful. Maybe in the next weeks just for fun, I'm going to do it.

Many functions are not really generic. Have been conceived to magically answer to one task with some particular structure and can hardly been adapted to other situations.

No tests. I started in the normal way by creating some tests that could at first instance validate your requests. But then I just build the solution.

Many thanks,
Virgilio


