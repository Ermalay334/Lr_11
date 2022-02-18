class ArmstController < ApplicationController
  def input; end

  def view
   if (params[:v1]=='') || (params[:v1].to_i.to_s=='0') 
      @numbers = 'Incorrect!'
   else
      @received = params[:v1].to_i
      num = Armst.find_by!(number: @received)
      @result = "Числа Армстронга длиной #{@received}"
      @numbers = num.decomp
    end
  rescue ActiveRecord::RecordNotFound
    @result = "Числа Армстронга длиной #{@received}"
    @numbers = find_numbers(@received)
    Armst.create(number: @received, decomp: @numbers)
 end

  def results
    result = Armst.all.map { |el| { number: el.number, decomp: el.decomp } }
    respond_to do |format|
      format.xml { render xml: result.to_xml }
    end
  end

  def num_degree(len)
    (0..9).map { |x| x**len }
  end

  def armstr(x, deg)
    x.digits(10).inject(0) { |sum, n| sum + deg[n.to_i] } == x
  end

  def find_numbers(length)
    deg = num_degree(length)
    numbers = []
    (10**(length - 1)..(10**length)).each do |x|
      numbers.push([x, x.to_s.split('').map { |n| "#{n}^#{length}" }.join("\s+\s")]) if armstr(x, deg)
    end
    numbers
  end

end
