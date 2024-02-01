#Область ПрограммныйИнтерфейс
Процедура ДобавленияРеквизитаНаФорму(Форма)Экспорт 
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавлениеКонтактноеЛицоНаФорму(Форма);
		ДобавлениеПроцентСкидкиНаФорму(Форма);
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавлениеКонтактноеЛицоНаФорму(Форма);
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавлениеКонтактноеЛицоНаФорму(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ДобавлениеКонтактноеЛицоПередСуммой(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		ДобавлениеКонтактноеЛицоПередСуммой(Форма);
		
	КонецЕсли;
КонецПроцедуры 


Процедура ДобавлениеКонтактноеЛицоНаФорму(Форма)
	
	ПолеВводаВ = Форма.Элементы.Добавить("ДЗ_КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВводаВ.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВводаВ.ПутьКДанным = "Объект.ДЗ_КонтактноеЛицо"; 
	ПолеВводаВ.Заголовок = "Контактное лицо";
	
КонецПроцедуры

Процедура ДобавлениеПроцентСкидкиНаФорму(Форма)
	
	ГруппаСкидка = Форма.Элементы.Добавить("ГруппаСкидка", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево);
	ГруппаСкидка.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	
	
	ПолеВводаВ = Форма.Элементы.Добавить("ДЗ_ПроцентСкидки", Тип("ПолеФормы"), ГруппаСкидка);
	ПолеВводаВ.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВводаВ.ПутьКДанным = "Объект.ДЗ_ПроцентСкидки"; 
	ПолеВводаВ.Заголовок = "Скидка";
	ПолеВводаВ.УстановитьДействие("ПриИзменении", "ДЗ_ДЗ_ПроцентСкидкиПриИзменении");
	
	КомандаСкидки = Форма.Команды.Добавить("ПересчитатьСкидку");
	КомандаСкидки.Заголовок = "Пересчитать скидку";
	КомандаСкидки.Действие = "ПересчитатьСкидкуКоманда";
	
	КнопкаФормы = Форма.Элементы.Добавить("ПересчитатьСкидкуКнопка", Тип("КнопкаФормы"), Форма.Элементы.ГруппаСкидка);
	КнопкаФормы.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	КнопкаФормы.ИмяКоманды = "ПересчитатьСкидку";
	
КонецПроцедуры




Процедура ДобавлениеКонтактноеЛицоПередСуммой(Форма)
	
	ПолеВводаВ = Форма.Элементы.Вставить("ДЗ_КонтактноеЛицо", Тип("ПолеФормы"), ,Форма.Элементы.СуммаДокумента);
	ПолеВводаВ.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВводаВ.ПутьКДанным = "Объект.ДЗ_КонтактноеЛицо"; 
	ПолеВводаВ.Заголовок = "Контактное лицо";
	
КонецПроцедуры
#КонецОбласти


