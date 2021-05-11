defmodule CassianDashboard.Structs.Command do
  @moduledoc """
  Command struct used in the web view.
  """

  @enforce_keys [
    :name
  ]

  defstruct [
    :name,
    :arg,
    :placeholder,
    :description
  ]

  @typedoc """
  The struct object which defines a command.
  """
  @type t() :: %__MODULE__{
          name: String.t() | nil,
          arg: String.t() | nil,
          placeholder: String.t() | nil,
          description: String.t() | nil
        }

  @typedoc "The calling name of the command. It is enforced!"
  @type name :: String.t()

  @typedoc "The argument of the command which isn't edited with the search bar,"
  @type arg :: String.t() | nil

  @typedoc "The plcaholder value which is edited in the search bar."
  @type placeholder :: String.t() | nil

  @typedoc "The description of the command."
  @type description :: String.t() | nil

  @doc """
  Get the command struct from a keyword list. Raises an error if required
  fields are not present.
  """
  @spec command!(
          keylist :: [
            name: String.t(),
            arg: String.t() | nil,
            placeholder: String.t() | nil,
            description: String.t() | nil
          ]
        ) :: %__MODULE__{} | ArgumentError
  def command!(keylist) do
    %__MODULE__{
      name: Keyword.get(keylist, :name),
      arg: Keyword.get(keylist, :arg),
      placeholder: Keyword.get(keylist, :placeholder),
      description: Keyword.get(keylist, :description)
    }
  end
end