class CachesController < InheritedResources::Base

  private

    def cache_params
      params.require(:cache).permit(:search_results)
    end
end

