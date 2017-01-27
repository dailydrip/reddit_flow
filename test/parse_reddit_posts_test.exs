defmodule ParseRedditPostsTest do
  use ExUnit.Case

  @file "./test/fixtures/reddit_posts.json"
  @posts_json File.read!(@file)
  @posts Poison.decode! @posts_json

  test "parsing posts" do
    IO.inspect @posts
  end

  def example_data do
    %{"data" => %{
        "after" => "t3_5qhya2",
        "before" => nil,
        "children" => example_children,
      }
    }
  end

  def example_children do
    [
      %{"data" => %{
       "visited" => false,
       "approved_by" => nil,
       "title" => "TKbreezy, Coney, and EE: Super Smash Con 2016 Commentary Highlights",
       "created" => 1485562411.0,
       "quarantine" => false,
       "domain" => "youtu.be",
       "saved" => false,
       "mod_reports" => [],
       "locked" => false,
       "suggested_sort" => nil,
       "likes" => nil,
       "permalink" => "/r/smashbros/comments/5qhydn/tkbreezy_coney_and_ee_super_smash_con_2016/",
       "created_utc" => 1485533611.0,
       "secure_media_embed" =>
         %{"content" =>
             "&lt;iframe width=\"600\" height=\"338\" src=\"https://www.youtube.com/embed/z6jRCbgUKgM?feature=oembed\" frameborder=\"0\" allowfullscreen&gt;&lt;/iframe&gt;",
           "height" => 338,
           "scrolling" => false,
           "width" => 600
         },
         "contest_mode" => false,
         "media_embed" =>
           %{"content" => "&lt;iframe width=\"600\" height=\"338\" src=\"https://www.youtube.com/embed/z6jRCbgUKgM?feature=oembed\" frameborder=\"0\" allowfullscreen&gt;&lt;/iframe&gt;",
           "height" => 338,
           "scrolling" => false,
           "width" => 600
           },
           "gilded" => 0,
           "secure_media" => %{
             "oembed" => %{
               "author_name" => "GRTr4sh",
               "author_url" => "https://www.youtube.com/channel/UChPE_pVN58afOg4Dh4vznsA",
               "height" => 338,
               "html" => "&lt;iframe width=\"600\" height=\"338\" src=\"https://www.youtube.com/embed/z6jRCbgUKgM?feature=oembed\" frameborder=\"0\" allowfullscreen&gt;&lt;/iframe&gt;",
               "provider_name" => "YouTube",
               "provider_url" => "https://www.youtube.com/",
               "thumbnail_height" => 360,
               "thumbnail_url" => "https://i.ytimg.com/vi/z6jRCbgUKgM/hqdefault.jpg",
               "thumbnail_width" => 480,
               "title" => "TKbreezy, Coney, and EE: Super Smash Con 2016 Commentary Highlights",
               "type" => "video", "version" => "1.0", "width" => 600
             },
             "type" => "youtube.com"
           },
           "id" => "5qhydn",
           "author_flair_css_class" => "diddysm4sh",
           "user_reports" => [],
           "ups" => 1,
           "score" => 1,
           "thumbnail" => "http://a.thumbs.redditmedia.com/Nht6XEBrizeOBzMVeNTJhlmDIheBW7UuohFN58NCdQ8.jpg",
           "post_hint" => "rich:video",
           "subreddit_id" => "t5_2qiep",
           "archived" => false,
           "link_flair_css_class" => nil,
           "hide_score" => true,
           "name" => "t3_5qhydn",
           "over_18" => false,
           "preview" =>
           %{"images" => [%{"id" => "ZQ-RvC_7s12aR_JToD-zCFy0PmRYbZjpOMLI7hqc46w",
                "resolutions" => [%{"height" => 81,
                   "url" => "https://i.redditmedia.com/p5cnS9wU10JqIsDCmwVFVPT802LCZiqaHsPnzHAx1V0.jpg
  ?fit=crop&amp;crop=faces%2Centropy&amp;arh=2&amp;w=108&amp;s=3896267b9121ae7685f14324d21ec42a",
                   "width" => 108},
                 %{"height" => 162,
                   "url" => "https://i.redditmedia.com/p5cnS9wU10JqIsDCmwVFVPT802LCZiqaHsPnzHAx1V0.jpg
  ?fit=crop&amp;crop=faces%2Centropy&amp;arh=2&amp;w=216&amp;s=ae599e55e79fc2cd984325c10af2aa89",
                   "width" => 216},
                 %{"height" => 240,
                   "url" => "https://i.redditmedia.com/p5cnS9wU10JqIsDCmwVFVPT802LCZiqaHsPnzHAx1V0.jpg
  ?fit=crop&amp;crop=faces%2Centropy&amp;arh=2&amp;w=320&amp;s=7306ab7c19b2dd4d0c7c718a5de3142d",
                   "width" => 320}],
                "source" => %{"height" => 360,
                  "url" => "https://i.redditmedia.com/p5cnS9wU10JqIsDCmwVFVPT802LCZiqaHsPnzHAx1V0.jpg?
  s=50454a1f173ea03180150cf31fc3272b",
                  "width" => 480}, "variants" => %{}}]},
           "author" => "Larry_Bobarry", "author_flair_text" => "Banana Senpai",
           "is_self" => false, "banned_by" => nil, "hidden" => false,
           "url" => "https://youtu.be/z6jRCbgUKgM", "distinguished" => nil,
           "num_reports" => nil, "link_flair_text" => nil,
           "report_reasons" => nil, "clicked" => false, "media" => %{}},
         "kind" => "t3"}
       ]
  end
end
