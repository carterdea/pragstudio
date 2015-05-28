module Rankable
  def thumbs_up
    puts "{#title} got a thumbs up!"
  end

  def thumbs_up
    @rank += 1
    puts "{#title} got a thumbs up!"
  end

  def thumbs_down
    @rank -= 1
  end
end