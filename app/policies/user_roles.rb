module UserRoles
  def manager?
    user.loginable_type.nil?
  end

  def principal?
    false
  end

  def class_teacher?
    false
  end

  def parent_of_current_user?
    false
  end

  def student?
    false
  end

  def class_mate?
    false
  end

  def subject_teacher?
    true
  end
end