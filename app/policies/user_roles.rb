module UserRoles
  def manager?
    user.manager?
  end

  def principal?
    false
  end

  def class_teacher?
    false
  end

  def parent_of_current_user?
    user.guardian?
  end

  def student?
    user.student?
  end

  def class_mate?
    false
  end

  def subject_teacher?
    true
  end
end