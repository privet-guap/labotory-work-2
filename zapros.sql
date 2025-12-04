-- Подсчитать общее количество приемов врачей 
SELECT 
  count(contactId) AS 'Количество приемов врачей' 
FROM 
  contacting;

-- нахождение пациентов Воронцовых 
SELECT 
  patientSurname, 
  patientName 
FROM 
  patient 
WHERE 
  patientSurname like 'Воронцова';

-- Вывести услуги врачей стоимостью большее 400 
SELECT 
  d.docSurname AS 'Врач', 
  d.docSpecializationn AS 'Специализация', 
  p.patientSurname AS 'Пациент', 
  c.contactPrice AS 'Стоимость приёма', 
  TIME(c.contactDate) AS 'Время' 
FROM 
  contacting AS c 
  INNER JOIN doctor as d ON c.docId = d.docId 
  INNER JOIN patient as p ON c.patientId = p.patientId 
GROUP BY 
  d.docSurname, 
  d.docSpecializationn, 
  p.patientSurname, 
  c.contactPrice, 
  c.contactDate 
HAVING 
  c.contactPrice > 400;

-- Вывести услуги врачей стоимостью большее 400 и принимают позже 12:30
SELECT 
  d.docSurname AS 'Врач', 
  d.docSpecializationn AS 'Специализация', 
  p.patientSurname AS 'Пациент', 
  c.contactPrice AS 'Стоимость приёма', 
  TIME(c.contactDate) AS 'Время' 
FROM 
  contacting AS c 
  INNER JOIN doctor as d ON c.docId = d.docId 
  INNER JOIN patient as p ON c.patientId = p.patientId 
WHERE 
  c.contactPrice > 400 
  AND TIME(c.contactDate) > '12:30:00';
  
-- Врачи с максимальным количеством приемов
SELECT 
  d.docId, 
  d.docSurname AS 'Фамилия врача', 
  d.docSpecializationn AS 'Специализация', 
  COUNT(c.contactId) AS 'Количество приёмов' 
FROM 
  contacting AS c 
  INNER JOIN doctor AS d ON c.docId = d.docId 
GROUP BY 
  d.docId, 
  d.docSurname, 
  d.docSpecializationn 
HAVING 
  COUNT(c.contactId) = (
    SELECT 
      MAX(appointment_count) 
    FROM 
      (
        SELECT 
          COUNT(contactId) as appointment_count 
        FROM 
          contacting 
        GROUP BY 
          docId
      ) AS tmp
  );
