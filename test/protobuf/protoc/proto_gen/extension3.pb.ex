defmodule Ext.MyEventMessage do
  @moduledoc false
  use Protobuf, custom_field_options?: true, syntax: :proto3

  @type t :: %__MODULE__{
          f1: float | nil
        }

  defstruct [:f1]

  def full_name do
    "ext.MyEventMessage"
  end

  def message_options do
    # credo:disable-for-next-line
    [%{is_event: true}]
  end

  field :f1, 1, type: Google.Protobuf.DoubleValue, options: [extype: "float"]
end

defmodule Ext.MyNonEventMessage.ArgsEntry do
  @moduledoc false
  use Protobuf, custom_field_options?: true, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }

  defstruct [:key, :value]

  def full_name do
    "ext.MyNonEventMessage.ArgsEntry"
  end

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Ext.MyNonEventMessage do
  @moduledoc false
  use Protobuf, custom_field_options?: true, syntax: :proto3

  @type t :: %__MODULE__{
          args: %{String.t() => String.t()}
        }

  defstruct [:args]

  def full_name do
    "ext.MyNonEventMessage"
  end

  field :args, 1, repeated: true, type: Ext.MyNonEventMessage.ArgsEntry, map: true
end
