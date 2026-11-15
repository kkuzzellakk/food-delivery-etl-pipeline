# Food Delivery Data Quality & ETL Pipeline
Навчальний пет-проєкт із очищення транзакційних даних, валідації цілісності та побудови аналітичної моделі (Fact / Dimension) у Google BigQuery.
## Стек технологій
Python (Pandas): аудит сирих даних, пошук дублікатів і пропусків, нормалізація таблиць.
Google BigQuery (SQL): завантаження даних, перевірка посилальної цілісності (LEFT JOIN), агрегація показників (GROUP BY).
Git / GitHub: контроль версій коду та документація.
## Архітектура пайплайну
Extract & Data Quality Check (food_delivery_etl_pipeline.ipynb): зчитування 100 000 записів замовлень (talabat_enhanced_orders.csv), перевірка унікальності Order_ID та наявності NULL-значень.
Transform (Data Modeling): розділення плоского датасету на таблицю фактів (orders_fact — 100 000 транзакцій) та таблицю-довідник (restaurants_dim — 1 000 унікальних закладів).
Load & SQL Validation (data_quality_checks.sql): міграція очищених таблиць у BigQuery, перевірка відсутності «битих» зв'язків між фактами та довідником і розрахунок виручки по містах.
