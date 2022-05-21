defmodule MongoChallengesUploader do
  alias MongoChallengesUploader.Impl.Uploader

  defdelegate upload_challenges_from_asset(folder_name), to: Uploader
end
