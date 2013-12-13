# Template Engine Comparison

## Running
```
git clone git@github.com:localhots/template_engine_comparison.git
cd template_engine_comparison
bundle install
./benchmark.rb
```

## Current Results
```
############################################################
##                Compilation (1000 runs)                 ##
############################################################
                     user     system      total        real
erb              0.230000   0.020000   0.250000 (  0.247248)
erubis           0.050000   0.010000   0.060000 (  0.061928)
haml             0.880000   0.050000   0.930000 (  0.935885)
jade             0.030000   0.010000   0.040000 (  0.046872)

############################################################
##                  Render (10000 runs)                   ##
############################################################
                     user     system      total        real
erb              0.140000   0.000000   0.140000 (  0.136514)
erubis           0.080000   0.000000   0.080000 (  0.085103)
haml             0.250000   0.020000   0.270000 (  0.263665)
jade            13.680000  19.040000 786.690000 (805.931950)
```
