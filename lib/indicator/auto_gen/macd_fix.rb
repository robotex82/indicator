# Ta-Lib function mapping class 
# Function: 'MACDFIX'
# Description: 'Moving Average Convergence/Divergence Fix 12/26'
# This file has been autogenerated - Do Not Edit.
class Indicator::AutoGen::MacdFix
  include Indicator::DataMapper

  # Signal Period <Integer>
  attr_accessor :signal_period

  def initialize(*args)
    if args.first.is_a? Hash
      h = args.first
      @signal_period = h[:signal_period] || 9
    else
      @signal_period = args[0] || 9 
    end
    
    @func = TaLib::Function.new("MACDFIX")
  end

  # Is price data required as an input
  def self.price_input?
    false
  end

  # The list of arguments
  def self.arguments
    [ :signal_period ]
  end

  # The minimum set of inputs required
  def self.inputs
    [ :in_real ]
  end

  # The outputs generated by this function
  def self.outputs
    [ :out_macd, :out_macd_signal, :out_macd_hist ]
  end

  def run(in_real)
    len = in_real.length
    @func.in_real(0, map(in_real))

    @func.opt_int(0, @signal_period)

    out_macd = Array.new(len)
    @func.out_real(0, out_macd)
    out_macd_signal = Array.new(len)
    @func.out_real(1, out_macd_signal)
    out_macd_hist = Array.new(len)
    @func.out_real(2, out_macd_hist)
  
    @func.call(0, len - 1)

  {:out_macd => out_macd,
    :out_macd_signal => out_macd_signal,
    :out_macd_hist => out_macd_hist}
  end
end