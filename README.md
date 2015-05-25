# RClusters

RClusters is a Ruby gem that creates clusters from a geographic points hash using either pixel or surface distance calculations.
The input is a hash and the output is another hash. Right now, **a max_distance value has to be provided**.

Based on [this post](http://www.appelsiini.net/2008/introduction-to-marker-clustering-with-google-maps).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rclusters'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rclusters

## Usage

Calculating clusters based on pixel distances:
```ruby
require 'rclusters'

opts = {}

rcluster = RClusters::ScreenDistance.new(opts)

data = [{:lat=>-23.607581, :lon=>-46.630046,...},
        {:lat=>-23.511634, :lon=>-46.71541,...},...]

clusters = rcluster.calculate(data,2000) # 2000px as max_distance
```

Calculating clusters based on surface distances:
```ruby
require 'rclusters'

opts = {}

rcluster = RClusters::SurfaceDistance.new(opts)

data = [{:lat=>-23.607581, :lon=>-46.630046,...},
        {:lat=>-23.511634, :lon=>-46.71541,...},...]

clusters = rcluster.calculate(data,200) # 200 mts as max_distance
```


Result example:

```ruby
[ {:size=>9,
   :cluster=>
   [{:lat=>-23.607581, :lon=>-46.630046,...},
    {:lat=>-23.511634, :lon=>-46.71541,...},
    {:lat=>-23.56957, :lon=>-46.628092,...},
    {:lat=>-23.611887, :lon=>-46.67767,...}]},
  {:size=>1, 
   :cluster=>[{:lat=>-22.4356084066, :lon=>-46.97118445}]},
  {:size=>1, 
   :cluster=>[{:lat=>-23.472742, :lon=>-46.600197}]}
 ]
             
```

## Public Methods

```
calculate(Array of hashes points, Integer max_distance, opts) 
```
Args are optional if passed in instantiation.

### Options
Either in instantiation or in the `calculate` method.

#### Common

(Optional if passed as args in the `calculate` method)

| Option        | Info       | Values |      
---------|-------|------
| `points`| Points to be clustered |Array of points [hashes]|
| `max_distance`  | Maximum distance between points in order to cluster them | Integer. Unit `px` using de `ScreenDistance` class or the one matching `default_units` option if using `SurfaceDistance`  |

#### ScreenDistance

| Option        | Info       | Values |      
---------|-------|------
| `zoom`  | Distance is processed by a Google Maps type zoom scale | Integer . Default: `12` | 

#### SurfaceDistance

| Option        | Info       | Values |      
---------|-------|------
| `default_units`  | Geokit option| Symbol . Default: `:meters`. Others: `:miles`, `:kms`, `:nms` | 
| `default_formula` | Geokit option | Symbol. Default: `:sphere`.|


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rclusters/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request