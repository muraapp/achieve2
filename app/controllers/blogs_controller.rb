class BlogsController < ApplicationController
  # アクションのメソッドが実行される前に指定したメソッドを実行する
  before_action :set_blog, only: [:edit, :update, :destroy]
  
  def index
    # すべてのブログを取得する処理
    @blogs = Blog.all
  end
  
  def new
    # モデルのデータをコントローラから渡す
    # データをviewファイルに渡したいので@をつけてインスタンス変数を宣言。通常の変数はViewファイルには渡されない。
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end
  
  def create
    # createメソッドに、newアクションから渡された値(params[:blog])を渡し、ブログの保存をする
    # Blog.create(blogs_params)
    # redirect_to blogs_path, notice: "ブログを作成しました！"
    
    # バリデーションが失敗してrender new が実行された場合に変数を渡せるように。
    @blog = Blog.new(blogs_params)
    if @blog.save
      # 一覧画面に遷移して"ブログを作成しました！"とメッセージを表示する
      # 'redirect_to'は指定したURLにアクセスする
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      # 入力フォームを再描画する
      # 指定した viewをレンダリングする
      render 'new'
    end
  end
  
  
  def edit
    # 保存しているデータをデータベースから取得して変数を作成
    # edit, update, destroyで共通コード
    # @blog = Blog.find(params[:id])
  end
  
  def update
    # edit, update, destroyで共通コード
    # @blog = Blog.find(params[:id])
    @blog.update(blogs_params)
    redirect_to blogs_path, notice: "ブログを更新しました！"
  end
  
  def destroy
    # edit, update, destroyで共通コード
    # @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end
  
  def confirm
    @blog = Blog.new(blogs_params)
    # バリデーションを実行し、boolian型の戻り値を受け取る。
    # バリデーションが失敗 => true
    # バリデーションが成功 => false
    render new if @blog.invalid?
  end
  
  
  
  # 他のコントローラからメソッドを呼び出さないようにするため
  private
    def blogs_params
      # paramsメソッドで取得したものの中のblogに関する情報、さらにそこからtitleとcontentだけを許可
      params.require(:blog).permit(:title,:content)
    end
    
    # idをキーとして値を取得するメソッド
    def set_blog
      @blog = Blog.find(params[:id])
    end
  
end
