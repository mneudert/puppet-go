require 'puppet/provider/package'

Puppet::Type.type(:package).provide :go,
        :parent => ::Puppet::Provider::Package do

    desc "Golang packages in puppet"

    has_feature :installable, :upgradeable

    # Return an array of installed packages managed by `go` or empty array.
    def self.instances
        packages = []
        packages
    end

    # Return structured information about a particular package or `nil`.
    def query
        return nil
    end

    # Install a package.
    def install
        args = %w{get}

        case @resource[:ensure]
            when :latest
                args << "-u" << @resource[:name]
            else
                args << @resource[:name]
        end

        exec_pip *args
    end

    # Execute a `go get` command.
    # Tries to add command if not already done, raises error if that fails.
    private
    def exec_pip(*args)
        go *args
    rescue NoMethodError => e
        if gopath = which('go')
            self.class.commands :go => gopath

            go *args
        else
            raise e
        end
    end
end