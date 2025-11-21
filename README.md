# PHP-CLI Docker Image

用于 GitLab Runner 的 PHP 8.4 CLI 镜像。

## 包含内容

- PHP 8.4 CLI
- Composer
- vim
- curl
- git
- wget
- unzip
- 其他常用工具

## 构建镜像

```bash
# 默认使用官方 deb.debian.org
docker build -t php-cli:8.4 .

# 多架构构建
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t php-cli:8.4 --push .
```

## 使用示例

```bash
# 运行容器
docker run -it --rm php-cli:8.4

# 在容器中执行命令
docker run -it --rm php-cli:8.4 php -v
docker run -it --rm php-cli:8.4 composer --version
```

## GitLab CI 使用示例

```yaml
image: php-cli:8.4

before_script:
  - composer install

test:
  script:
    - php vendor/bin/phpunit
```

