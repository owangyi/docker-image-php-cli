FROM php:8.4-cli

# 复制并设置 docker-apt-install 脚本
COPY docker-apt-install /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-apt-install

# 安装系统依赖和工具
RUN docker-apt-install \
    # 基础工具
    curl \
    wget \
    git \
    unzip \
    # 编辑器
    vim \
    # 其他常用工具
    ca-certificates \
    gnupg \
    lsb-release

# 安装 Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 复制并设置 entrypoint 脚本
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# 设置 Composer 环境变量
ENV COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/tmp/composer

# 容器启动校验
ENTRYPOINT ["docker-entrypoint.sh"]

