class Public::Owner::PetsController < ApplicationController
    
    def new
        @pet = Pet.new
        @new_registration = false # 例として、追加登録フォームを表示する場合
    end
    
    def create
        @pet = current_owner.pets.build(pet_params)

    if @pet.save
         # ペット情報が保存された場合
         flash[:success] = "ペット情報が登録されました。"
         redirect_to owner_my_page_path
    else
         # ペット情報が保存されなかった場合
         flash.now[:error] = "ペット情報の登録に失敗しました。"
         puts @pet.errors.full_messages # エラーメッセージをコンソールに出力
         render :new
    end
    end
    
    def show
        @pets = Pet.all
        @pet = Pet.find(params[:id])
    end
    
    def edit
        @pet = Pet.find(params[:id])
    end
    
    def update
        @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      flash[:notice] = "ペット情報を更新しました。"
      redirect_to owner_pet_path(@pet.id)
    else
      redirect_to edit_owner_pet_path(@pet.id)
    end
    end
    
    def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to owner_my_page_path, notice: "ペット情報を削除しました。"
    end
    
    private

    def pet_params
      params.require(:pet).permit(:image, :pet_name, :pet_name_kana, :gender, :dog_breed, :dog_birthday, :trainer) #( :body )をpermit内へ追加
    end
end
