class PlayAnalyzer

  def initialize(source_type)
    @source_type = source_type
    @source      = source_type.source
  end

  def words_by_characters name
    map = {}
    lines = @source.xpath('//SPEAKER[text()="'+ name +'"]/following-sibling::LINE').to_a
    lines.each do |line|
      words = line.content.split(' ')
      words.each do |word|
        downcase_word = word.downcase
        map[downcase_word] = (map[downcase_word] ? map[downcase_word] : 0) + 1
      end
    end

    map.to_a
  end

  def characters
    speakers = @source.xpath('//SPEAKER').to_a
    characters = speakers.map{ |speaker|  speaker.content }.uniq
  end

  def characters_spoken_lines
    map = {}
    speeches = @source.xpath('//SPEECH').to_a
    speeches.each do |speech|
      speaker = speech.css('SPEAKER').first.content
      current_lines = speech.css('LINE').length
      lines = (map[speaker] ? map[speaker] : 0 ) + current_lines

      map[speaker] = lines
    end

    map
  end

end
