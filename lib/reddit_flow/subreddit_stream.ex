defmodule RedditFlow.SubredditStream do
  @reddit_base_url "https://www.reddit.com/r"
  def stream(subreddit) do
    Stream.resource(
      &init/0,
      &continue(subreddit, &1),
      &halt/1
    )
  end

  def init do
    :start
  end

  def continue(subreddit_name, :start) do
    {:ok, response} = HTTPoison.get(reddit_url(subreddit_name, :start))
    posts = Poison.decode!(response.body)

    {
      posts["data"]["children"] |> titles(subreddit_name),
      {:after, posts["data"]["after"]}
    }
  end
  def continue(subreddit_name, {:after, id}) do
    :timer.sleep 1_000

    {:ok, response} = HTTPoison.get(reddit_url(subreddit_name, id))
    posts = Poison.decode!(response.body)

    {
      posts["data"]["children"] |> titles(subreddit_name),
      {:after, posts["data"]["after"]}
    }
  end

  def halt(_) do
    :ok
  end

  def titles(posts_children, subreddit) do
    posts_children
    |> Enum.map(fn a ->
      {subreddit, a["data"]["title"]}
    end)
  end

  def limit do
    100
  end

  def reddit_url(subreddit, :start) do
    "#{@reddit_base_url}/#{subreddit}/new.json?limit=#{limit}"
  end
  def reddit_url(subreddit, after_id) do
    "#{@reddit_base_url}/#{subreddit}/new.json?limit=#{limit}&after=#{after_id}"
  end
end
