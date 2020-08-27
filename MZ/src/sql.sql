select a.name,a.email,a.img_url,num,lat,lon,plu_name,order_num,po_num from photo a inner join photo_order b on
a.email = b.email 
and a.name = a.name
;

select * from (select a.name, a.email,a.img_url,a.num,a.lat,a.lon,a.plu_name,b.order_num,b.po_num,b.po_title from photo a inner join photo_order b on a.email = b.email and a.name = b.name) where email = 'a' and name like '%asdfas%';

select * from photo;
select * from photo_order;


select u.email,u.name,u.age,u.gender,p.po_title,p.img_url from users u inner join post p on u.email = p.email;


Search Post
select * from (select u.email,u.name,u.age,u.gender,p.po_title,p.img_url from users u inner join post p on u.email = p.email) where email = 'a';





select * from photo where email = 'a';


포스트이름, 다이어리 타이틀, 다이어리 설명
select * from post p;
#Search Diary
select p.po_num, p.po_title, p.email, p.img_url, u.name from post p inner join users u on p.email = u.email;
select * from diary_main;

