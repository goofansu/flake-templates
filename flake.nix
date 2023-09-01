{
  description = "A collection of flake templates";

  outputs = { self }: {
    templates = {
      direnv = {
        path = ./direnv;
        description = "A direnv template using the latest stable nixpkgs";
      };
      rails_postgres = {
        path = ./rails_postgres;
        description =
          "A devenv template for developing Rails + PostgreSQL application";
      };
    };

    defaultTemplate = self.templates.direnv;
  };
}
