class TripsPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
        scope
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    record.guide == user
  end

  def edit?
    update?
  end

  def destroy?
    false
  end
end
