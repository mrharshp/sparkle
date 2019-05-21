class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # Anyone can view a restaurant
  end

  def create?
    return true
  end

  def edit?
    record.user == user || user&.admin?
  end

  def update?
    edit?
    # - record: the item passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    edit?
  end
end
