class ApplicationController < ActionController::Base

  # セラピスト養成コースの受講生がログイン後に遷移するpathを設定
  def therapist_training_course_student_after_sign_in_path_for(resource)
    therapist_training_course_path(resource)
  end

  # セルフケアコースの受講生がログイン後に遷移するpathを設定
  def self_care_course_student_after_sign_in_path_for(resource)
   self_care_course_path(resource)
  end

  # staffにログイン後に遷移するpathを設定
  def staff_after_sign_in_path_for(resource)
    staffs_screen_path(resource)
  end

  # 管理者にログイン後に遷移するpathを設定
  def admin_after_sign_in_path_for(resource)
    admin_screen_path(resource)
  end

  # ログアウト後に遷移するpathを設定
  def after_sign_out_path_for(resource)
    if resource_name == :student
      new_student_session_path
    elsif resource_name == :staff
      new_staff_session_path
    end
  end

  def set_student
    @student = current_student
  end  

end
