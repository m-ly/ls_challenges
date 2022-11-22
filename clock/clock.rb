# frozen_string_literal: true

# Class Clock
#  -- instance methods
#      # initialize -> input integer for time
#       - sets ivar of time
#      # + -> input: integer - output: clock object
#      # - -> input: integer - output: clock object
#      # == -> input: class::time.ivar  - output: boolean
#  -- Class Methods
#      # - at --> input: int:hours, int: mins, output - clock object
#      # - to_s --> input: na -- output -> clock time in string formate HH:MM

# rules
# if a number added goes over 23:59 -- the time should loop - to fall in the range 0 - 2359
# if a number subtracted is less than 00:00 -- time should loop to fall in the tran 0 - 2359
# there are 1440 minutes in a day
#

# algorithm
#  to determine time if input is larger than 1439 -- find remainer of num % 1440  -- (converts number to range 0..2359)
#      - from the converted number call divmod w/ arg of 60 to return an array w/ hour/mins

# to determine time if input is less than 0
#    find the minutes prior to midnight :   mins = start time - difference
#        - *add (neg number) to 1440 to find the mins
#        - modulo 1440 will return number in range regardless of input size (for multiple 24 hour rotations)

# Creates clock objects used for representing time values and changes.
class Clock
  MINUTES_IN_DAY = 1440

  def initialize(time)
    @time = time
  end

  def self.at(hours, mins = 0)
    time = hours * 60 + mins
    Clock.new(time)
  end

  def to_s
    hours = time.divmod(60)[0]
    mins = time.divmod(60)[1]
    hours = hours < 10 ? "0#{hours}" : hours.to_s
    mins = mins < 10 ? "0#{mins}" : mins.to_s
    "#{hours}:#{mins}"
  end

  def +(other)
    new_time = (time + other) % MINUTES_IN_DAY
    Clock.new(new_time)
  end

  def -(other)
    new_time = time - other

    if new_time.negative?
      mins_before_midnight = time - other
      new_time = (MINUTES_IN_DAY + mins_before_midnight) % MINUTES_IN_DAY
    end

    Clock.new(new_time)
  end

  def ==(other)
    time == other.time
  end

  protected

  attr_reader :time
end
