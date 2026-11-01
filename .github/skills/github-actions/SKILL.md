# Skill: github-actions

## 1. Призначення
Створює кросплатформний workflow GitHub Actions для безперервної інтеграції (CI) з матрицею Windows, Linux та macOS.

## 2. Вхідні дані
* Скрипти збірки `ci.bat` та `ci.sh`.
* Гілки для перевірки: `develop`, `master`, `main` та `feature/**`.

## 3. Вихідні дані
* `.github/workflows/ci.yml` — workflow, що містить одну job із матрицею `[ubuntu-latest, windows-latest, macos-latest]`.
* Суворе дотримання вимоги: workflow викликає виключно `ci.bat` або `ci.sh` відповідно до ОС.

## 4. Перевірки
* Валідний синтаксис YAML.
* Наявність кроку збереження (upload-artifact) згенерованого бінарного файлу.

## 5. Типовий сценарій помилки
Відсутність прав виконання на `ci.sh` у Unix-середовищі (вирішується додаванням `chmod +x ci.sh` перед запуском).
