# Template Engine Performance Comparison
#### Ruby implementations.

## Competitors
- [Builder](https://github.com/jimweirich/builder)
- [ERB](http://ruby-doc.org/stdlib-2.0.0/libdoc/erb/rdoc/ERB.html)
- [Erubis](http://www.kuwata-lab.com/erubis/)
- [Haml](http://haml.info/)
- [Handlebars](https://github.com/cowboyd/handlebars.rb) (JS bingings)
- [Liquid](http://liquidmarkup.org/)
- [Markaby](http://markaby.github.io/)
- [Mustache](https://github.com/defunkt/mustache)
- [Slim](http://slim-lang.com/)
- [Tenjin](http://www.kuwata-lab.com/tenjin/)

... and our special guest ...

- [String interpolation](http://en.wikipedia.org/wiki/String_interpolation#Ruby)

## Running
```bash
# Prepare workspace
git clone git@github.com:localhots/template_engine_comparison.git
cd template_engine_comparison
bundle install

# Generate data for templates
./fakedata.rb 1000 > data/big.yml

# Run benchmarks
./benchmark.rb
```

## Current Results
**Intel Core i7 2.6 GHz**

```
############################################################
##       Compilation (small template) - 1.000 runs        ##
############################################################
                     user     system      total        real
tenjin           0.010000   0.010000   0.020000 (  0.015441)
string           0.040000   0.020000   0.060000 (  0.051998)
erubis           0.050000   0.010000   0.060000 (  0.076408)
erb              0.220000   0.020000   0.240000 (  0.247821)
haml             0.850000   0.040000   0.890000 (  0.888733)
slim             1.910000   0.030000   1.940000 (  1.945333)
mustache         0.020000   0.010000   0.030000 (  0.028953)
liquid           0.060000   0.020000   0.080000 (  0.072093)
markaby          0.020000   0.020000   0.040000 (  0.039350)
builder          0.020000   0.010000   0.030000 (  0.039334)

############################################################
##         Render (small template) - 10.000 runs          ##
############################################################
                     user     system      total        real
tenjin           0.100000   0.010000   0.110000 (  0.100912)
string           0.070000   0.010000   0.080000 (  0.073216)
erubis           0.080000   0.000000   0.080000 (  0.076072)
erb              0.120000   0.000000   0.120000 (  0.113194)
haml             0.200000   0.000000   0.200000 (  0.197601)
slim             0.210000   0.010000   0.220000 (  0.208949)
mustache         2.370000   0.060000   2.430000 (  2.434160)
liquid           0.360000   0.000000   0.360000 (  0.362223)
markaby          2.350000   0.030000   2.380000 (  2.366150)
builder          1.880000   0.000000   1.880000 (  1.879207)

############################################################
##        Compilation (big template) - 1.000 runs         ##
############################################################
                     user     system      total        real
tenjin           0.010000   0.010000   0.020000 (  0.015806)
string           0.020000   0.020000   0.040000 (  0.043971)
erubis           0.110000   0.020000   0.130000 (  0.136185)
erb              0.290000   0.020000   0.310000 (  0.306882)
haml             1.170000   0.020000   1.190000 (  1.189052)
slim             2.350000   0.030000   2.380000 (  2.394175)
mustache         0.020000   0.010000   0.030000 (  0.029711)
liquid           0.110000   0.020000   0.130000 (  0.129459)
markaby          0.020000   0.020000   0.040000 (  0.039971)
builder          0.030000   0.010000   0.040000 (  0.040546)

############################################################
##      Render (big template, 150KB data) - 50 runs       ##
############################################################
                     user     system      total        real
tenjin           0.160000   0.010000   0.170000 (  0.170591)
string           0.180000   0.020000   0.200000 (  0.195720)
erubis           0.210000   0.010000   0.220000 (  0.217161)
erb              0.300000   0.010000   0.310000 (  0.316516)
haml             0.460000   0.010000   0.470000 (  0.469774)
slim             0.680000   0.000000   0.680000 (  0.685463)
mustache         1.860000   0.000000   1.860000 (  1.871303)
liquid           5.240000   0.020000   5.260000 (  5.269241)
markaby          5.770000   0.010000   5.780000 (  5.780620)
builder          9.320000   0.020000   9.340000 (  9.343587)
```
