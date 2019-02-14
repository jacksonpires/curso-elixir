defmodule FriendsApp.DB.CSV do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.CLI.Menu
  
  def perform(chosen_menu_item) do
    case chosen_menu_item do
      %Menu{ id: :create, label: _ } -> Shell.info(">>>> CREATE <<<<")
      %Menu{ id: :read, label: _ }   -> Shell.info(">>>> READ <<<<")
      %Menu{ id: :update, label: _ } -> Shell.info(">>>> UPDATE <<<<")
      %Menu{ id: :delete, label: _ } -> Shell.info(">>>> DELETE <<<<")
    end
  end
end