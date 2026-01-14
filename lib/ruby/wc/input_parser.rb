module InputParser
  require 'dry/monads'

  def self.parse(input)
    # case input.split(' ')
    case input.split(' ')
    in ['-c', filename]
      { flag: '-c', filename: }
    end
  end
end
