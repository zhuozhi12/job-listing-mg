class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         #//devise的注册增加user栏，当用户还没设置用户名时，加的判断
         def display_name
           if self.username.present?
             self.username
           else
             self.email.split("@").first
           end
         end


         def admin?
    is_admin
  end

  has_many :resumes
end
