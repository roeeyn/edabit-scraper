defmodule Challenges do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "challenges" do
    field :city, :string
    field :temp_lo, :integer
    field :temp_hi, :integer
    field :prcp, :float, default: 0.0
    timestamps
  end
end
