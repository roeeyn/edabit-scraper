defmodule MongoChallengesUploader do
  alias MongoChallengesUploader.Impl.Uploader

  defdelegate upload_challenges_from_asset(folder_name), to: Uploader
  defdelegate upload_challenges(challenges), to: Uploader
  defdelegate load_challenges_from_asset(folder_name), to: Uploader
end
