pub struct FQName(@package.PackageName, @module.ModulePath, @name.Name) derive(Eq, Hash, Show)

pub fn fq_name(package_name:@package.PackageName, module_path: @module.ModulePath, local_name: @name.Name) -> FQName {
    FQName(package_name, module_path, local_name)
}

pub fn FQName::package_name(self: FQName) -> @package.PackageName {
    self.0
}

pub fn FQName::module_path(self: FQName) -> @module.ModulePath {
    self.1
}

pub fn FQName::local_name(self: FQName) -> @name.Name {
    self.2
}