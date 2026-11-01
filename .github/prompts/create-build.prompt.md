# Command: create-build

## Призначення
Створення конфігурації CMake, GoogleTest тестів та скриптів збірки через skill `build-and-test`.

## Дії
1. Згенерувати `CMakeLists.txt` із визначенням виконуваного файлу `hello` та тестового таргету `unit_tests`.
2. Створити `tests/test_main.cpp` з тестом GoogleTest `TEST(MathTest, BasicAddition)`.
3. Створити виконувані скрипти збірки:
   * `ci.bat` (для Windows)
   * `ci.sh` (для Linux та macOS).

## Перевірка
Наявність 4 створених файлів та коректність синтаксису CMake.
