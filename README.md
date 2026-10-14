# A2SV mobile track: Flutter, clean architecture and TDD

My work from the mobile track of the [Africa to Silicon Valley (A2SV)](https://a2sv.org) project phase, April 2024. Over a few weeks it goes from Dart basics to a to-do app structured with clean architecture, BLoC, dependency injection and test-driven development.

The interesting part is **[`On Boarding/Day 9/todolist`](On%20Boarding/Day%209/todolist)**. The commit history shows the TDD progression one step at a time: data-source contracts, then tests, then the implementations, then dependency injection and the BLoC.

## What's here

| Folder | What it is |
|---|---|
| `On Boarding/Day 1`, `Day 2` | Dart basics: lists, classes and small exercises |
| `On Boarding/Day 3` | First Flutter apps: a counter and a simple to-do list |
| `On Boarding/Day 4` | The Flutter "namer" codelab, and the to-do app with navigation, routing and editing |
| `On Boarding/todolist` | The to-do app refactored into clean-architecture layers, with model and data-source tests |
| `On Boarding/Day 9/todolist` | The full version: BLoC, dependency injection, network checks, local caching and the most complete test suite |

## The Day 9 app

```
lib/
├── core/
│   ├── error/             exceptions and Failure types
│   ├── network/           NetworkInfo, an online/offline check
│   ├── usecases/          the UseCase<Type, Params> contract
│   └── util/              InputConverter (string → positive integer)
├── features/todo/
│   ├── domain/            Task entity, TaskRepository contract,
│   │                      CreateTask / ViewTask / ViewAllTasks use cases
│   ├── data/              TodoModel (JSON), local (SharedPreferences) and
│   │                      remote (HTTP) data sources, TaskRepositoryImpl
│   └── presentation/      TaskBloc with events and states, pages and widgets
└── injection_container.dart   get_it wiring for every layer
```

Each layer only depends on the one inside it. Use cases return `Either<Failure, T>` from `dartz`, so errors are values rather than exceptions. The repository checks the network first, reads from the remote source when online and caches the result, and falls back to the local cache when offline.

### Tests

Written with `flutter_test` and `mockito`, using a JSON fixture:

- `TodoModel` to and from JSON
- the local data source reading and caching through a mocked `SharedPreferences`
- the remote data source calling a mocked HTTP client with the right headers
- `NetworkInfo` and `InputConverter`
- the `ViewTask` use case against a mocked repository
- widget tests for the home, list, details, create and edit screens

### Where it stopped

This was a training exercise, and it stopped partway through the refactor:

- The screens still run on the earlier in-memory `TaskManager` rather than the new `TaskBloc`.
- The remote data source has no real API behind it yet; its URL is a placeholder.
- A few repository tests are scaffolds without assertions.
- The remote data-source test is saved as `task_remote_data_source_text.dart`, so `flutter test` skips it; renaming it to `_test.dart` would run it.
- `TaskBloc` uses `mapEventToState`, which version 8 of the `bloc` package replaced with `on<Event>` handlers.

## Running it

```bash
cd "On Boarding/Day 9/todolist"
flutter pub get
flutter test
flutter run
```

Built with Flutter (Dart 3.3+), bloc, get_it, dartz, equatable, http, shared_preferences and mockito.

By [Al-Waasiu Abubakari](https://farad56.github.io/).
