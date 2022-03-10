class Profile < ApplicationRecord
  # Direct associations

  has_many   :settings,
             :dependent => :destroy

  has_many   :pages,
             :foreign_key => "writer_id",
             :dependent => :destroy

  has_many   :social_links,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :password, :presence => true

  # Scopes

  def to_s
    email
  end

end
