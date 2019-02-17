defmodule Mix.Tasks.Utils.AddFakeFriends do
  use Mix.Task
  alias FriendsApp.CLI.Friend
  alias NimbleCSV.RFC4180, as: CSVParser

  @shortdoc "Add Fake Friends on App"
  def run(_) do
    Faker.start()
    
    create_friends([], 50)
    |> CSVParser.dump_to_iodata
    |> save_csv_file
    
    IO.puts "Amigos cadastrados com sucesso!"
  end
  
  defp create_friends(list, count) when count <= 1 do
    list ++ [ramdon_list_friend]
  end
  
  defp create_friends(list, count) do
    list ++ [ramdon_list_friend] ++ create_friends(list, count - 1)
  end
  
  defp ramdon_list_friend do
    %Friend{
      name: Faker.Name.PtBr.name(),
      email: Faker.Internet.email(),
      phone: Faker.Phone.EnUs.phone()
    }
    |> Map.from_struct
    |> Map.values
  end
  
  defp save_csv_file(data) do
    Application.fetch_env!(:friends_app, :csv_file_path)
    |> File.write!(data, [:append])
  end
end