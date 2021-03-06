class PagesController < ApplicationController
  def puzzle
    render({ :template => "pages/puzzle.html.erb" })
  end
  
  def write_cookie
  
    #Parameters: {"first_num"=>"3", "second_num"=>"1", "third_num"=>"4"}
    @first_num = params.fetch("first_num")
    @second_num = params.fetch("second_num")
    @third_num = params.fetch("third_num")

    #results of the puzzle
    if @first_num < @second_num && @second_num < @third_num 
      @puzzle_results = "yes"
    else 
      @puzzle_results = "no"
    end


    #store parameters into session
    puzzle_results = {
      :first_num => @first_num,
      :second_num => @second_num,
      :third_num => @third_num,
      :results => @puzzle_results
    }

    older_results = session.fetch(:puzzle_history)

    if older_results.class == NilClass
      older_results = Array.new
    end

    older_results.push(puzzle_results)
    session.store(:puzzle_history, older_results)

    redirect_to("/")
  end


  def write_rule
    #make a cookie with a person's rule guess

    #Parameters: {"the_rule"=>"doubling numbers"}
    user_rules = params.fetch("the_rule")

    session.store(:rule_guess, user_rules)

    redirect_to("/")
  end
end
