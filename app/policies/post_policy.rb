class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def edit?
    @record.user == @user
  end

  def update?
    edit?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
