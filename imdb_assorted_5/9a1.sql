SELECT mi1.info, pi1.info, COUNT(*)
FROM title as t,
kind_type as kt,
movie_info as mi1,
info_type as it1,
cast_info as ci,
role_type as rt,
name as n,
info_type as it2,
person_info AS pi1
WHERE
t.id = ci.movie_id
AND t.id = mi1.movie_id
AND mi1.info_type_id = it1.id
AND t.kind_id = kt.id
AND ci.person_id = n.id
AND ci.movie_id = mi1.movie_id
AND ci.role_id = rt.id
AND n.id = pi1.person_id
AND pi1.info_type_id = it2.id
AND (it1.id IN ('16'))
AND (it2.id IN ('23'))
AND (mi1.info ILIKE '%usa%')
AND (pi1.info ILIKE '%19%')
AND (kt.kind IN ('movie','tv mini series','tv movie','video game'))
AND (rt.role IN ('cinematographer','composer','costume designer','director','editor','miscellaneous crew','producer','writer'))
GROUP BY mi1.info, pi1.info
