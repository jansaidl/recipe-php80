# Zerops + php 7.4

Import a service to an existing Zerops project.

```yaml
services:
  - hostname: php74
    type: ubuntu@24.04
    zeropsYaml: php74
    buildFromGit: https://github.com/jansaidl/recipe-php74
    enableSubdomainAccess: true
```

# Customizations

* `src/`  - your application code
* `image/` - nginx and php config files

