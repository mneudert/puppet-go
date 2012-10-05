require 'puppet/provider/package'

Puppet::Type.type(:package).provide :go, :parent => ::Puppet::Provider::Package do

    desc "Golang packages in puppet"

    has_feature :installable, :uninstallable

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
        fail "Not implemented yet (install)"
    end

    # Uninstall a package.
    def uninstall
        fail "Not implemented yet (uninstall)"
    end
end