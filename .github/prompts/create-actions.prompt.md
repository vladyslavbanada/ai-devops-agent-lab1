# Command: create-actions

## Призначення
Створення файлу конфігурації CI GitHub Actions через skill `github-actions`.

## Дії
1. Створити директорію `.github/workflows/`.
2. Згенерувати файл `.github/workflows/ci.yml` із кросплатформною матрицею (Ubuntu, Windows, macOS).
3. Налаштувати виклик `ci.bat` для Windows та `./ci.sh` для Unix.

## Перевірка
Синтаксична валідність YAML, перевірка відсутності незахищених ключів.
