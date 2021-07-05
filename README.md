# julia_exercises
In your terminal, execute the command julia

# To create new packages
- using Pkg
- Pkg.add("PkgTemplates")
- using PkgTemplates
- template = Template(; license = "MIT", user = "tk3369", dir= "target_project_folder")
- generate(template, "PackageName")

By default the packages will be created in the directory ~/.julia/dev but it can
be customized by passing as value to the argument dir in template.
