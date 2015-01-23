class User < ActiveRecord::Base
  has_many :asks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def get_constituency_pa_id_from_postcode(postcode)
    pa_id = $twfy.constituency(postcode: postcode).pa_id
  end
  
end
