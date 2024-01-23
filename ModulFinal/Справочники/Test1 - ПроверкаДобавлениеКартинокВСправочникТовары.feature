﻿#language: ru

@tree

Функционал: Проверка добавление картинок в справочнике Товары

Как Тестировщик я хочу
проверить возможность добавление картинок
чтобы у пользователя не возникло проблем  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий:_0001 Подготовка данных
И экспорт основных данных
И экспорт настроек картинок
И я закрываю TestClient "Этот клиент"
И Я устанавливаю в базу расширение из файла "$КаталогПроекта$\IRP_TestExtension.cfe"
И Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий:_0002 Проверка добавление картинок в справочнике Товары
Дано Я открываю навигационную ссылку "e1cib/list/Catalog.Items"
И в таблице "List" я перехожу к строке:
	| 'Код' | 'Наименование'             | 'Вид номенклатуры'           | 'Ссылка'                   |
	| '1'   | 'Товар с характеристиками' | 'кросовки' | 'Товар с характеристиками' |
И в таблице "List" я выбираю текущую строку
И я выбираю файл "$КаталогПроекта$\ModulFinal\Picture\gomer.png"
И я нажимаю на кнопку с именем 'add_picture'
И я нажимаю на кнопку с именем 'update_slider'
И я нажимаю на кнопку с именем 'FormCommonCommandAttachedFiles'
Тогда таблица "FileList" стала равной:
	| 'Файл'      | 'Расширение' |
	| 'gomer.png' | 'png'        |




Сценарий:_0003 Заполнение карточки товара
* Открытие справочника Номенклатура
	И Я открываю навигационную ссылку "e1cib/list/Catalog.Items"
	И я нажимаю на кнопку с именем 'FormCreate'
* Заполнение полей
	Тогда открылось окно 'Номенклатура (создание)'
	И я нажимаю на кнопку открытия поля с именем "Description_ru"
	Тогда открылось окно 'Редактирование наименования'
	И в поле с именем 'Description_en' я ввожу текст 'TestName'
	И в поле с именем 'Description_ru' я ввожу текст 'Тестовое создание'
	И я нажимаю на кнопку с именем 'FormOk'

	И я нажимаю кнопку выбора у поля с именем "ItemType"
	Тогда открылось окно 'Виды номенклатуры'
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку

	И я нажимаю кнопку выбора у поля с именем "Unit"
	Тогда открылось окно 'Единицы измерения'
	И в таблице "List" я выбираю текущую строку

	И я нажимаю кнопку выбора у поля с именем "Vendor"
	Тогда открылось окно 'Партнеры'
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку
	И я нажимаю на кнопку с именем 'FormWrite'

	И я запоминаю значение поля "Наименование (ru)" как "Наименование"
	И я запоминаю значение поля "Код" как "Код"	

				
* Запись и Закрытие
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
* Проверка Создание
	И таблица "List" содержит строки:
		| 'Код' | 'Наименование' |
		| '$Код$' | '$Наименование$' |


	
	








