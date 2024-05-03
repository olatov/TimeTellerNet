# Use the official microsoft/dotnet-framework base image
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj .
RUN nuget restore

# Copy everything else and build the application
COPY . .
RUN msbuild /p:Configuration=Release

# Build runtime image
FROM mcr.microsoft.com/dotnet/framework/runtime:4.8 AS runtime
WORKDIR /app
COPY --from=build /app/bin/Release .

# Set entrypoint to the executable
ENTRYPOINT ["TimeTellerNet.exe"]
