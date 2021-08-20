class ApiVersionConstraint
    def initialize(option)
        @version = option[:version]
        @default = option[:default]
    end

    def matches?(req)
      @default || req.headers['accept'].include?("application/vnd.taskmanager.v#{@version}")
    end
end