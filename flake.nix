{
  description = "My flake templates";

  outputs = { self }: {
    templates = {
      rails-postgres = {
        path = ./rails-postgres;
        description = "Rails development environment with PostgreSQL";
      };
      rails-mysql = {
        path = ./rails-mysql;
        description = "Rails development environment with MySQL";
      };
      hugo-basic = {
        path = ./hugo-basic;
        description = "Hugo development environment";
      };
      hugo-modus = {
        path = ./hugo-modus;
        description = "Hugo development environment with hugo-modus theme";
      };
    };
  };
}
