﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой "Бюджетирование" - "Экземпляры отчетов"

Сценарий: Я создаю экземпляр отчета для вида отчета 'TheReportKind' сценарий 'TheScenario' период 'TheStartDate' 'TheEndDate' периодичность 'TheFrequency' организация 'TheBusinessUnit' проект 'TheProject' аналитики 'TheDimension1' 'TheDimension2' 'TheDimension3' 'TheDimension4' 'TheDimension5' 'TheDimension6' 

	* Откроем форму ключевых реквизитов
		Если текущее окно имеет заголовок "Укажите ключевые реквизиты документа" Тогда
			// Форма уже открыта
		Иначе
			И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Экземпляры отчетов"
			Тогда открылось окно "Экземпляры отчетов"
			И я нажимаю кнопку очистить у поля с именем 'СохраненнаяНастройка'
			И я нажимаю на кнопку с именем 'ФормаСоздать'

	* Заполняем ключевые реквизиты
		Тогда открылось окно "Укажите ключевые реквизиты документа"
		И из выпадающего списка с именем 'ВидОтчета' я выбираю по строке '[TheReportKind]'				
		И из выпадающего списка с именем 'Сценарий' я выбираю по строке '[TheScenario]'
		И из выпадающего списка с именем 'ПериодичностьОтчета' я выбираю точное значение '[TheFrequency]'
		И я нажимаю на кнопку с именем 'ИзменитьПериод'
		Тогда открылось окно "Выберите период"
		И в поле с именем 'DateBegin' я ввожу текст '[TheStartDate]'
		И в поле с именем 'DateEnd' я ввожу текст '[TheEndDate]'
		И я нажимаю на кнопку с именем 'Select'
		Тогда открылось окно "Укажите ключевые реквизиты документа *"
		И я нажимаю кнопку выбора у поля с именем 'Организация'
		И Я выбираю организацию '[TheBusinessUnit]'
		Тогда открылось окно "Укажите ключевые реквизиты документа *"
		Если 'НЕ ПустаяСтрока("[TheProject]")' Тогда
			И из выпадающего списка с именем 'Проект' я выбираю по строке '[TheProject]'
		Если 'НЕ ПустаяСтрока("[TheDimension1]")' Тогда
			И из выпадающего списка с именем 'Аналитика1' я выбираю по строке '[TheDimension1]'
		Если 'НЕ ПустаяСтрока("[TheDimension2]")' Тогда
			И из выпадающего списка с именем 'Аналитика2' я выбираю по строке '[TheDimension2]'
		Если 'НЕ ПустаяСтрока("[TheDimension3]")' Тогда
			И из выпадающего списка с именем 'Аналитика3' я выбираю по строке '[TheDimension3]'
		Если 'НЕ ПустаяСтрока("[TheDimension4]")' Тогда
			И из выпадающего списка с именем 'Аналитика4' я выбираю по строке '[TheDimension4]'
		Если 'НЕ ПустаяСтрока("[TheDimension5]")' Тогда
			И из выпадающего списка с именем 'Аналитика5' я выбираю по строке '[TheDimension5]'
		Если 'НЕ ПустаяСтрока("[TheDimension6]")' Тогда
			И из выпадающего списка с именем 'Аналитика6' я выбираю по строке '[TheDimension6]'
		Когда открылось окно "Укажите ключевые реквизиты документа *"
		И я нажимаю на кнопку с именем 'ФормаПрименитьИЗакрыть'
		
		И Открылся экземпляр отчета для вида отчета '[TheReportKind]' валюта '*' организация '[TheBusinessUnit]' сценарий '[TheScenario]' периодичность '[TheFrequency]' проект '[TheProject]' аналитики '[TheDimension1]' '[TheDimension2]' '[TheDimension3]' '[TheDimension4]' '[TheDimension5]' '[TheDimension6]' 	

Сценарий: Я открываю первый экземпляр отчета для вида отчета 'TheReportKind'

	И Я нахожу в списке вид отчета с именем '[TheReportKind]'
	И в таблице 'СписокВидовОтчетов' я нажимаю на кнопку с именем 'СписокВидовОтчетовОткрытьСписокЭкземпляров'
	Тогда открылось окно "Экземпляры отчетов"
	И в таблице 'Список' я выбираю текущую строку

Сценарий: Я открываю экземпляр отчета по сохраненной настройке 'TheName'

	И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Экземпляры отчетов"
	Тогда открылось окно "Экземпляры отчетов"
	И я нажимаю кнопку выбора у поля с именем 'СохраненнаяНастройка'
	И из выпадающего списка с именем 'СохраненнаяНастройка' я выбираю точное значение '[TheName]'
	И в таблице 'Список' я выбираю текущую строку

Сценарий: В экземпляре отчета я удаляю все существующие версии

	И я нажимаю на кнопку с именем 'ФормаРаботаСВерсиями'
	Тогда открылось окно "Управление версиями показателей"
	И Пока в таблице 'Список' количество строк ">" 0 Тогда
		И я нажимаю на кнопку с именем 'СписокУдалитьВерсии'
		Если открылось окно "1С:Предприятие" Тогда
			И я нажимаю на кнопку с именем 'Button0'
		Если открылось окно "1С:Предприятие" Тогда
			И я нажимаю на кнопку с именем 'Button0'
	Тогда открылось окно "Управление версиями показателей*"
	И Я закрываю окно "Управление версиями показателей*"

Сценарий: Движения экземпляра отчета стали равны "ThePath"

	И я нажимаю на кнопку с именем 'ФормаДвиженияДокумента'
	Тогда открылось окно "Плоская таблица значений показателей с реквизитами"
	И я жду когда в табличном документе 'ОтчетТабличныйДокумент' заполнится ячейка 'R2C1' в течение 60 секунд
	Дано Табличный документ 'ОтчетТабличныйДокумент' равен макету "[ThePath]" по шаблону
	И Я закрываю окно "Плоская таблица значений показателей с реквизитами"
