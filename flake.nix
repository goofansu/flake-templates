{
  description = "My flake templates";

  outputs = { self }: {
    templates = {
      rails-postgres = {
        path = ./rails-postgres;
        description = "Rails devenv with PostgreSQL";
      };
      rails-mysql = {
        path = ./rails-mysql;
        description = "Rails devenv with MySQL";
      };
    };
  };
}
