module TracksHelper
  def ugly_lyrics(lyrics)
    ("<pre>" +
    lyrics.split("\n").map do |line|
      "&#9835; #{line}"
    end.join("\n") +
    "</pre>").html_safe
  end
end
