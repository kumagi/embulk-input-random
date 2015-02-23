# -*- coding:utf-8 -*-

module Embulk
  require 'securerandom'
  class InputRandom < InputPlugin
    require 'json'

    Plugin.register_input('random', self)

    def self.transaction(config, &control)
      schema = config.param('schema', :hash)
      rows = config.param('rows', :integer, default: 5000)
      threads = config.param('threads', :integer, default: 1)

      columns = schema.each_with_index.map{|column, index|
        attr, type = column
        # TODO: type should more flexible
        case type.downcase
        when "boolean"
          Column.new(index, attr, :boolean)
        when "string"
          Column.new(index, attr, :string)
        when "integer", "int", "long", "primary_key"
          Column.new(index, attr, :long)
        when "double", "float"
          Column.new(index, attr, :double)
        when "date"
          Column.new(index, attr, :timestamp)
        end
      }

      task = {'schema' => schema, 'rows' => rows}

      puts "Random generation started."
      commit_reports = yield(task, columns, threads)
      puts "Random input finished. Commit reports = #{commit_reports.to_json}"

      return {}
    end

    def initialize(task, schema, index, page_builder)
      super
    end

    def run
      puts "Random generator input thread #{@index}..."
      rows = @task['rows']
      schema = @task['schema']

      rows.times{|n|
        @page_builder.add(schema.map{|attr, type|
                            case type
                            when "string"
                              SecureRandom.urlsafe_base64(32)
                            when "integer", "int", "long"
                              (Random.rand * 10000).to_i
                            when "primary_key"
                              n
                            when 'float', 'double'
                              Random.rand * 10000
                            when 'date'
                              Time.at(rand * Time.now.to_f)
                            else
                              raise "unknown type: #{type}"
                            end
                          })
      }
      @page_builder.finish

      {  # commit report
        "rows" => rows,
        "columns" => schema.size
      }
    end
  end

end
