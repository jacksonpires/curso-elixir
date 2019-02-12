defmodule FriendsApp.CLI.Main do
  alias Mix.Shell.IO, as: Shell
  
  def start_app do
    Shell.cmd("clear")
    welcome_message()
    Shell.prompt("Pressione ENTER para continuar...")
    starts_menu_choice()
  end
  
  defp welcome_message do
    Shell.info("=========== Friends App ===========")
    Shell.info("Seja bem-vindo à sua agenda pessoal!")
    Shell.info("===================================")
  end
  
  defp starts_menu_choice do
    FriendsApp.CLI.Menu.Choice.start
  end
end