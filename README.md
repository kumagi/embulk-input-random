# Embulk::Input::Random

Random data generator for [Embulk](https://github.com/embulk/embulk).
Expected to used to test or benchmark.

## Installation

Run this command with your embulk binary.

```ruby
$ embulk gem install embulk-input-random
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
$ java -jar embulk.jar preview random.yml
```

will generate result like

```
Random generation started.
Random generator input thread 0...
+---------+---------------------------------------------+------------+
| id:long |                                 name:string | score:long |
+---------+---------------------------------------------+------------+
|       0 | UPPYQ0S1oiKDddasQxOlXPhZ9ys-FtVwH6-DIywnHG8 |        875 |
|       1 | IT8KHcI48wM_0ygtm8OVSZQSR1xA4g5lntZ9xAQwY5Y |      2,652 |
|       2 | 6HOLiPz9-srgwV8bgBX0Whd7Dq6HRUPKusZdONRxesw |      8,560 |
|       3 | r8X3G5iVZsJJEAp5Wqy8LdUte-2wmnz2Zb9gMiiTp-Q |      2,288 |
|       4 | g7DDPm6J0y6G9FYGcDgsMk-V6Rewz03sLIu3VUfmp5M |      2,065 |
|       5 | fwNJWwztnraaa9MH01sq1Uhx2iz66djdkeUSw18DFnQ |      9,214 |
|       6 | EE2WZ3Z7UIFN4U93fgjWYmGqzWEruVBVBaWJXGjfCsQ |      9,972 |
|       7 | 70WHrnDYAPx5qNtRxcG2HF-Y4yMO1SXigMep0NFtOo8 |      2,988 |
|       8 | wbbi1qQlC3x0WY8uksUc_b0PvJjN6e6QhTrykMF7BJE |        831 |
|       9 | zNBjwP_l1Fu7t8b4xIiYz7dfEO0v0BHS5vZd-xqdmCk |      8,596 |
|      10 | Rj_NNmf4MG0UASImGbmEHPKf_MUOZe97Jyrs5RQA3q4 |      1,129 |
...
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

1. Fork it ( https://github.com/kumagi]/embulk-input-random/fork )
2. Create your feature branch (`git checkout -b my-cool-feature`)
3. Commit your changes (`git commit -am 'Add cool feature'`)
4. Push to the branch (`git push origin my-cool-feature`)
5. Create a new Pull Request
