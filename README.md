# Portfolio App

Eine moderne Portfolio-Webanwendung, entwickelt mit Flutter. Die App zeigt Ihre GitHub-Pinned Repositories und bietet eine responsive Benutzeroberfläche.

## Features

- 🎨 Responsive Design
- 🌓 Dark/Light Mode
- 🔄 GitHub Integration
- 🚀 Docker Deployment
- 📱 Mobile-First Ansatz

## Technologie-Stack

- Flutter
- GraphQL
- Docker
- Nginx
- GitHub API

## Voraussetzungen

- Flutter SDK (^3.6.1)
- Docker & Docker Compose
- GitHub Personal Access Token

## Installation

1. Repository klonen:

```bash
git clone [repository-url]
cd portfolio-app
```

2. Abhängigkeiten installieren:

```bash
flutter pub get
```

3. Umgebungsvariablen konfigurieren:
   Erstellen Sie eine `.env` Datei im Hauptverzeichnis:

```env
GITHUB_USERNAME=IhrGitHubUsername
GITHUB_TOKEN=IhrGitHubToken
```

## Entwicklung

```bash
flutter run -d chrome
```

## Docker Deployment

1. Docker Image bauen und starten:

```bash
docker-compose up --build
```

2. Im Hintergrund ausführen:

```bash
docker-compose up -d --build
```

3. Container stoppen:

```bash
docker-compose down
```

Die Anwendung ist dann unter `http://localhost` verfügbar.

## Projektstruktur

```
lib/
├── config/         # Konfigurationsdateien
├── models/         # Datenmodelle
├── screens/        # UI-Screens
├── services/       # API-Services
└── widgets/        # Wiederverwendbare Widgets
```

## GitHub Integration

Die App verwendet die GitHub GraphQL API, um Ihre gepinnten Repositories anzuzeigen. Stellen Sie sicher, dass Sie einen GitHub Personal Access Token mit den folgenden Berechtigungen haben:

- `read:user`
- `repo`

## Lizenz

MIT License - siehe [LICENSE](LICENSE) für Details.
