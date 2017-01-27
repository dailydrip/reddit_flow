alias RedditFlow.{FakeSubreddit, CountWords, TableAggregator, SubredditStream}

parent = self()

spawn(fn() ->
#FakeSubreddit.stream
  SubredditStream.stream
  |> (fn(stream) -> CountWords.count(stream, parent) end).()
end)
