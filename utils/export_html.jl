using PlutoSliderServer

dir = "pluto_notebooks"
output_dir = "docs/public/"

for (_,_,fn) in walkdir(dir)
    for file in filter(endswith(".jl"), fn)
        println(file)
        notebook_src  = joinpath(dir, file)
        println(notebook_src)
        
        PlutoSliderServer.export_notebook(notebook_src; 
                  Export_output_dir=output_dir,
                  Export_create_index=false)

        cp(notebook_src, joinpath(output_dir, file); force=true)
    end
end



