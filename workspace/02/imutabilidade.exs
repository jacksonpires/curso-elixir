total = 876

defmodule Mutante do
  def mutar(valor) do
    valor = 1
    IO.puts "interno- #{valor}" # Aqui será exibido 1 ou 876?
    valor
  end
end

Mutante.mutar(total)
IO.puts "externo A- #{total}" # E aqui? 1 ou 876?

total = Mutante.mutar(total)  # rebinding
IO.puts "externo B- #{total}" # E agora, 1 ou 876?