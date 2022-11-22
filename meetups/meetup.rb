# frozen_string_literal: true

require 'date'

# Class - Meetup
#  instance methods
#    # initialize - Input: month, year
#    # day -  input: string representing day of the week, and a string representing
#      which day of the month relative to week,  output: a date object

# rules
# teenth is a match of a day that falls on 13-19
# input will need to be sanitized to ignore case
# if a day doesn't exist - return nil (most likely with 5th day of a given month)
# translators = { "first" => 1, "second" => 2, "third" => 3, "fourth" => 4, "fifth"=> 5
#                 "teenth" =>?, "last" => 1st match counting from back}

# Data: Examples
# %A - The full weekday name
# %d - Day of the month, zero-padded

# algorithm
# day
#   sanitize inputs so they are equeal to the given input lowercased
#   check translator hash for equivalancy
# translators = { "first" => 1, "second" => 2, "third" => 3, "fourth" => 4, "fifth"=> 5}
# addtl keys {"teenth" =>?, "last" => 1st match counting from back}

# if the key is ageneral input
#   create a new date object using the meetup ivars of year/month
#   starting with month day one iterate each day of the month and compare
#   the full weekday day name to the to the sanitized input name value
#   if the current iteration day name is equal to the input value, add one to the count
#   if he count is equal to the translator count, return the day
#      - return a new date object with year, month, date
#   if the month ends before the count of days is achieved, rertun nil

# if the key is last
#  -- iterate the month
#  -- append all dates that match the string name of the day to an array
#  -- select the last value from the array
#  -- create a new date object with the day

#  if the key is teenth
#  if input is teenth look for range of 13-19
#    find the name of the day for the given number day
#      - date_object - strftime("%A")

# A class that helps models a relationshiop between string objects, and  a calender with the help of 'Date'
class Meetup
  TRANSLATORS = { 'first' => 1, 'second' => 2, 'third' => 3, 'fourth' => 4, 'fifth' => 5 }.freeze

  def initialize(year, month)
    @year = year
    @month = month
    @date = Date.new(@year, @month)
  end

  def day(name_of_day, key)
    num_of_days = days_in_month(@date)
    sanitized_key = key.downcase

    if TRANSLATORS.include?(sanitized_key)
      find_day(num_of_days, name_of_day, sanitized_key)
    elsif key == 'last'.downcase
      last(num_of_days, name_of_day, sanitized_key)
    elsif key == 'teenth'.downcase
      teenth(name_of_day, key)
    end
  end

  private

  def find_day(num_of_days, name_of_day, key)
    count = 0
    result = nil

    num_of_days.times do |day|
      date = Date.new(@year, @month, day + 1)
      if name_of_day.capitalize == date.strftime('%A')
        count += 1
        result = date.day if count == TRANSLATORS[key]
      end
    end

    return nil if result.nil?

    Date.new(@year, @month, result)
  end

  def last(num_of_days, name_of_day, _key)
    result = []
    num_of_days.times do |day|
      date = Date.new(@year, @month, day + 1)
      result << date.day if name_of_day.capitalize == date.strftime('%A')
    end

    Date.new(@year, @month, result.last)
  end

  def teenth(name_of_day, _key)
    days = (13..19).to_a
    result = nil

    days.each do |day|
      date = Date.new(@year, @month, day + 1)
      result = date.day if name_of_day.capitalize == date.strftime('%A')
    end

    Date.new(@year, @month, result)
  end

  def days_in_month(_date)
    Date.new(@year, @month, -1).day
  end
end
