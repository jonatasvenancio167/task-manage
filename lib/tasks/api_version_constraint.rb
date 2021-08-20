class ApiVersionConstraint
    def initialize(option)
        @version = options[:version]
        @default = options[:default]
    end

    def matches?(req)
      @default || req.headers['accept'].include?("application/vnd.taskmanager.v#{@version}")
    end
end