# Архітектура AI-агента (Варіант 1: C++, CMake, GoogleTest)

## 1. Проблеми, які вирішує агент
Агент автоматизує процес старту розробки та конфігурації DevOps-інфраструктури для C++ проєктів:
* Формує коректну структуру директорій та безпечний `.gitignore`.
* Створює переносний файл `CMakeLists.txt` без прив'язки до локального шляху компілятора.
* Інтегрує бібліотеку GoogleTest через стандартний механізм CMake `FetchContent` (не потребує встановлення додаткових бібліотек у систему).
* Створює незалежні скрипти обгортки (`ci.bat` для Windows, `ci.sh` для Linux/macOS), які однаково працюють локально та в хмарі GitHub Actions.

## 2. Навички (Skills) агента
* **`project-scaffold`** (`.github/skills/project-scaffold/SKILL.md`): створення каталогів `src/`, `tests/`, створення вихідного коду Hello World C++ та математичної функції `add(int, int)`.
* **`build-and-test`** (`.github/skills/build-and-test/SKILL.md`): створення `CMakeLists.txt`, тестових функцій, тестів GoogleTest (кейс `BasicAddition`) та скриптів складання `ci.bat` / `ci.sh`.
* **`github-actions`** (`.github/skills/github-actions/SKILL.md`): створення `.github/workflows/ci.yml` із кросплатформною матрицею (Ubuntu, Windows, macOS) та викликом скриптів складання.

## 3. Команди (Commands), доступні користувачу
* **`git-init`**: перевірка стану Git-репозиторію та створення правил ігнорування бінарників і build/.
* **`create-project`**: виклик skill `project-scaffold`.
* **`create-build`**: виклик skill `build-and-test`.
* **`create-actions`**: виклик skill `github-actions`.
* **`check`**: валідація та верифікація проєкту без внесення деструктивних змін.
* **`init`**: головний orchestrator, що запускає повний ланцюжок команд покроково.

## 4. Потік даних між етапами
1. `git-init` фіксує безпечні шаблони для .gitignore.
2. `create-project` розміщує вихідний код у директорії `src/` (`main.cpp`, `math_utils.h`).
3. `create-build` аналізує код у `src/`, створює `CMakeLists.txt` із цілями `hello` та `unit_tests`, пише тест `tests/test_main.cpp` та скрипти `ci.sh`/`ci.bat`.
4. `create-actions` підключає скрипти збірки до матриці GitHub Actions.
5. `check` виконує повну верифікацію проєкту локально.

## 5. Обробка помилок оркестратором
Оркестратор `init` реалізований за правилом Fail-Fast:
* Кожна команда має власні критерії перевірки результату.
* У разі помилки або відсутності очікуваного файлу виконання зупиняється.
* Користувачу виводиться точний діагностичний звіт із пропозицією виправлення.
