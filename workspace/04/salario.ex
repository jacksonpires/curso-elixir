defmodule Salario do
  def calculo_do_bonus(porcentagem) do
    fn(salario) -> salario * porcentagem end
  end
end
