SELECT _cities.title_ru as 'Город', _countries.title_ru as 'Страна', _regions.title_ru as 'Регион' FROM _cities
LEFT JOIN _countries
ON _countries.country_id = _cities.country_id
LEFT JOIN _regions
ON _cities.region_id = _regions.region_id 
;