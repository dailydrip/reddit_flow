defmodule RedditFlow.CountWords do
  """
  FakeSubreddit.stream
  |> CountWords.count
  """
  def count(stream, parent) do
    # Let's compile common patterns for performance
    empty_space = :binary.compile_pattern(" ") # BINARY

    stream
    |> Flow.from_enumerable()
    |> Flow.flat_map(&split_subreddit_words/1)
    |> Flow.partition()
    |> Flow.reduce(fn -> :ets.new(:words, []) end, fn {subreddit, word}, ets ->
      :ets.update_counter(ets, {subreddit, word}, {2, 1}, {{subreddit, word}, 0})
      ets
    end)
    |> Flow.map_state(fn ets ->
      :ets.give_away(ets, parent, [])
      [ets]
    end)
    |> Flow.run
  end

  def split_subreddit_words({subreddit, words}) do
    words
    |> String.split(" ")
    |> Enum.map(&String.replace(&1, ~r/[.,:;"\(\)]/, ""))
    |> Enum.map &({subreddit, &1})
  end
end
