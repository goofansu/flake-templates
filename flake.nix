{
  description = "A collection of flake templates";

  outputs = { self }: {
    templates = {
      direnv = {
        path = ./direnv;
        description = "A direnv template using the latest stable nixpkgs";
      };
    };

    defaultTemplate = self.templates.direnv;
  };
}
