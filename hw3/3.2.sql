SELECT _cities.title_ru AS 'Город', _countries.title_ru AS 'Страна', _regions.title_ru AS 'Регион' FROM _cities
LEFT JOIN _countries
ON _countries.country_id = _cities.country_id
LEFT JOIN _regions
ON _cities.region_id = _regions.region_id
WHERE _regions.title_ru = 'Московская область'
ORDER BY _cities.title_ru DESC;