class Song < ActiveRecord::Base
validates :artist, presence: true
validates :title, presence: true
end