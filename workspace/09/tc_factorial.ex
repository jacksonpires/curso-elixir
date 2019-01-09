defmodule TCFactorial do
  def of(n), do: factorial_of(n, 1)
  
  defp factorial_of(0, acc1), do: acc1
  defp factorial_of(n, acc2) when n > 0, do: factorial_of(n - 1, n * acc2)
end

#  n  , acc
#  5    1
#  4    (5*1) = 5
#  3    (4*5) = 20
#  2    (3*20) = 60
#  1    (2*60) = 120
#  0    (1*120) = 120
  
  



