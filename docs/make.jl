using Documenter
using DocumenterVitepress

makedocs(;
    # ... your other arguments ...
    format = DocumenterVitepress.MarkdownVitepress(
        repo = "github.com/aTrotier/EDUC_2026_Master2_IRM",
        devbranch = "main", # or master, trunk, ...
        devurl = "dev",
    ),
)

DocumenterVitepress.deploydocs(;
    repo = "github.com/aTrotier/EDUC_2026_Master2_IRM",
    target = joinpath(@__DIR__, "build"),
    branch = "gh-pages",
    devbranch = "main",
    push_preview = true,
)