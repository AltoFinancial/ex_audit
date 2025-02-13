defmodule SchemaTypeTest do
  use ExUnit.Case

  alias ExAudit.Type.Schema, as: SchemaType
  alias ExAudit.Test.{User, PrivateUser}

  describe "load/1" do
    test "should load unprefixed schema" do
      assert SchemaType.load("users") == {:ok, User}
    end

    test "should load prefixed schema" do
      assert SchemaType.load("private.users") == {:ok, PrivateUser}
    end
  end

  describe "dump/1" do
    test "should dump unprefixed schema" do
      assert SchemaType.dump(User) == {:ok, "users"}
    end

    test "should dump prefixed schema" do
      assert SchemaType.dump(PrivateUser) == {:ok, "private.users"}
    end
  end
end
