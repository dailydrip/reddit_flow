defmodule Mix.Tasks.FakeSubreddit do
  use Mix.Task

  def run(_) do
    RedditFlow.FakeSubreddit.stream
    |> Stream.map(&IO.inspect/1)
    |> Stream.take(3)
    |> Stream.run
  end
end
