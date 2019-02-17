defmodule Mix.Tasks.Start do
  use Mix.Task

  @shortdoc "Starts [Friends App]"
  def run(_), do: FriendsApp.init()
end
