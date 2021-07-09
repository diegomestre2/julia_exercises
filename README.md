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

# using, import and include
- include: Adds the content of the file
- using: Adds the functions defined in the module including the names into the current namespace (e.g. rate())
- import: Only loads the package but does not bring any name into the current namespace. Avoids conflicts. (e.g. Calculator.rate())

# Submodules
- We can define submodules in different files and include them in the module.
E.g.
// Calculator.jl //
module Calculator
include(Mortgage.jl)
end

// Mortgage.jl //
module Mortgage
// mortgage source code here
end

# Modify variables in a function
- When defining a function that modifies the value of an input add the '!' char after the function name

# Defining types
- Primary types are defined like any other language but in multiples of 8 bits, Int8, Int16, ... Int128.
- Complex types are defined using the keyword struct type_name end.
- Abstract types are defined using the keywords abstract type type_name end
- Abstract child types are defined as abstract type type_name <: type_father end
