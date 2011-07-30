# Ta-Lib function mapping class 
# Function: 'STOCHRSI'
# Description: 'Stochastic Relative Strength Index'
# This file has been autogenerated - Do Not Edit.
class Indicator::AutoGen::StochRsi
  include Indicator::DataMapper

  # Time Period <Integer>
  attr_accessor :time_period
  # Fast-K Period <Integer>
  attr_accessor :fast_k_period
  # Fast-D Period <Integer>
  attr_accessor :fast_d_period
  # Fast-D MA <MA Type>
  attr_accessor :fast_d_ma

  def initialize(*args)
    if args.first.is_a? Hash
      h = args.first
      @time_period = h[:time_period] || 14
      @fast_k_period = h[:fast_k_period] || 5
      @fast_d_period = h[:fast_d_period] || 3
      @fast_d_ma = h[:fast_d_ma] || 0
    else
      @time_period = args[0] || 14 
      @fast_k_period = args[1] || 5 
      @fast_d_period = args[2] || 3 
      @fast_d_ma = args[3] || 0 
    end
    
    @func = TaLib::Function.new("STOCHRSI")
  end

  # Is price data required as an input
  def self.price_input?
    false
  end

  # The list of arguments
  def self.arguments
    [ :time_period, :fast_k_period, :fast_d_period, :fast_d_ma ]
  end

  # The minimum set of inputs required
  def self.inputs
    [ :in_real ]
  end

  # The outputs generated by this function
  def self.outputs
    [ :out_fast_k, :out_fast_d ]
  end

  def run(in_real)
    len = in_real.length
    @func.in_real(0, map(in_real))

    @func.opt_int(0, @time_period)
    @func.opt_int(1, @fast_k_period)
    @func.opt_int(2, @fast_d_period)
    @func.opt_int(3, @fast_d_ma)

    out_fast_k = Array.new(len)
    @func.out_real(0, out_fast_k)
    out_fast_d = Array.new(len)
    @func.out_real(1, out_fast_d)
  
    @func.call(0, len - 1)

  {:out_fast_k => out_fast_k,
    :out_fast_d => out_fast_d}
  end
end