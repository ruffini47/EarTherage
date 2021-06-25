class Schedule < ApplicationRecord
  mount_uploader :image, ScheduleUploader

  #仮--------------------------------
  validates :title, presence: true
  validates :date, presence: true
  #------------------------------------

#検索機能--------------------------------------------------------------------
  enum area: {関東: 0, 関西: 1, 中国・四国: 2, 九州: 3, オンライン: 4}
  enum event_type: {イベント: 1, 講座: 2}
  enum teacher: {山本: 1, 田中: 2, 井上: 3}

  enum public_status: {公開: 1, 非公開: 2, 中止: 3}
  # validates :date, presence: true

  #開催エリアによる絞り込み
  scope :get_by_area, ->(area) {
    where(area: area)
  }
  #種別による絞り込み
  scope :get_by_event_type, ->(event_type) {
    where(event_type: event_type)
  }
  #講師による絞り込み
  scope :get_by_teacher, ->(teacher) {
    where(teacher: teacher)
  }
#----------------------------------------------------------------------------

  # 検索機能
  def self.search(search)
    return Schedule.all unless search
    Schedule.where(['area LIKE? OR event_type LIKE? OR teacher LIKE?', "%#{search}%", "%#{search}%", "%#{search}%"])
  end
end
