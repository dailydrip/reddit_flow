defmodule RedditFlow.Subreddit do
  use GenServer
  alias RedditFlow.{SubredditStream, CountWords}

  def start_link(subreddit) do
    GenServer.start_link(__MODULE__, subreddit, [])
  end

  def init(subreddit) do
    send(self, {:after_init, subreddit})

    {:ok, []}
  end

  def handle_info({:after_init, subreddit}, state) do
    spawn_link(fn ->
      SubredditStream.stream(subreddit)
      |> CountWords.count
    end)

    {:noreply, state}
  end
end
