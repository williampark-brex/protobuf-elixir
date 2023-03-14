defmodule Ext.MyTestBehaviorMessage do
  @moduledoc false
  use Protobuf, custom_field_options?: true, syntax: :proto3

  @type t :: %__MODULE__{
          f1: float | nil
        }
  defstruct [:f1]

  def full_name do
    "ext.MyTestBehaviorMessage"
  end

  field :f1, 1, type: Google.Protobuf.DoubleValue, options: [extype: "float"]
end

defmodule Ext.MyNonTestBehaviorMessage.ArgsEntry do
  @moduledoc false
  use Protobuf, custom_field_options?: true, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  def full_name do
    "ext.MyNonTestBehaviorMessage.ArgsEntry"
  end

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Ext.MyNonTestBehaviorMessage do
  @moduledoc false
  use Protobuf, custom_field_options?: true, syntax: :proto3

  @type t :: %__MODULE__{
          args: %{String.t() => String.t()}
        }
  defstruct [:args]

  def full_name do
    "ext.MyNonTestBehaviorMessage"
  end

  field :args, 1, repeated: true, type: Ext.MyNonTestBehaviorMessage.ArgsEntry, map: true
end
