using Documenter
using DocumenterVitepress

using Pluto, PlutoSliderServer, Literate
using GLMakie


# 1. Configuration et génération du HTML de Pluto

makedocs(;
    sitename = "BiDiM : IRM",
    authors = "Aurélien Trotier et al.",
    pages=[
        "Course Introduction" => "index.md",
        "NMR Simulation" => Any[
        "Bloch equations" => "bloch_equations.md",
        "Extended Phase Graph" => "epg.md",
        ],
        "Radiofrequency" => Any[
        "RF and simulation" => "rf_simulation.md",
        "Adiabatic RF" => "adiabatic_rf.md",
        "SMS" => "sms.md",
        ],
        
       "Pluto Notebooks" => Any[
            "Notebooks" => "notebook_md/notebook.md",
        ],
        

    ],
    format = DocumenterVitepress.MarkdownVitepress(
        repo = "github.com/aTrotier/EDUC_2026_Master2_IRM",
        devbranch = "main", # or master, trunk, ...
        devurl = "dev",
        sidebar_drawer = true;
    ),
    source = "src",
    build = "build",
)