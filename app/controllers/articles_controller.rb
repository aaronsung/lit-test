class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_catalog, only:[:index,:new,:edit,:update,:catalog]
  before_action :authorize, only:[:new,:edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    if params[:search]
      @articles = Article.search(params[:search])
    elsif params[:catalog]
         @articles = Article.search_catalog(params[:catalog])
      else
         @articles = Article.all
       end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article.view_count += 1
    @article.save
    yomu = Yomu.new @article.upload
    @content = yomu.text
  end

  def showown
    @articles = Article.all
  end

  # GET /articles/new
  def new
    @article = Article.new
    @articles = Article.all
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.view_count = 0
    @article.editor_id = session[:user_id]
    yomu = Yomu.new @article.upload
    @article.content = yomu.text

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article}
        #, notice: 'Article was successfully created.' 
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article }
        #, notice: 'Article was successfully updated.'
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to action:'catalog' }
      #, notice: 'Article was successfully destroyed.'
      format.json { head :no_content }
    end
  end

  def catalog

  end

  def upload
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :view_count, :catalog, :upload)
    end

    #Set Catalog array and constant
    def set_catalog
      @catalogs = ['Hot popular','Detective','Science','Horror','Historical','Love']
      # @catalogs_group = []
      # @catalogs.each do |catalog|
      #   @catalogs_group.push([catalog,catalog])
      # end
      @fiction=' fiction'
    end
end
