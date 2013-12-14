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
- [Tagz](https://github.com/ahoward/tagz)
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
builder          0.040000   0.010000   0.050000 (  0.051603)
erb              0.240000   0.020000   0.260000 (  0.252003)
erubis           0.060000   0.020000   0.080000 (  0.082601)
haml             0.850000   0.030000   0.880000 (  0.880267)
handlebars       0.100000   0.030000   0.130000 (  0.124923)
liquid           0.050000   0.020000   0.070000 (  0.074742)
markaby          0.020000   0.010000   0.030000 (  0.040555)
mustache         0.020000   0.020000   0.040000 (  0.028828)
slim             1.980000   0.050000   2.030000 (  2.038820)
string           0.030000   0.020000   0.050000 (  0.045661)
tagz             0.010000   0.000000   0.010000 (  0.017564)
tenjin           0.010000   0.010000   0.020000 (  0.015479)

############################################################
##         Render (small template) - 10.000 runs          ##
############################################################
                     user     system      total        real
builder          1.890000   0.000000   1.890000 (  1.893341)
erb              0.110000   0.000000   0.110000 (  0.109126)
erubis           0.080000   0.000000   0.080000 (  0.078112)
haml             0.210000   0.010000   0.220000 (  0.212483)
handlebars       0.690000   0.040000   0.730000 (  0.701104)
liquid           0.350000   0.000000   0.350000 (  0.353939)
markaby          2.450000   0.070000   2.520000 (  2.518086)
mustache         2.510000   0.060000   2.570000 (  2.569790)
slim             0.210000   0.010000   0.220000 (  0.213641)
string           0.090000   0.000000   0.090000 (  0.091101)
tagz             1.010000   0.020000   1.030000 (  1.035361)
tenjin           0.110000   0.000000   0.110000 (  0.112881)

############################################################
##        Compilation (big template) - 1.000 runs         ##
############################################################
                     user     system      total        real
builder          0.020000   0.020000   0.040000 (  0.043931)
erb              0.280000   0.020000   0.300000 (  0.302882)
erubis           0.110000   0.020000   0.130000 (  0.135634)
haml             1.140000   0.030000   1.170000 (  1.171942)
handlebars       0.100000   0.030000   0.130000 (  0.118258)
liquid           0.110000   0.020000   0.130000 (  0.130391)
markaby          0.020000   0.010000   0.030000 (  0.042543)
mustache         0.020000   0.020000   0.040000 (  0.035402)
slim             2.400000   0.040000   2.440000 (  2.440354)
string           0.030000   0.020000   0.050000 (  0.044737)
tagz             0.010000   0.010000   0.020000 (  0.017057)
tenjin           0.010000   0.000000   0.010000 (  0.015773)

############################################################
##      Render (big template, 150KB data) - 50 runs       ##
############################################################
                     user     system      total        real
builder          9.270000   0.030000   9.300000 (  9.289956)
erb              0.310000   0.000000   0.310000 (  0.313369)
erubis           0.200000   0.010000   0.210000 (  0.214869)
haml             0.490000   0.010000   0.500000 (  0.495157)
handlebars       5.170000   0.060000   5.230000 (  5.221436)
liquid           5.770000   0.050000   5.820000 (  5.836171)
markaby          6.280000   0.020000   6.300000 (  6.303951)
mustache         2.160000   0.000000   2.160000 (  2.164364)
slim             0.700000   0.010000   0.710000 (  0.702391)
string           0.350000   0.020000   0.370000 (  0.370049)
tagz            10.670000   0.190000  10.860000 ( 10.868873)
tenjin           0.240000   0.010000   0.250000 (  0.255957)
```
