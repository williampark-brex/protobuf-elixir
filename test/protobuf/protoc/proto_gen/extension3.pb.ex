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
