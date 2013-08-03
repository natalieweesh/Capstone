class Itinerary < ActiveRecord::Base
  attr_accessible :description, :time_it_takes, :user_id, :activity_ids
  
  belongs_to :user
  
  has_many :itineraries_joins
  has_many :activities, through: :itineraries_joins
  
  
  def time
    # time_hash = {"1": "less than an hour", "2": "two to three hours", "3": "four to six hours", "4": "half a day", "5": "a whole day"}
    time_hash = ["less than an hour", "one to two hours", "three to four hours", "five to six hours", "half a day", "a whole day"]
    return time_hash[self.time_it_takes]
  end
end
