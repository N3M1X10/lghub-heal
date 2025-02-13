# lghub-heal
- Переустановка Logitech G Hub с помощью командной строки
- Сохранения настроек программы при переустановке

# Зачем это?

Не редко софтина зависает и не может сама себя обновить, что вызывает необходимось - делать это вручную.

Данный скрипт делает всё нужное в один клик.

# Что делать?
<details>
<summary>Запуск от имени администратора</summary>
<p>* Во избежание проблем с выполнением, просьба запускать все сценарии от имени администратора.</p>
<p>* Если уверены что ваша система не препятствует запуску командлетов PowerShell (от имени администратора) - можно просто запускать сценарий, он сам себя запустит от имени администратора</p>
</details>

1. Запустить `lghub_heal.bat`
2. Ждать пока запустится G HUB

>[!NOTE]
> - В случае неполадок попробуйте ручную переустановку через `bin\lghub_installer.exe`
> - Также есть ссылка на скачивание установщика с официального сайта разработчиков: [Logitech G HUB Gaming Software](https://www.logitechg.com/en-us/innovation/g-hub.html)

## Примечания

- `lghub_heal.bat` - полностью переустановит Logitech G Hub
> [!tip]
> - Переустановка происходит с сохранением настроек
> - За язык установки программы отвечает строка language=ru_RU

- `lghub_heal_without_update.bat` - такая же переустановка, но без перекачки установщика (скачает его один раз, если его нет)
- `lghub_kill.bat` - остановит весь Logitech G Hub
- `lghub_uninstall.bat` - удалит весь Logitech G Hub (опционально с сохранением настроек)
