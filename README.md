# lghub-heal
- Переустановка Logitech G Hub с помощью командной строки
- Сохранения настроек программы при переустановке

# Что делать?
>[!warning]
>Во избежание проблем с выполнением, просьба запускать все сценарии от имени администратора!

1. Запустить `lghub_heal.bat`
2. Ждать пока запустится G HUB

>[!NOTE]
> - В случае неполадок попробуйте ручную переустановку через `bin\lghub_installer.exe`
> - Также есть ссылка на официальный сайт разработчиков [Logitech G HUB Gaming Software](https://www.logitechg.com/en-us/innovation/g-hub.html?srsltid=AfmBOoqPUOqdb5AX2V5bWbM9IEHiQ8WXzg48YueU8MBH-d_waTX_CenI)

## Примечания

- `lghub_heal.bat` - полностью переустановит Logitech G Hub, с сохранением настроек
(За язык установки программы отвечает строка language=ru_RU)
- `lghub_heal_without_update.bat` - такая же переустановка, но без перекачки установщика (скачает его один раз если его нет)
- `lghub_kill.bat` - остановит весь Logitech G Hub
- `lghub_uninstall.bat` - удалит весь Logitech G Hub с сохранением настроек

---

Batch by n3m1x10
