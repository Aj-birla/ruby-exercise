=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter
  ABILITIES = %i[
    strength
    dexterity
    constitution
    intelligence
    wisdom
    charisma
  ]

  BASE_HITPOINTS = 10

  attr_reader(*ABILITIES, :hitpoints)
  def self.modifier(score)
    (score.to_i - 10) / 2
  end

  def hitpoints
    BASE_HITPOINTS + DndCharacter.modifier(self.constitution)
  end

  def initialize
    @abilities = ABILITIES.map { |ability| [ability, roll_ability_score] }.to_h
    @strength = @abilities[:strength]
    @dexterity = @abilities[:dexterity]
    @constitution = @abilities[:constitution]
    @intelligence = @abilities[:intelligence]
    @wisdom = @abilities[:wisdom]
    @charisma = @abilities[:charisma]
  end

  private
  def roll_ability_score
    rolls = 4.times.map { rand(1..6) }
    rolls.sort.reverse.take(3).sum
  end
end
