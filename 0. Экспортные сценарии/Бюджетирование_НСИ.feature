﻿#language: ru

@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Экспортные сценарии для работы с подсистемой "Бюджетирование" - "НСИ"

Сценарий: Я создаю сценарий с именем 'TheName'

	* Открываем список
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Сценарии"

	* Удаляем элемент	
		И Я в списке "Сценарии" по полю "Наименование" ищу элемент '[TheName]' "По началу строки"		
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И в таблице 'Список' я выбираю текущую строку
			* Удаляем документы управления периодом сценария
				Когда открылось окно "Сценарии: [TheName] (Сценарии)"
				И я нажимаю на кнопку с именем 'ФормаДокументУправлениеПериодомСценарияДокументыУправленияОтчетнымПериодом'
				Тогда открылось окно "Управление отчетным периодом"
				Если в таблице 'Список' количество строк 'больше' 0 Тогда				
					Тогда в таблице 'Список' я выделяю все строки
					И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюУстановитьПометкуУдаления' на элементе формы с именем 'Список'
					Тогда открылось окно "1С:Предприятие"
					И я нажимаю на кнопку с именем 'Button0'
				И я закрываю окно "Управление отчетным периодом"
			И Я удаляю текущий элемент в окне "Сценарии: [TheName] (Сценарии)" очищая	
			
	* Создаем новый элемент
		Тогда открылось окно "Сценарии"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Сценарии: Сценарии (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[TheName]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Сценарии: Сценарии (создание) *" в течение 5 секунд

	* Закрываем список
		Когда открылось окно "Сценарии"
		И Я закрываю окно "Сценарии"

Сценарий: Я для сценария 'TheName' на закладке 'ThePage' для реквизита 'TheProperty' устанавливаю значение 'TheValue' 

	* Ищем элемент	
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Сценарии"
		И Я в списке "Сценарии" по полю "Наименование" ищу и выбираю элемент '[TheName]' "По точному совпадению"
		
	* Меняем реквизит
		И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'		
		Тогда открылось окно '$ЗаголовокФормы$'
		И я перехожу к закладке с именем '[ThePage]'
		И Я для реквизита '[TheProperty]' устанавливаю значение '[TheValue]'		

	* Сохраняем элемент
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна '$ЗаголовокФормы$ *' в течение 20 секунд

Сценарий: Я создаю проект с именем 'TheProjectName'

	* Открываем список
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Проекты*"
	
	* Удаляем текущий элемент
		Тогда открылось окно "Проекты*"
		И я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
		И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
		И в поле с именем 'Pattern' я ввожу текст '[TheProjectName]'
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление
				И Я удаляю текущую строку в списке 'Список'
			* Переименовываем
				И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "*(Проект*"
				И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "*(Проект*" в течение 20 секунд
			
	* Создаем новый элемент
		Тогда открылось окно "Проекты*"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Проект* (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[TheProjectName]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Проект* (создание) *" в течение 20 секунд

	* Закрываем список
		Когда открылось окно "Проекты*"
		И Я закрываю окно "Проекты*"

Сценарий: Я создаю вид аналитики с кодом 'TheAnalyticsCode' именем 'TheAnalyticsName' типом 'TheAnalyticsType'

	* Открываем список
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Виды аналитик (корпоративные)"
		
	* Удаляем элемент
		И Я в списке "Виды аналитик (корпоративные)" по полю "Код" ищу элемент '[TheAnalyticsCode]' "По точному совпадению"	
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			* Произвольный классификтор
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "* (Виды аналитик (корпоративные))"
				И В текущем окне я нажимаю кнопку командного интерфейса "Произвольный классификатор"
				Если в таблице 'Список' количество строк 'больше' 0 Тогда
					И я нажимаю на кнопку с именем 'ФормаНастройкаСписка'
					И Я устанавливаю отбор в форме списка "Наименование" "Не начинается с" 'Удалить_'
					И Пока в таблице 'Список' количество строк 'больше' 0 Тогда	
						* Ставим пометку на удаление
							И Я удаляю текущую строку в списке 'Список'
						* Переименовываем
							И Я запоминаю значение выражения '"Удалить_" + СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'	
							И в таблице 'Список' я выбираю текущую строку
							Когда открылось окно "* (Произвольный классификатор)"		
							Тогда в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
							И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
							И я жду закрытия окна "* (Произвольный классификатор)" в течение 20 секунд
					И я нажимаю на кнопку с именем 'ФормаНастройкаСписка'
					И Я снимаю все отборы в форме списка		
				Когда открылось окно "* (Виды аналитик (корпоративные))"
				И я закрываю окно "* (Виды аналитик (корпоративные))"																													
			* Ставим пометку на удаление
				И Я удаляю текущую строку в списке 'Список'
			* Переименовываем	
				И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'		
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "* (Виды аналитик (корпоративные))"
				И в поле с именем 'Код' я ввожу текст 'Удалить'
				Тогда открылось окно "1С:Предприятие"
				И я нажимаю на кнопку с именем 'Button0'
				Тогда открылось окно "* (Виды аналитик (корпоративные))"
				И в поле с именем 'Код' я ввожу текст ''
				И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "* (Виды аналитик (корпоративные)) *" в течение 20 секунд
		И Я закрываю окно "Виды аналитик (корпоративные)"

	* Создаем элемент кодом
		И я выполняю код встроенного языка на сервере без контекста	
			| 'ВидАналитик = ПланыВидовХарактеристик.ВидыСубконтоКорпоративные.CreateItem();' |
			| 'Массив = Новый Массив;' |
			| 'Массив.Добавить(Тип("[TheAnalyticsType]"));' |
			| 'ВидАналитик.ТипЗначения = Новый ОписаниеТипов(Массив);' |
			| 'ВидАналитик.Код = "[TheAnalyticsCode]";' |
			| 'ВидАналитик.Наименование = "[TheAnalyticsName]";' |
			| 'ВидАналитик.Записать();' |

Сценарий: Я для вида аналитики с кодом "TheAnalyticsCode" делаю ключом реквизит "ThePropertyName"

	* Открываем список и элемент
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Виды аналитик (корпоративные)"
		И Я в списке "Виды аналитик (корпоративные)" по полю "Код" ищу и выбираю элемент '[TheAnalyticsCode]' "По точному совпадению"	
		Когда открылось окно "* (Виды аналитик (корпоративные))"
		И в таблице 'ТабличноеПолеРеквизиты' я перехожу к строке:
			| "Реквизит"          |
			| '[ThePropertyName]' |
		И в таблице 'ТабличноеПолеРеквизиты' я устанавливаю флаг с именем 'ТаблицаРеквизитовКлюч'
		И в таблице 'ТабличноеПолеРеквизиты' я устанавливаю флаг с именем 'ТаблицаРеквизитовМакет'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "* (Виды аналитик (корпоративные)) *" в течение 20 секунд
		Когда открылось окно "Виды аналитик (корпоративные)"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменитьПоиск' на элементе формы с именем 'Список'

Сценарий: Я создаю субконто УХ с именем 'TheExtDimensionCPMName' и видом аналитики с кодом 'TheExtDimensionCPMKind'

	* Открываем список
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Произвольный классификатор"
		Когда открылось окно "Произвольный классификатор"

	* Устанавливаем вид
		И из выпадающего списка с именем 'Владелец' я выбираю по строке '[TheExtDimensionCPMKind]'

	* Удаляем текущий элемент
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем 'Список'
		Тогда открылась форма с именем 'UniversalListFindExtForm'
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
		И в поле с именем 'Pattern' я ввожу текст '[TheExtDimensionCPMName]'
		И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Произвольный классификатор"
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда	
			* Ставим пометку на удаление
				И Я удаляю текущую строку в списке 'Список'
			* Перименовываем
				И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'	
				И в таблице 'Список' я выбираю текущую строку
				Когда открылось окно "* (Произвольный классификатор)"		
				Тогда в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "* (Произвольный классификатор)" в течение 20 секунд 

	* Создаем новый элемент
		Когда открылось окно "Произвольный классификатор"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Произвольный классификатор (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[TheExtDimensionCPMName]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Произвольный классификатор (создание) *" в течение 20 секунд				

	* Закрываем список
		Когда открылось окно "Произвольный классификатор"
		И Я закрываю окно "Произвольный классификатор"

Сценарий: Я создаю группу регламентов с именем 'TheName'

	* Открываем регламент
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Регламенты подготовки отчетности"

	* Удаляем группу
		И Я в списке "Регламенты подготовки отчетности" по полю "Наименование" ищу элемент '[TheName]' "По точному совпадению"
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				И Я удаляю текущую строку в списке 'Список'
			* Перименовываем
				И Я запоминаю значение выражения '"Удалить_" + СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "[TheName] (Регламенты подготовки отчетности)"
				И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "[TheName] (Регламенты подготовки отчетности) *" в течение 20 секунд

	* Создаем группу
		Когда открылось окно "Регламенты подготовки отчетности"
		И я нажимаю на кнопку с именем 'ФормаСоздатьГруппу'
		Тогда открылось окно "Регламенты подготовки отчетности (создание группы)"
		И в поле с именем 'Наименование' я ввожу текст "ВА - Группа регламентов"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Регламенты подготовки отчетности (создание группы) *" в течение 20 секунд
				
Сценарий: Я для регламента 'TheRegulationName' изменяю флаг 'TheFlagName'

	И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Регламенты подготовки отчетности"
	Тогда открылось окно "Регламенты подготовки отчетности"
	И я нажимаю на кнопку с именем 'ФормаНайти'
	Тогда открылось окно "Найти"
	И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Наименование"
	И в поле с именем 'Pattern' я ввожу текст '[TheRegulationName]'
	И я меняю значение переключателя с именем 'CompareType' на "По точному совпадению"
	И я нажимаю на кнопку с именем 'Find'
	Тогда открылось окно "Регламенты подготовки отчетности"
	И в таблице 'Список' я выбираю текущую строку
	Тогда Открылся регламент подготовки отчетности 'TheRegulationName'
	И я перехожу к закладке с именем 'ГруппаСтраницаОсновная'
	И я изменяю флаг с именем '[TheFlagName]'
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

Сценарий: Я создаю тип информационной базы с именем 'TheName' с версией 'ThePlatformVersion'

	* Открываем список
		И В командном интерфейсе я выбираю "Интеграция и управление мастер-данными" "Типы ИБ"

	* Удаляем элемент	
		И Я в списке "Типы информационных баз" по полю "Наименование" ищу элемент '[TheName]' "По началу строки"		
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И в таблице 'Список' я выбираю текущую строку
			И Я удаляю текущий элемент в окне "[TheName] (Тип информационной базы)" очищая
	
	* Создаем новый элемент
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Тип информационной базы (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[TheName]'
		И из выпадающего списка с именем 'ВерсияПлатформы' я выбираю точное значение '[ThePlatformVersion]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Тип информационной базы (создание) *" в течение 20 секунд		
		
	* Закрываем список
		Когда открылось окно "Типы информационных баз"
		И Я закрываю окно "Типы информационных баз"	

Сценарий: Я создаю внешнюю информационную базу 'TheName' тип 'TheType' каталог 'TheCatalog' тип хранилища 'TheTypeOfStorage'

	* Открываем список
		И В командном интерфейсе я выбираю "Интеграция и управление мастер-данными" "Внешние информационные базы"

	* Удаляем элемент	
		И Я в списке "Внешние информационные базы" по полю "Внешняя ИБ" ищу элемент '[TheName]' "По началу строки"		
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			И в таблице 'Список' я выбираю текущую строку
			И Я удаляю текущий элемент в окне "[TheName] (Внешние информационные базы)" очищая

	* Создаем новый элемент			
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Внешние информационные базы (создание)"
		И в поле с именем 'Наименование' я ввожу текст '[TheName]'
		И я нажимаю кнопку выбора у поля с именем 'ТипВнешнегоИсточника'
		И Я в списке "Типы информационных баз" по полю "Наименование" ищу и выбираю элемент '[TheType]' "По началу строки"
		И в поле с именем 'НачалоИмени' я ввожу текст '[TheCatalog]'
		Если '"[TheTypeOfStorage]" = "Excel"' Тогда 
			И я меняю значение переключателя с именем 'ТипХранилищаДанныхADO' на "Файлы MS Excel (.xls)"
			И в поле с именем 'ЭталонныйКаталог' я ввожу текст '[TheCatalog]'
			И я нажимаю на кнопку с именем 'ПроверитьПодключение'
			Тогда открылось окно "1С:Предприятие"
			И я нажимаю на кнопку с именем 'Button0'
		Если '"[TheTypeOfStorage]" = "FoxPro"' Тогда
			И я меняю значение переключателя с именем 'ТипХранилищаДанныхADO' на "Файлы FoxPro (.dbf)"
			И в поле с именем 'ЭталонныйКаталог' я ввожу текст '[TheCatalog]'
		Если '"[TheTypeOfStorage]" = "Access"' Тогда
			И я меняю значение переключателя с именем 'ТипХранилищаДанныхADO' на "Базы данных MS Access (.mdb)"
			И в поле с именем 'ЭталонныйКаталог' я ввожу текст '[TheCatalog]'
		И я запоминаю строку "[TheName] (Внешние информационные базы)*" в переменную 'ЗаголовокОкна'
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		И я жду открытия окна '$ЗаголовокОкна$' в течение 20 секунд
	
Сценарий: Я добавляю элемент пути к файлам организаций для типа 'TheType' объект 'TheObject' значение 'TheValue'	

	Тогда открылось окно "Элементы пути к файлам организаций: Форма списка"	
	И я перехожу к закладке с именем 'Страница_[TheType]'	

	* Удаляем старый элемент
		И в таблице 'Список_[TheType]' я нажимаю на кнопку с именем 'Список_[TheType]Найти'
		Тогда открылось окно "Найти"
		И из выпадающего списка с именем 'FieldSelector' я выбираю точное значение "Объект"
		И я меняю значение переключателя с именем 'CompareType' на "По части строки"
		И в поле с именем 'Pattern' я ввожу текст '[TheObject]'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно "Элементы пути к файлам организаций: Форма списка"
		И Пока в таблице 'Список_[TheType]' количество строк 'больше' 0 Тогда 
			И я выбираю пункт контекстного меню с именем 'Список_[TheType]КонтекстноеМенюУдалить' на элементе формы с именем 'Список_[TheType]'
			Тогда открылось окно "1С:Предприятие"
			И я нажимаю на кнопку с именем 'Button0'
				
	* Добавляем новый элемент
		И в таблице 'Список_[TheType]' я нажимаю на кнопку с именем 'Список_[TheType]Создать'
		Тогда открылось окно "Элементы пути к файлам организаций (создание)"
		И из выпадающего списка с именем 'Объект' я выбираю по строке '[TheObject]'
		И в поле с именем 'Имя' я ввожу текст '[TheValue]'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Элементы пути к файлам организаций (создание) *" в течение 20 секунд

Сценарий: Я создаю шаблон универсального процесса с именем "TheName" режимом "TheMode"

	* Открываем форму справочника
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Шаблоны процессов подготовки отчетности"

	* Удаляем элемент
		И Я в списке "Шаблоны универсальных процессов" по полю "Наименование" ищу элемент '[TheName]' "По точному совпадению" 
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			* Переименовываем
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "Редактирование этапов процесса: [TheName]"
				И я нажимаю на кнопку с именем 'ФормаОткрытьСвойстваПроцесса'
				Когда открылось окно "[TheName] (Шаблон универсального процесса)"
				И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
				И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "[TheName] (Шаблон универсального процесса) *" в течение 20 секунд
				Тогда открылось окно "Редактирование этапов процесса: *"
				И Я закрываю окно "Редактирование этапов процесса: *"

	* Создаем элемент
		Когда открылось окно "Шаблоны универсальных процессов"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Шаблон универсального процесса (создание)"		
		И в поле с именем 'Наименование' я ввожу текст '[TheName]'
		Когда открылось окно "Шаблон универсального процесса (создание)"
		И из выпадающего списка с именем 'НазначениеПроцесса' я выбираю точное значение '[TheMode]'
		Когда открылось окно "Шаблон универсального процесса (создание) *"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Шаблон универсального процесса (создание) *" в течение 20 секунд
		Тогда открылось окно "Редактирование этапов процесса: *"
		И Я закрываю окно "Редактирование этапов процесса: *"
