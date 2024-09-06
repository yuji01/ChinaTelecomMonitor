# 基础镜像，选择一个轻量级的Alpine Linux
FROM alpine:latest

# 设置工作目录
WORKDIR /app

# 下载应用程序
RUN wget https://github.com/LambdaExpression/ChinaTelecomMonitor/releases/download/v2.0/China_Telecom_Monitor_amd64

# 赋予应用程序可执行权限
RUN chmod +x ./China_Telecom_Monitor_amd64

# 环境变量（可以在docker run时通过-e选项传递）
ENV TELECOM_USERNAME=""
ENV TELECOM_PASSWORD=""
ENV APP_PORT=8081

# 暴露端口
EXPOSE ${APP_PORT}

# 启动应用
CMD ./China_Telecom_Monitor_amd64 --prot ${APP_PORT} --username ${TELECOM_USERNAME} --password ${TELECOM_PASSWORD}
