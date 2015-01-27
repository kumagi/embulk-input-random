# Embulk::Plugin::Input::Random

Random data generator for [Embulk](https://github.com/embulk/embulk).
Expected to used to test or benchmark.

## Installation

Run this command with your embulk binary.

```ruby
java -jar embulk.jar gem install embulk-plugin-input-random
```

## Usage

Specify in your config.yml file

```yaml
in:
  type: random
  rows: 100
  threads: 2
  schema:
    myid: primary_key
    name: string
    score: integer
```

- type: specify this plugin as `random`
- rows: number of inserting rows (required)
- threads: number of thread (optional)
- schema: specify the attribute of table and data type (required)


### Try

You can try this plugin with saving below as random.yaml

```
exec: {}
in:
  type: random
  rows: 100
  threads: 1
  schema:
    id: primary_key
    name: string
    score: integer
out:
  type: stdout
```

and just run

```
$ java -jar embulk.jar run random.yml
```

will generate result like

```
Random generation started.
2015-01-29 02:13:15,497 [INFO]: main:org.embulk.exec.LocalExecutor: Running 4 tasks using 8 local threads
2015-01-29 02:13:15,498 [INFO]: main:org.embulk.exec.LocalExecutor: {done:  0 / 4, running: 0}
Random generator input thread 2...
Random generator input thread 0...
Random generator input thread 1...
Random generator input thread 3...
0,FamwnrENyzxADpecnTQP2lClzJPO1acRC1506d3VUf4,3791
1,aAA6K0T8L6plLrux9dqd2oFLZWBkYyNnZKGstN3sRRA,9942
2,tgGcwBPxZ-tQgJmTdIJXgiv-MDBvbUKnMMn1KjNixlo,5907
3,SyxFHOepjo5WbNgukUEZY7CVT5Y6XGeVb8Gdsdq_EI8,6378
4,5vfOwlw_xLhaYkd5dXCUaC3TsAyzDbD12GHohy2SXsM,6132
5,-C_6oNt1Z07RKlGKQ8_OVbCCuHbC-LOLFl5HrIE8y9c,7520
```

You can insert arbitrary storage via Embulk!

### Data Type

Now supported types are belows
- string: 32bytes of ascii code string
- integer: random integer 0 to 10000
- primary_key: increasing number for each rows
- float: random floating point 0 to 10000
- date: random date from 1970 to now

More and more types will be appended...

## Todo

- Add more data type to generate
  - fake user names
  - flexible length of strings
  - flexible range of numerics
  - random generator with gaussian
  - binary

## Contributing

1. Fork it ( https://github.com/kumagi]/embulk-plugin-input-random/fork )
2. Create your feature branch (`git checkout -b my-cool-feature`)
3. Commit your changes (`git commit -am 'Add cool feature'`)
4. Push to the branch (`git push origin my-cool-feature`)
5. Create a new Pull Request
