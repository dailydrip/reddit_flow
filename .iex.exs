alias RedditFlow.{FakeSubreddit, CountWords, TableAggregator, SubredditStream,
SubredditSupervisor, Subreddit}

# parent = self()
#
# spawn(fn() ->
# #FakeSubreddit.stream
#   SubredditStream.stream("elixir")
#   |> (fn(stream) -> CountWords.count(stream, parent) end).()
# end)
