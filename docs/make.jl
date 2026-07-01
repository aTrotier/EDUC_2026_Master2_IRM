using Documenter
using DocumenterVitepress

makedocs(;
    # ... your other arguments ...
    format = DocumenterVitepress.MarkdownVitepress(
        repo = "github.com/CRMSB/EDUC_2026_Master2_IRM",
        devbranch = "main", # or master, trunk, ...
        devurl = "dev",
    ),
)