class Blog < ActiveRecord::Base
    # validateはsave,create,updateなど、データを保存更新するときに実行
    validates :title, presence: true
end
