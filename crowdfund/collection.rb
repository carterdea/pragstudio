class Collection
  def initialize(collection_name)
    @collection_name = collection_name
    @collection_projects = []
  end

  def add_project(a_project)
    @collection_projects << a_project
  end

  def request_funding
    "There are #{@collection_projects.length} Projects in #{@collection_name}:\n" + @collection_projects.join("\n")
  end
end
