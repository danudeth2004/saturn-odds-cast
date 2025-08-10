module Admin
  class Admin::ArticlesController < ApplicationController
    before_action :set_admin_article, only: %i[ show edit update destroy submit approve reject ]

    # GET /admin/articles or /admin/articles.json
    def index
      @articles = Article.all
      # @content = Content.al
    end

    def submit
      if @article.update(admin_article_params.merge(status: waiting_for_approve))
        redirect_to [ :admin, @article ], notice: "Article was successfully updated.", status: :see_other
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end

    def approve
      if @article.update(admin_article_params.merge(status: published))
        redirect_to [ :admin, @article ], notice: "Article was successfully updated.", status: :see_other
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end

    def reject
      if @article.update(admin_article_params.merge(status: draft))
        redirect_to [ :admin, @article ], notice: "Article was successfully updated.", status: :see_other
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
    # GET /admin/articles/1 or /admin/articles/1.json
    def show
    end

    # GET /admin/articles/new
    def new
      @article = Article.new
    end

    # GET /admin/articles/1/edit
    def edit
    end

    # POST /admin/articles or /admin/articles.json
    def create
      @article = Article.new(admin_article_params)
      if params[:commit_type] == "draft"
        @article.status = 0
      else
        @article.status = 1
      end

      respond_to do |format|
        if @article.save
          format.html { redirect_to [ :admin, @article ], notice: "Article was successfully created." }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/articles/1 or /admin/articles/1.json
    def update
      respond_to do |format|
        @article.status = params[:status]
        if @article.update(admin_article_params)
          format.html { redirect_to [ :admin, @article ], notice: "Article was successfully updated.", status: :see_other }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/articles/1 or /admin/articles/1.json
    def destroy
      @article.destroy!

      respond_to do |format|
        format.html { redirect_to admin_articles_path, notice: "Article was successfully destroyed.", status: :see_other }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_admin_article
        @article = Article.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def admin_article_params
        params.expect(article: [ :title, :description, :cover_image, :status ])
      end
  end
end
