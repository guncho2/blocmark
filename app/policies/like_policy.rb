class LikePolicy < ApplicationPolicy

  def index?
    true
  end

  def update?
    user.present? && (record.user == user)
  end

  def destroy?
    update?
   end

  def edit?
    update?
  end

  def new?
    create?
  end


end
