class LinksController < InheritedResources::Base

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end
end

