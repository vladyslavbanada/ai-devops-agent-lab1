# Інструкція користувача: Запуск AI-агента та збірка проєкту

## 1. Запуск за допомогою GitHub Copilot (AI-агента)
Для роботи з агентом використовується Visual Studio Code з активним GitHub Copilot.

### Генерація проєкту оркестратором (у гілці feature):
1. Відкрити репозиторій у VS Code.
2. Відкрити Copilot Chat (`Ctrl + Alt + I`).
3. Виконати запит:
   > `@workspace Запусти команду init згідно з інструкцією в .github/prompts/init.prompt.md`

### Запуск верифікації (Check):
У будь-який момент для перевірки цілісності проєкту та проходження тестів виконати:
> `@workspace Запусти команду check згідно з інструкцією в .github/prompts/check.prompt.md`

---

## 2. Ручне локальне складання та тестування
Якщо необхідно зібрати проєкт вручну без AI:

### Під Windows:
Запустити файл пакетного сценарію в командному рядку:
```cmd
ci.bat
```
Або виконати стандартні команди CMake:
```cmd
cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release
ctest --test-dir build -C Release --output-on-failure
```

### Під Linux / macOS:
```bash
chmod +x ci.sh
./ci.sh
```

---

## 3. Запуск згенерованого виконуваного файлу
Після збірки:
* **Windows:**
  ```cmd
  .\build\Release\hello.exe
  ```
  (або `.\build\hello.exe`)
* **Linux / macOS:**
  ```bash
  ./build/hello
  ```
Очікуваний результат:
```text
Hello, World!
2 + 3 = 5
```
