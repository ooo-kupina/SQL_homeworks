SELECT * FROM homework_1.mobile_phones;

/* Выведите название, производителя и цену для товаров, количество которых
превышает 2 */
use homework_1;
select
  Manufacturer,
  Price
from
  mobile_phones
where
  ProductCount > 2;
  
-- Выведите весь ассортимент товаров марки “Samsung”
select
  Id,
  ProductName,
  Manufacturer,
  ProductCount,
  Price
from
  mobile_phones
where
  Manufacturer = 'Samsung';