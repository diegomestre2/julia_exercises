# julia_exercises
In your terminal, execute the command julia to start a session

# To create new packages
- using Pkg or press ]
- Pkg.add("PkgTemplates") or add PkgTemplates
- using PkgTemplates
- template = Template(; license = "MIT", user = "tk3369", dir= "target_project_folder")
- generate(template, "PackageName")

By default the packages will be created in the directory ~/.julia/dev but it can
be customized by passing as value to the argument dir in template.

# To include files

- define a file with .jl extension
- add include("file_name.jl") to your main file
- From your julia environment execute the command: include("path/to/file/main.jl")

# Revise
- Use Revise to allow the re-compilation of changes.
- From your julia environment execute the command: 
