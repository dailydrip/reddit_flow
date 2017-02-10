defmodule RedditFlow do
  def monitor_subreddit(subreddit) do
    RedditFlow.SubredditSupervisor.start_child(subreddit)
  end
end
