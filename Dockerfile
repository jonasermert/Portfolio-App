# Build-Stage
FROM debian:latest AS build-env

# Installiere notwendige Abhängigkeiten
RUN apt-get update && \
    apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3 && \
    apt-get clean

# Installiere Flutter
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --no-analytics --enable-web --enable-linux --enable-windows --enable-macos
RUN flutter doctor

# Setze Arbeitsverzeichnis
WORKDIR /app

# Kopiere pubspec.yaml und pubspec.lock
COPY pubspec.* ./

# Hole Abhängigkeiten
RUN flutter pub get

# Kopiere den Rest des Codes
COPY . .

# Erstelle Release-Build
RUN flutter build web --release

# Production-Stage
FROM nginx:alpine

# Kopiere die Build-Dateien
COPY --from=build-env /app/build/web /usr/share/nginx/html

# Exponiere Port 80
EXPOSE 80

# Starte Nginx
CMD ["nginx", "-g", "daemon off;"] 