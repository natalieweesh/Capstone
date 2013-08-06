class Itinerary < ActiveRecord::Base
  attr_accessible :description, :time_it_takes, :user_id, :activity_ids, :favorite_user_ids
  
  belongs_to :user
  
  has_many :itineraries_joins
  has_many :activities, through: :itineraries_joins
  
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
  
  def self.get_random
    Itinerary.order("RANDOM()").first
  end
  TIME_HASH = ["less than an hour", "one to two hours", "three to four hours", "five to six hours", "half a day", "a whole day"]
  def self.get_times
    TIME_HASH
  end
  
  def time
    # time_hash = {"1": "less than an hour", "2": "two to three hours", "3": "four to six hours", "4": "half a day", "5": "a whole day"}
    # time_hash = ["less than an hour", "one to two hours", "three to four hours", "five to six hours", "half a day", "a whole day"]
    return TIME_HASH[self.time_it_takes]
  end
  
  def self.search(params)
    @result = Itinerary.where('time_it_takes <= ?', params[:time])
    p "ITINERARY SIMPLE SEARCH ITINERARY SIMPLE SEARCH ITINERARY SIMPLE SEARCH ITINERARY SIMPLE SEARCH"
    p @result
  end
  
  def self.finer_search(activities_ids)
    p "ACTIVITIES_IDS ACTIVITIES_IDS ACTIVITIES_IDS ACTIVITIES_IDS ACTIVITIES_IDS ACTIVITIES_IDS ACTIVITIES_IDS"
    p activities_ids
    # @result = Itinerary.joins(:activities).where('activities.id in (?)', activities_ids).group('itineraries.id').having('COUNT(*) >= ?', activities_ids.length)
    @result = Itinerary.joins(:activities).where('activities.id in (?)', activities_ids)
    p "ITINERARY.JOINS QUERY ITINERARY.JOINS QUERY ITINERARY.JOINS QUERY ITINERARY.JOINS QUERY ITINERARY.JOINS QUERY"
    p @result
    p "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    @result
  end
  
end
