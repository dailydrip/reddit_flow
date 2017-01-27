defmodule RedditFlow.TableAggregator do
  def run do
    :ets.all
    |> Enum.filter(&filter_to_words_tables/1)
    |> Enum.flat_map(&:ets.tab2list/1)
    |> consolidate_duplicates
    |> IO.inspect
  end

  def filter_to_words_tables(tab) do
    tab
    |> :ets.info
    |> Keyword.fetch!(:name)
    |> (fn name -> name == :words end).()
  end

  def consolidate_duplicates(items) do
    Enum.reduce(items, %{}, fn({{subreddit, word}, value}, acc) ->
      Map.update(acc, subreddit, %{word => value},
        fn(current) ->
          Map.update(current, word, value, fn(c) -> c + value end)
        end)
    end)
  end
end
