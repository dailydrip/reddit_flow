defmodule RedditFlow.FakeSubreddit do
  def stream do
    Stream.resource(
      &start/0,
      &generate_paragraphs/1,
      &cleanup/1
    )
  end

  def start do
    :ok
  end

  def generate_paragraphs(_) do
    :timer.sleep 1
    {[fake_paragraph_with_subreddit], :ok}
  end

  def cleanup _ do
    :ok
  end

  def fake_paragraph do
    Faker.Lorem.Shakespeare.as_you_like_it
  end

  def fake_paragraph_with_subreddit do
    {fake_subreddit, fake_paragraph}
  end

  def fake_subreddit do
    "fake#{:rand.uniform(3)}"
  end
end
