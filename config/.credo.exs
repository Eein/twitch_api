%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/", "test/"]
      },
      checks: [
        {Credo.Check.Refactor.MapInto, false},
        {Credo.Check.Warning.LazyLogging, false}
      ]
    }
  ]
}
