# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Swift package for The Movie Database (TMDB) API client. It's a modern Swift library supporting movies, TV shows, and configuration endpoints with full concurrency support.

## Development Commands

### Building
```bash
swift build
```

### Testing
```bash
# Run all tests
swift test

# Run tests with warnings as errors (matches CI)
swift test -Xswiftc -warnings-as-errors

# Run tests on Xcode (for full platform testing)
xcrun xcodebuild test -scheme TMDB -destination "platform=iOS Simulator,arch=arm64,OS=18.5,name=iPhone 16"
```

### Linting
```bash
# Format and lint Swift code (matches CI)
swift format lint . -rps
```

## Architecture

### Core Structure
- **TMDBClient**: Main client class with access token authentication
- **Extensions**: Client functionality split across extensions:
  - `TMDBClient+Movies`: Movie-related endpoints
  - `TMDBClient+TVShows`: TV show-related endpoints
  - `TMDBClient+Configuration`: API configuration endpoints
  - `TMDBClient+Media`: Common media operations

### Key Components
- **Models**: Codable data models for API responses in respective subdirectories
  - `Movies/`: Movie-specific models (Movie, MovieDetails, MovieList)
  - `TVShows/`: TV show-specific models (TVShow, TVShowDetails, TVShowList)
  - `Common/`: Shared models (Media, MediaRating, MediaCredit, etc.)
  - `Configuration/`: API configuration models
- **Error Handling**: TMDBError and TMDBClientError for API and client errors
- **Response**: Wrapper for URLSession responses

### Platform Support
- iOS 13.0+, macOS 10.15+, tvOS 13.0+, watchOS 6.0+
- Swift 5.9+ on Apple platforms, Swift 6.0+ on Linux
- Multiple Swift versions supported via Package@swift-X.Y.swift files

### API Design
- All async/await with Sendable support
- Generic `Page<T>` for paginated results
- Enum-based lists for different content categories
- Type-safe media IDs and paths

## Testing Strategy
- Comprehensive unit tests with JSON fixture data
- Platform-specific testing via CI (iOS, macOS, tvOS, visionOS, watchOS)
- Test data organized in `Data+` extension files
- Mock response system via `TestStorage` for fixtures