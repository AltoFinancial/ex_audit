defmodule ExAudit.Test.PrivateUser do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {ExAudit.Tracker, except: [:transient_field]}

  @schema_prefix "private"
  schema "users" do
    field :email, :string
    field :name, :string
    field :birthday, :date

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name, :birthday])
  end
end
