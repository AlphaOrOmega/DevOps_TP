FROM mcr.microsoft.com/dotnet/sdk:8.0 as source-env
ARG TARGETPLATFORM=${TARGETPLATFORM}
ARG BUILDPLATFORM=${BUILDPLATFORM}
ARG TARGETARCH=${TARGETARCH}
RUN echo "TARGETPLATFORM: $TARGETPLATFORM" && echo "BUILDPLATFORM: $BUILDPLATFORM" && echo "TARGETARCH: $TARGETARCH"
WORKDIR /source
COPY . /source
RUN dotnet restore
RUN dotnet publish -c Release -o /app -a $TARGETARCH --self-contained false --no-restore


FROM mcr.microsoft.com/dotnet/runtime:8.0
WORKDIR /app
COPY --from=source-env /app .
RUN dotnet Worker.dll
