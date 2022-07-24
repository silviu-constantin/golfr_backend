# Model to represent a score played by a golfer
# - total_score: total number of hits to finish all 18 holes
# - played_at: date when the score was played
class Score < ApplicationRecord
  belongs_to :user

  validates :total_score, inclusion: { in: 27..180 }
  validate :future_score
  validate :number_holes
  validate :score_based_holes

  def serialize
    {
      id: id,
      user_id: user_id,
      user_name: user.name,
      total_score: total_score,
      played_at: played_at,
      number_of_holes: number_of_holes,
    }
  end

  private

  def future_score
    errors.add(:played_at, 'must not be in the future') if played_at > Time.zone.today
  end

  def number_holes
    errors.add(:number_of_holes, 'must be only 9 or 18') if
      number_of_holes != 9 && number_of_holes != 18
  end

  def score_based_holes
    errors.add(:number_of_holes, 'wrong range of scores based on number of holes') if
      (total_score < 54 && total_score > 180 && number_of_holes == 18) ||
      (total_score < 27 && total_score > 90 && number_of_holes == 9)
  end
end
