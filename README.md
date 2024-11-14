# lghub_heal.bat

# Что делать?

1. Запустить `lghub_heal.bat`
2. Ждать пока запустится G HUB

>[!NOTE]
> - В случае неполадок попробуйте ручную установку через `bin\lghub_installer.exe`
> - Также есть ссылка на официальный сайт разработчиков [Logitech G HUB Gaming Software](https://www.logitechg.com/en-us/innovation/g-hub.html?srsltid=AfmBOoqPUOqdb5AX2V5bWbM9IEHiQ8WXzg48YueU8MBH-d_waTX_CenI)

## Примечания

`lghub_heal.bat` - переустановит Logitech G Hub полностью, с сохранением настроек
(За язык установки программы отвечает строка language=ru_RU)
`lghub_heal_without_update.bat` - такая же переустановка, но без перекачки установщика (скачает его один раз если его нет)
`lghub_kill.bat` - остановит весь Logitech G Hub
`lghub_uninstall.bat` - удалит весь Logitech G Hub с сохранением настроек


## lghub_restart.bat

`lghub_restart.bat` - перезапустит весь Logitech G Hub

> [!NOTE]
> 1. Открыть `lghub-path.txt` и указать путь к каталогу установленного G HUB
> Пример: C:\Program Files\LGHUB\
> - В пути не должно быть кавычек и обязательно на конце `\` обратный слэш
> 2. Запустить `lghub_restart.bat`


---

Batch by n3m1x10