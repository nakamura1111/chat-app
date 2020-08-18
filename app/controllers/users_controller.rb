class UsersController < ApplicationController

  def edit
  end

  def update
    # current_user.update(user_params)             「今のユーザー」の情報を「update」します。更新する値は「user_params」です。
    if( current_user.update(user_params) )
      redirect_to(root_path)
    else
      render(:edit)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email) # 「外部からのデータ」のうち、「userモデル」の「nameとemail」の情報だけ欲しい。
  end
end
