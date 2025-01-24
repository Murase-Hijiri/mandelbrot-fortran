set grid
set pm3d map
set title "Mandelbrot set"
set xlabel "real part"
set ylabel "imaginary part"
set xrange [-0.746:-0.74]
set yrange [0.1115:0.1175]
set size ratio -1
splot "./data/plot.dat" notitle
