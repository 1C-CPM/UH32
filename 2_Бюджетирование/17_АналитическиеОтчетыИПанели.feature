﻿#language: ru
@tree
@IgnoreOnCIMainBuild

Функционал: 17. Тестирование Аналитических отчетов и панелей

	Как Администратор я хочу
	протестировать аналитические отчеты и аналитические панели 
	чтобы исключить ошибки при разработке   

Контекст:
	
	И я закрыл все окна клиентского приложения

Сценарий: 17.00 Определение типа приложения

	И я закрываю TestClient "УХ - Бюджетирование"
	И я подключаю TestClient "УХ - Бюджетирование" логин "Администратор" пароль ''
	Пусть Инициализация переменных

Сценарий: 17.01 Создание вида отчета

	* Создаем вид отчета
		И Я создаю вид отчета с именем "ВА - Аналитические отчеты" и родителем "ВА - Группа отчетов"

	* Настраиваем структуру
		И я открываю контруктор отчета с именем "ВА - Аналитические отчеты"
		И Я в конструкторе отчета добавляю строки
			| 'Наименование' |
			| "Строка 1"     |
			| "Строка 2"     |
			| "Строка 3"     |
		И Я в конструкторе отчета добавляю колонки
			| 'Наименование' |
			| "Количество"   |
			| "Цена"         |
			| "Сумма"        |

	* Настраиваем формулы
		И Я в конструкторе отчета для ячейки 'R2C4' задаю формулу произведение ячеек 'R2C2' 'R2C3'
		И Я в конструкторе отчета для ячейки 'R3C4' задаю формулу произведение ячеек 'R3C2' 'R3C3'
		И Я в конструкторе отчета для ячейки 'R4C4' задаю формулу произведение ячеек 'R4C2' 'R4C3'

	* Закрываем конструктор
		Когда открылось окно "Конструктор отчета"
		И Я закрываю окно "Конструктор отчета"
		
	* Создаем бланк
		И Я Для вида отчета "ВА - Аналитические отчеты" создаю бланк по умолчанию

Сценарий: 17.02 Создание аналитических отчетов

	И Я создаю группу аналитических отчетов с кодом '100000000000' именем "ВА - Аналитические отчеты" родителем ''

	И Я создаю аналитический отчет с кодом '100000000001' вид отчета "ВА - Аналитические отчеты" период "Январь 2024 г." организация "Меркурий ООО" родитель "ВА - Аналитические отчеты"
	И Я создаю аналитический отчет с кодом '100000000002' вид отчета"ВА - Аналитические отчеты" период "Январь 2024 г." организация "Система ООО" родитель "ВА - Аналитические отчеты"

Сценарий: 17.03 Создание аналитической панели

	* Открытие формы
		И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Аналитические панели"

	* Удаляем элемент
		И Я в списке "Аналитические панели" по полю "Аналитическая панель" ищу элемент "ВА - Аналитические отчеты" "По началу строки" 
		И Пока в таблице 'Список' количество строк 'больше' 0 Тогда
			* Ставим пометку на удаление	
				И Я удаляю текущую строку в списке 'Список'
			* Переименовываем
				И Я запоминаю значение выражения 'СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную 'УИД'
				И в таблице 'Список' я выбираю текущую строку
				Тогда открылось окно "* (Аналитическая панель)"
				И в поле с именем 'Наименование' я ввожу значение переменной 'УИД'
				И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
				И я жду закрытия окна "* (Аналитическая панель) *" в течение 20 секунд	
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменитьПоиск' на элементе формы с именем "Список"

	* Создание элемента	
 		Тогда открылось окно "Аналитические панели"
 		И я нажимаю на кнопку с именем 'ФормаСоздать'
 		Тогда открылось окно "Аналитическая панель (создание)"
 		И в поле с именем 'Наименование' я ввожу текст "ВА - Аналитические отчеты"
 		И я нажимаю на кнопку с именем 'ФормаЗаписать'
 	
	 * Настройка панели
		Тогда открылось окно "ВА - Аналитические отчеты (Аналитическая панель)"
		И в таблице 'СоставПанели' я нажимаю на кнопку с именем 'СоставПанелиСоздатьСтраницу'
		И в таблице 'СоставПанели' я активизирую поле с именем 'СоставПанелиОбласть'
		И в таблице 'СоставПанели' я выбираю текущую строку
		И в таблице 'СоставПанели' в поле с именем 'СоставПанелиОбласть' я ввожу текст 'Страница 1'
		И в таблице 'СоставПанели' я завершаю редактирование строки
		И я выбираю пункт контекстного меню с именем 'СоставПанелиКонтекстноеМенюСоздатьГруппу' на элементе формы с именем 'СоставПанели'
		И в таблице 'СоставПанели' я разворачиваю текущую строку
		И в таблице 'СоставПанели' я перехожу к строке:
			| "Использование" | "Настройка отчета" | "Область"        | "Отображать наименование" |
			| "Да"            | "(По умолчанию)"   | "(Новая группа)" | "Да"                      |
		И в таблице 'СоставПанели' я выбираю текущую строку
		И в таблице 'СоставПанели' в поле с именем 'СоставПанелиОбласть' я ввожу текст "Группа 1"
		И в таблице 'СоставПанели' я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ФормаЗаписать'

		Когда открылось окно "ВА - Аналитические отчеты (Аналитическая панель)"
		И в таблице 'СоставПанели' я нажимаю на кнопку с именем 'СоставПанелиДобавить'
		И в меню формы я выбираю "Обычная область"
		И Я в списке "Аналитические отчеты" по полю "Наименование" ищу и выбираю элемент "ВА - Аналитические отчеты (Меркурий ООО)" "По точному совпадению"

	 	Тогда открылось окно 'ВА - Аналитические отчеты (Аналитическая панель)'
 		И в таблице "СоставПанели" я нажимаю на кнопку с именем 'СоставПанелиДобавить'		 
 		И в меню формы я выбираю 'Обычная область'
		И Я в списке "Аналитические отчеты" по полю "Наименование" ищу и выбираю элемент "ВА - Аналитические отчеты (Система ООО)" "По точному совпадению"
 		
 	Тогда открылось окно "ВА - Аналитические отчеты (Аналитическая панель)"
 	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'

Сценарий: 17.04 Настройка прав для пользователя "Бюджетирование1"

	И Я добавляю право "Чтение, запись" для вида отчета "ВА - Аналитические отчеты" пользователя "Бюджетирование1" по всем организациям
	И я закрываю TestClient "УХ - Бюджетирование"
	И я подключаю TestClient "УХ - Бюджетирование" логин "Бюджетирование1" пароль ''

Сценарий: 17.05 Создание экземпляров отчетов

	И Я создаю экземпляр отчета для вида отчета "ВА - Аналитические отчеты" сценарий "ВА - Основной сценарий" период '01.01.2024' '31.03.2024' периодичность "Месяц" организация "Меркурий ООО" проект '' аналитики '' '' '' '' '' ''

	И Я ввожу значение '3,00000' в ячейку 'R6C2'
	И Я ввожу значение '4,00000' в ячейку 'R7C2'
	И Я ввожу значение '5,00000' в ячейку 'R8C2'
	И Я ввожу значение '100,00000' в ячейку 'R6C3'
	И Я ввожу значение '200,00000' в ячейку 'R7C3'
	И Я ввожу значение '300,00000' в ячейку 'R8C3'

	Когда открылось окно '$ЗаголовокОкна$'
	И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
	И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд

	И Я создаю экземпляр отчета для вида отчета "ВА - Аналитические отчеты" сценарий "ВА - Основной сценарий" период '01.01.2024' '31.03.2024' периодичность "Месяц" организация "Система ООО" проект '' аналитики '' '' '' '' '' ''
	И я нажимаю на кнопку с именем 'ФормаЗаполнитьПрочимСпособом'
	Тогда открылось окно "Выбор способа расчета показателей"
	И из выпадающего списка с именем 'СпособФормированияОтчета' я выбираю точное значение "Консолидировать периметр (МСФО)"
	И я нажимаю на кнопку с именем 'ФормаВыбрать'

	Когда открылось окно '$ЗаголовокОкна$'
	И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
	И я жду закрытия окна '$ЗаголовокОкна$' в течение 20 секунд	

Сценарий: 17.06 Просмотр аналитических отчетов

	И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Аналитические отчеты"
	И Я в списке "Аналитические отчеты" по полю "Наименование" ищу элемент "ВА - Аналитические отчеты (Меркурий ООО)" "По точному совпадению"
	И я нажимаю на кнопку с именем 'ФормаОткрытьОтчет'
	И табличный документ 'Результат' равен макету "2_Бюджетирование\Макеты\18\ВА_АналитическийОтчет.mxl" по шаблону
	И Я закрываю окно "ВА - Аналитические отчеты (Меркурий ООО) (Аналитический отчет)"
	
	И Я в списке "Аналитические отчеты" по полю "Наименование" ищу элемент "ВА - Аналитические отчеты (Система ООО)" "По точному совпадению"
	И я нажимаю на кнопку с именем 'ФормаОткрытьОтчет'
	И табличный документ 'Результат' равен макету "2_Бюджетирование\Макеты\18\ВА_АналитическийОтчет.mxl" по шаблону
	И Я закрываю окно "ВА - Аналитические отчеты (Система ООО) (Аналитический отчет)"

	Тогда открылось окно "Аналитические отчеты"
	И Я закрываю окно "Аналитические отчеты"		
		
Сценарий: 17.07 Просмотр аналитических панелей		

	И В командном интерфейсе я выбираю "Бюджетирование, отчетность и анализ" "Аналитические панели"
	И Я в списке "Аналитические панели" по полю "Аналитическая панель" ищу элемент "ВА - Аналитические отчеты" "По началу строки" 
	И я нажимаю на кнопку с именем 'ФормаОтобразитьПанель'

	И табличный документ 'Код_100000000001_1_Окно' равен макету "2_Бюджетирование\Макеты\18\ВА_АналитическийОтчет.mxl" по шаблону
	И табличный документ 'Код_100000000002_2_Окно' равен макету "2_Бюджетирование\Макеты\18\ВА_АналитическийОтчет.mxl" по шаблону
	
 	Тогда открылось окно "ВА - Аналитические отчеты (Аналитическая панель)"
 	И Я закрываю окно "ВА - Аналитические отчеты (Аналитическая панель)"
 	Тогда открылось окно "Аналитические панели"
 	И Я закрываю окно "Аналитические панели"	
	