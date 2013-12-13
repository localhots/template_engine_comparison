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
erb              0.250000   0.020000   0.270000 (  0.273794)
erubis           0.090000   0.020000   0.110000 (  0.101115)
haml             0.890000   0.030000   0.920000 (  0.918534)
slim             2.250000   0.040000   2.290000 (  2.300705)

############################################################
##                  Render (10000 runs)                   ##
############################################################
                     user     system      total        real
erb              0.140000   0.000000   0.140000 (  0.134512)
erubis           0.120000   0.010000   0.130000 (  0.118106)
haml             0.270000   0.000000   0.270000 (  0.276007)
slim             0.100000   0.000000   0.100000 (  0.108792)
```
