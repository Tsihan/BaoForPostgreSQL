SELECT COUNT(*)
FROM title as t,
movie_info as mi1,
kind_type as kt,
info_type as it1,
info_type as it3,
info_type as it4,
movie_info_idx as miidx,
movie_info_idx as mii2,
aka_name as an,
name as n,
info_type as it5,
person_info AS pi1,
cast_info as ci,
role_type as rt
WHERE
t.id = mi1.movie_id
AND t.id = ci.movie_id
AND t.id = miidx.movie_id
AND t.id = mii2.movie_id
AND mii2.movie_id = miidx.movie_id
AND mi1.movie_id = miidx.movie_id
AND mi1.info_type_id = it1.id
AND miidx.info_type_id = it3.id
AND mii2.info_type_id = it4.id
AND t.kind_id = kt.id
AND (kt.kind IN ('episode','movie'))
AND (t.production_year <= 2015)
AND (t.production_year >= 1975)
AND (mi1.info IN ('Argentina','Canada','France','Germany','Italy','Japan','Mexico','Netherlands','Spain','UK','USA'))
AND (it1.id IN ('8'))
AND it3.id = '100'
AND it4.id = '101'
AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$' AND mii2.info::float <= 4.0)
AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$' AND 0.0 <= mii2.info::float)
AND (miidx.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$' AND 0.0 <= miidx.info::float)
AND (miidx.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$' AND miidx.info::float <= 1000.0)
AND n.id = ci.person_id
AND ci.person_id = pi1.person_id
AND it5.id = pi1.info_type_id
AND n.id = pi1.person_id
AND n.id = an.person_id
AND ci.person_id = an.person_id
AND an.person_id = pi1.person_id
AND rt.id = ci.role_id
AND (n.gender in ('f') OR n.gender IS NULL)
AND (n.name_pcode_nf in ('A5362','J2452','J5162','M2345','M252','M6453','R2562','S26','S3151','S3152','T5252','T6252') OR n.name_pcode_nf IS NULL)
AND (ci.note IS NULL)
AND (rt.role in ('actress','director','editor'))
AND (it5.id in ('19'))
