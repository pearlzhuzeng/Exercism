class TwelveDays
  SONG = {
    'a' => 'Partridge in a Pear Tree',
    'two' => 'Turtle Doves',
    'three' => 'French Hens',
    'four' =>  'Calling Birds',
    'five' => 'Gold Rings',
    'six' => 'Geese-a-Laying',
    'seven' => 'Swans-a-Swimming',
    'eight' => 'Maids-a-Milking',
    'nine' => 'Ladies Dancing',
    'ten' => 'Lords-a-Leaping',
    'eleven' => 'Pipers Piping',
    'twelve' => 'Drummers Drumming',
  }

  def self.song
    new.song
  end

  def song
    lyrics = ''

    SONG.each do |key, value|
      day = get_day_and_count(key)
      lyrics += "#{song_start(day)} #{key} #{value}\n\n"
    end

    lyrics
  end

  def number n
    str = n.to_s
    [str, with_suffix(str)]
  end

  def song_start(day)
     "On the #{day} day of Christmas my true love gave to me:"
  end

  def get_day_and_count(count)
    return "first" if count == "a"
    return "second" if count == "two"
    return "third" if count == "three"
    return "fifth" if count == "five"
    return "#{count}h" if count.end_with?("t")
    return "#{count}th"
  end
end
