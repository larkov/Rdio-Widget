command: """
read -r running <<<"$(ps -ef | grep \"MacOS/Rdio\" | grep -v \"grep\" | wc -l)" &&
test $running != 0 &&
IFS='|' read -r theArtist theName <<<"$(osascript <<<'tell application "Rdio"
        tell current track
          set theArtist to artist
          set theName to name
          return theArtist & "|" & theName
        end tell
    end tell')" &&
echo "$theArtist - $theName" || echo "Not Connected To Rdio"
"""

refreshFrequency: 2000

style: """
  bottom: 10px
  left: 10px
  color: #fff

  .output
    font-family: Helvetica Neue
    font-size: 30px
    font-weight: 100
    text-shadow: 0 1px 5px #000000;
"""

render: (output) -> """
        <div class="output">#{output}</div>
"""
