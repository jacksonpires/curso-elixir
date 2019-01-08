defmodule Factorial do
  def of(0), do: 1
  
  def of(n) when n > 0 do
      n * of(n-1)
  end
end

# 5 * 4 * 3 * 2 * 1 * 1

# 5 * of(4)
#       4 * of(3)
#            3 * of(2)
#                 2 * of(1)
#                       1 * of(0)
#                             1
#                                == 120
