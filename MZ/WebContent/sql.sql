select * from 
(select a.name, a.email,a.img_url,a.num,a.lat,a.lon,a.plu_name,b.order_num,b.po_num,b.po_title 
from photo a inner join photo_order b on a.email = b.email and a. = b.name)
where email = 'a' and po_num = 134;

select * from photo
select * from photo;
select * from photo_order;