defmodule IdeaSnippets.CodesTest do
  use IdeaSnippets.DataCase

  alias IdeaSnippets.Codes

  describe "posts" do
    alias IdeaSnippets.Codes.Post

    @valid_attrs %{codede: "some codede", description: "some description", title: "some title"}
    @update_attrs %{codede: "some updated codede", description: "some updated description", title: "some updated title"}
    @invalid_attrs %{codede: nil, description: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Codes.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Codes.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Codes.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Codes.create_post(@valid_attrs)
      assert post.codede == "some codede"
      assert post.description == "some description"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Codes.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, %Post{} = post} = Codes.update_post(post, @update_attrs)
      assert post.codede == "some updated codede"
      assert post.description == "some updated description"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Codes.update_post(post, @invalid_attrs)
      assert post == Codes.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Codes.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Codes.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Codes.change_post(post)
    end
  end
end
