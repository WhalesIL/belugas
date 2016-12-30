module FD
  module Analyzer
    module Formatters
      class Formatter
        def initialize(filesystem, output = $stdout)
          @filesystem = filesystem
          @output = output
        end

        def write(data)
          json = JSON.parse(data)
          json["engine_name"] = current_engine.name

          case json["type"].downcase
          when "feature"
            features << json
          when "warning"
            warnings << json
          else
            raise "Invalid type found: #{json["type"]}"
          end
        end

        def started
        end

        def engine_running(engine)
          @current_engine = engine
          yield
        ensure
          @current_engine = nil
        end

        def finished
        end

        def close
        end

        def failed(_output)
        end

        InvalidFormatterError = Class.new(StandardError)

        private

        attr_reader :current_engine
      end
    end
  end
end
