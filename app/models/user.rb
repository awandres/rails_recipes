class User < ApplicationRecord
  # Each user needs their own schedules to assign recipes, It makes sense to
  # create them when the user is created. Just like how ActionController provides
  # callbacks like `before_action` to perform extra work on certain conditions,
  # ActiveRecord has similar callbacks which can happen before or after certain
  # conditions like before/after a model is deleted, updated, or created...
  after_create :create_schedule

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :recipes, dependent: :destroy
  has_many :schedules

  # Here we can create the schedule objects for a user
  def create_schedule
    mon = Day.find_by(name: 'Monday')
    tues = Day.find_by(name: 'Tuesday')
    wed = Day.find_by(name: 'Wednesday')
    thurs = Day.find_by(name: 'Thursday')
    fri = Day.find_by(name: 'Friday')
    sat = Day.find_by(name: 'Saturday')
    sun = Day.find_by(name: 'Sunday')

    self.schedules.create(day: mon)
    self.schedules.create(day: tues)
    self.schedules.create(day: wed)
    self.schedules.create(day: thurs)
    self.schedules.create(day: fri)
    self.schedules.create(day: sat)
    self.schedules.create(day: sun)
  end
end
