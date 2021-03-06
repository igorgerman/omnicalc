class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @newtext = @text.downcase

      space_count = @text.count " "

    @character_count_without_spaces =
      @character_count_with_spaces - space_count




      @array = @newtext.split(" ")

    @word_count = @array.length
      @speci_dc = @special_word.downcase
    @occurrences = @array.count @speci_dc

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    periodic = (@apr/100)/12.0
    n = @years * 12.0
    per_n = @principal * periodic
    oneplusr = 1.0 + periodic
    neg_n = n * -1.0
    denominator = 1.0 - (oneplusr**(neg_n))

    @monthly_payment = per_n/denominator


 ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = @seconds/60.0
    @hours = @minutes/60.0
    @days = @hours/24.0
    @weeks = @days/7
    @years = @weeks/52

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum

    @median = (@sorted_numbers[(@count-1.0)/2] + @sorted_numbers[@count/2])/2

    @sum = @numbers.sum

    @mean = @sum/@count

      vararray = []
    @numbers.each do |unit|
       vararray.push((@mean - unit)**2)
      end

    @variance = vararray.sum / vararray.count

    @standard_deviation = @variance**(0.5)

#mode
    @most_present_number_count = 0

 @sorted_numbers.each do |snum|
   if @sorted_numbers.count(snum) > @most_present_number_count
     @most_present_number_count = @sorted_numbers.count(snum)
     @most_present_number = snum
   end
 end
   @mode = @most_present_number

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
