class Project < ActiveRecord::Base

    belongs_to :manager

    validates :name, presence: true, uniqueness: true
    validates :start_date, presence: true
end