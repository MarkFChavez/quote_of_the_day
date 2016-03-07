class ContentBuilder
  attr_reader :quote, :verse

  def self.build
    new.build
  end

  def initialize
    @quote = WisdomGenerator.generate
    @verse = BibleGenerator.generate
  end

  def build
    "Quote of the day: \n #{quote} \n\n Verse of the Day: \n #{verse} \n\n #{greetings}"
  end

  private

  def greetings
    "Hope you learn something from it. Have a great day!"
  end
end
