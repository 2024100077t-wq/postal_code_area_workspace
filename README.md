# Space Telemetry Tracker

A Dart-based command-line application that retrieves and displays space telemetry information using the NASA API.

## Project Description

The **Space Telemetry Tracker** is a command-line application developed using Dart. It connects to the NASA API to retrieve space-related telemetry information and displays the results in a simple and organized terminal interface.

The project uses a Dart workspace structure with separate packages for terminal colors, API communication, and command-line functionality.

## Objectives

- To develop a functional Dart command-line application.
- To retrieve space telemetry information through an API.
- To practice API integration using Dart.
- To organize the application using a multi-package Dart workspace.
- To implement error handling for API requests.
- To display retrieved information in a readable terminal format.

## Features

- Retrieves space telemetry information from the NASA API.
- Displays telemetry data through the command line.
- Uses API integration for retrieving information.
- Provides command-line commands for interacting with the application.
- Includes error handling for invalid API responses.
- Uses terminal colors for improved output readability.
- Organized using a Dart workspace structure.

## Technologies Used

- **Dart** – Main programming language
- **NASA API** – Source of space telemetry information
- **HTTP Package** – Used for API requests
- **Logging Package** – Used for application logging
- **Dart Workspace** – Used for organizing multiple packages
- **Visual Studio Code** – Development environment

## Project Structure

```text
space_telemetry_tracker_workspace/
│
├── terminal_colors/
│   ├── lib/
│   │   ├── ansi.dart
│   │   └── terminal_colors.dart
│   └── pubspec.yaml
│
├── space_telemetry_api/
│   ├── lib/
│   │   ├── src/
│   │   │   ├── client.dart
│   │   │   ├── exceptions.dart
│   │   │   └── models.dart
│   │   └── space_telemetry_api.dart
│   └── pubspec.yaml
│
├── space_telemetry_cli/
│   ├── bin/
│   │   └── main.dart
│   ├── lib/
│   │   └── src/
│   │       ├── command_base.dart
│   │       ├── help_command.dart
│   │       ├── logging_config.dart
│   │       └── query_command.dart
│   └── pubspec.yaml
│
└── pubspec.yaml
```

## Package Description

### `terminal_colors`

Provides terminal color and formatting utilities used to make command-line output easier to read.

### `space_telemetry_api`

Handles communication with the NASA API. It is responsible for sending HTTP requests, processing API responses, and converting the retrieved data into Dart models.

### `space_telemetry_cli`

Contains the command-line interface of the application. It handles user commands, displays results, and connects the CLI to the API package.

## Requirements

Before running the project, make sure the following are installed:

- Dart SDK 3.12.2 or later
- Visual Studio Code
- Internet connection
- NASA API access/API key if required by the API endpoint

## Installation

Clone the repository:

```bash
git clone https://github.com/2024100103t-stack/space_telemetry_tracker_workspace.git
```

Navigate to the project folder:

```bash
cd space_telemetry_tracker_workspace
```

Get the project dependencies:

```bash
dart pub get
```

## How to Run

From the root directory, run:

```bash
dart run space_telemetry_cli:main
```

If the CLI package is configured with a different entry point, run the corresponding Dart file inside the `space_telemetry_cli/bin` directory.

## Example Usage

After starting the application, the user can interact with the command-line interface.

Example:

```text
Space Telemetry Tracker

[space_telemetry] > query
```

The application retrieves the available telemetry information from the NASA API and displays the results in the terminal.

Example output:

```text
--- SPACE TELEMETRY REPORT ---

ID: 001
Name: Space Telemetry
Value: 123.45
```

## Available Commands

```text
query    - Retrieves space telemetry information
help     - Displays available commands
exit     - Exits the application
```

Example:

```text
[space_telemetry] > help
```

```text
[space_telemetry] > query
```

```text
[space_telemetry] > exit
```

## API Integration

The project uses the **NASA API** to retrieve space telemetry information.

The `space_telemetry_api` package is responsible for:

1. Creating the API request.
2. Connecting to the NASA API.
3. Receiving the API response.
4. Validating the returned data.
5. Converting the response into Dart objects.
6. Returning the telemetry information to the CLI.

The application uses the HTTP package to communicate with the API.

## Error Handling

The application includes error handling for possible API and data-related problems.

Examples include:

- Invalid API responses
- Missing required fields
- Invalid data formats
- HTTP request failures
- Connection errors
- Unexpected API data

When an invalid response is received, the application can throw a custom `SpaceTelemetryException`.

Example:

```text
SpaceTelemetryException:
Payload failed pattern validation check!
```

## Testing

To analyze the entire workspace, run:

```bash
dart analyze
```

To run the tests:

```bash
dart test
```

A successful analysis should display:

```text
No issues found!
```

## Dart Workspace

The project uses the Dart workspace feature to organize multiple related packages into one project.

The workspace contains:

- `terminal_colors`
- `space_telemetry_api`
- `space_telemetry_cli`

The root `pubspec.yaml` manages the workspace and its packages.

Example:

```yaml
workspace:
  - terminal_colors
  - space_telemetry_api
  - space_telemetry_cli
```

Each package has its own `pubspec.yaml` file while working together as one project.

## Sample Workflow

```text
1. Start the application
        ↓
2. Display the command-line interface
        ↓
3. User enters a command
        ↓
4. CLI processes the command
        ↓
5. API client sends a request
        ↓
6. NASA API returns telemetry data
        ↓
7. Application validates the response
        ↓
8. Telemetry data is displayed
        ↓
9. User can enter another command or exit
```

## Conclusion

The **Space Telemetry Tracker** demonstrates how Dart can be used to create a command-line application that communicates with an external API. The project also demonstrates API integration, data validation, error handling, logging, and Dart workspace organization.

Through this project, developers can gain practical experience in building modular Dart applications and working with external API services.

## Author

**Navarro Jerry B.**

## Academic Project

This project was developed as part of an academic activity to demonstrate skills in Dart programming, API integration, command-line application development, and multi-package workspace organization.
