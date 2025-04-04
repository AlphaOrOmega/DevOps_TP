FROM mcr.microsoft.com/dotnet/sdk:8.0 as source-env
ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGETARCH
RUN echo "TARGETPLATFORM: $TARGETPLATFORM" && echo "BUILDPLATFORM: $BUILDPLATFORM" && echo "TARGETARCH: $TARGETARCH"
WORKDIR /source
COPY . /source
RUN dotnet restore -a $TARGETARCH
RUN dotnet publish -c release -o /app -a $TARGETARCH --self-contained false --no-restore


FROM mcr.microsoft.com/dotnet/runtime:8.0
WORKDIR /app
COPY --from=source-env /app .
CMD ["dotnet", "Worker.dll"]
