defmodule Mix.Tasks.Start do
  use Mix.Task

  @shortdoc "Starts [Friends App]"
  def run(_), do: FriendsApp.CLI.Main.start_app
end
