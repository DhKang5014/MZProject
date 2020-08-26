select * from 
(select a.name, a.email,a.img_url,a.num,a.lat,a.lon,a.plu_name,b.order_num,b.po_num,b.po_title 
from photo a inner join photo_order b on a.email = b.email and a. = b.name)
where email = 'a' and po_num = 134;

select * from photo
select * from photo;
select * from photo_order;
select * from (select u.email,u.name,u.age,u.gender,p.po_title,p.img_url from users u inner join post p on u.email = p.email) where email like ? ";

select DISTINCT jo.email,jo.name,jo.age,jo.gender,jo.po_title,jo.img_url,ph.plu_name 
from (select u.email,u.name,u.age,u.gender,p.po_title,p.img_url from users u inner join post p on u.email = p.email) jo 
inner join photo ph on jo.email=ph.email
where plu_name = '조선대';




