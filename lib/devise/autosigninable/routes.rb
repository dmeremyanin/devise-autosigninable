module ActionDispatch::Routing
  class Mapper
    protected

    # Setup routes for +AutosigninController+.
    def devise_autosignin(mapping, controllers)
      get "/:#{mapping.name}_id/autosignin/:autosignin_token",
          controller: controllers[:autosignin],
          action: 'create',
          as: :autosignin
    end
  end
end
