defmodule RedditFlow.SubredditSupervisor do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, :ok, [name: __MODULE__])
  end

  def start_child(subreddit) do
    Supervisor.start_child(__MODULE__, [subreddit])
  end

  def init(:ok) do
    children = [
      worker(RedditFlow.Subreddit, [])
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
