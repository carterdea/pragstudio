module Rankable
  def thumbs_up
    self.rank += 1
    puts "{#title} got a thumbs up!"
  end

  def thumbs_down
    self.rank -= 1
  end

  def hit?
    self.rank >= 10
  end

  def status
    hit? ? "Hit" : "Flop"
  end

  def <=>(other)
    other.rank <=> @rank
  end

  def normalized_rank
    self.rank / 10
  end
end