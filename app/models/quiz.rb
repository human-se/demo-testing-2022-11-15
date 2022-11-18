# == Schema Information
#
# Table name: quizzes
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Quiz < ApplicationRecord

    has_many(
        :questions,
        class_name: 'Question',
        foreign_key: 'quiz_id',
        inverse_of: :quiz,
        dependent: :destroy
    )

    belongs_to(
        :creator,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :quizzes
    )

    validates :title, presence: true
    validates :title, length: { maximum: 32 }
    
end
