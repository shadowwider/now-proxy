# 使用官方的基础镜像
FROM alpine:latest

# 安装必要的软件包
RUN apk update && apk add --no-cache \
    git \
    wget \
    tar

# 设置工作目录
WORKDIR /app

# 创建所需的目录
RUN mkdir wwwroot && \
    mkdir caddy

# 克隆项目并移动文件
RUN git clone https://github.com/shadowwider/now-proxy && \
    mv now-proxy/* /app/wwwroot && \
    rm -rf /app/now-proxy

# 下载Caddy和其他文件
RUN wget -P /app/caddy https://github.com/caddyserver/caddy/releases/download/v1.0.4/caddy_v1.0.4_linux_amd64.tar.gz && \
    tar -zxvf /app/caddy/caddy_v1.0.4_linux_amd64.tar.gz -C /app/htdocs && \
    rm -rf /app/htdocs/init && \
    rm -rf /app/caddy/caddy_v1.0.4_linux_amd64.tar.gz && \
    wget -P /app/caddy https://github.com/shadowwider/legoJar/releases/download/v2/ngweb && \
    wget -P /app/caddy https://github.com/shadowwider/legoJar/releases/download/v2/v2ctl && \
    chmod +x /app/caddy/ngweb && \
    chmod +x /app/caddy/v2ctl

# 添加启动脚本
COPY start.sh /app

# 设置执行权限
RUN chmod +x /app/start.sh

# 暴露端口
EXPOSE 80 443

# 启动容器时运行脚本
CMD ["/app/start.sh"]