alias RedditFlow.{FakeSubreddit, CountWords, TableAggregator}

parent = self()

spawn(fn() ->
  FakeSubreddit.stream
  |> (fn(stream) -> CountWords.count(stream, parent) end).()
end)
