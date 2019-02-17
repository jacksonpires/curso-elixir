defmodule FriendsApp.DB.CSV do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.CLI.Menu
  alias FriendsApp.CLI.Friend 
  alias NimbleCSV.RFC4180, as: CSVParser
  
  def perform(chosen_menu_item) do
    case chosen_menu_item do
      %Menu{ id: :create, label: _ } -> create()
      %Menu{ id: :read, label: _ }   -> read()
      %Menu{ id: :update, label: _ } -> Shell.info(">>>> UPDATE <<<<")
      %Menu{ id: :delete, label: _ } -> Shell.info(">>>> DELETE <<<<")
    end
    
    FriendsApp.CLI.Menu.Choice.start()
  end
  
  defp read do
    get_struct_list_from_csv
    |> show_friends
  end
  
  defp get_struct_list_from_csv do
    read_csv_file
    |> parse_csv_file_to_list
    |> csv_list_to_friend_struct_list
  end
  
  defp read_csv_file do
    Application.fetch_env!(:friends_app, :csv_file_path)
    |> File.read!
  end
  
  defp parse_csv_file_to_list(csv_file) do
    csv_file
    |> CSVParser.parse_string(headers: false)
  end
  
  defp csv_list_to_friend_struct_list(list) do
    list
    |> Enum.map(fn [email, name, phone] ->
      %Friend{name: name, email: email, phone: phone}
    end)
  end
  
  defp show_friends(friends_list) do
    friends_list
    |> Scribe.console(data: [{"Nome", :name}, {"Email", :email}, {"Telefone", :phone}])
  end
  
  defp create do
    collect_data
    |> transform_on_wrapped_list
    |> prepare_list_to_save_csv
    |> save_csv_file([:append])
  end

  defp collect_data do
    Shell.cmd("clear")
    
    %Friend{
      name: prompt_message("Digite o nome:"),
      email: prompt_message("Digite o email:"),
      phone: prompt_message("Digite o telefone:")
    }
  end
  
  defp prompt_message(message) do
    Shell.prompt(message)
    |> String.trim
  end
  
  defp transform_on_wrapped_list(struct) do
    struct
    |> Map.from_struct
    |> Map.values
    |> wrap_in_list
  end
  
  defp wrap_in_list(list) do
    [list]
  end
  
  defp prepare_list_to_save_csv(list) do
    list
    |> CSVParser.dump_to_iodata
  end
  
  defp save_csv_file(data, mode \\ []) do
    Application.fetch_env!(:friends_app, :csv_file_path)
    |> File.write!(data, mode)
  end
end