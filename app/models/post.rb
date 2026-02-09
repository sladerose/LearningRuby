class Post < ApplicationRecord
  # Broadcast changes in real-time to the "posts" stream
  # inserts_by: :prepend causes new posts to be added to the top of the list
  broadcasts_to ->(post) { "posts" }, inserts_by: :prepend
end
