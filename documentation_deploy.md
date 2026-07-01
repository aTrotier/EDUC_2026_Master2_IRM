# Etape 1 : exporter les notebooks en .html
lancer le script `utils/export_html.jl`


# Pour tester en local

lancer depuis la racine
```julia
using LiveServer
servedocs(; buildfoldername="build/1")
```

Les notebooks doivent être positionné dans le dossier plutot notebook
