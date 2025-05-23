SELECT COUNT(*)
FROM title as t,
movie_info as mi1,
kind_type as kt,
info_type as it1,
info_type as it3,
info_type as it4,
movie_info_idx as mi_idx,
movie_info_idx as mii2,
movie_keyword as mk,
keyword as k
WHERE
t.id = mi1.movie_id
AND t.id = mi_idx.movie_id
AND t.id = mii2.movie_id
AND t.id = mk.movie_id
AND mii2.movie_id = mi_idx.movie_id
AND mi1.movie_id = mi_idx.movie_id
AND mk.movie_id = mi1.movie_id
AND mk.keyword_id = k.id
AND mi1.info_type_id = it1.id
AND mi_idx.info_type_id = it3.id
AND mii2.info_type_id = it4.id
AND t.kind_id = kt.id
AND (kt.kind IN ('tv movie','tv series','video game'))
AND (t.production_year <= 2015)
AND (t.production_year >= 1925)
AND (mi1.info IN ('OFM:35 mm','PFM:35 mm','RAT:1.78 : 1'))
AND (it1.id IN ('2','5','7'))
AND it3.id = '100'
AND it4.id = '101'
AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$' AND mii2.info::float <= 3.0)
AND (mii2.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$' AND 2.0 <= mii2.info::float)
AND (mi_idx.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$' AND 500.0 <= mi_idx.info::float)
AND (mi_idx.info ~ '^(?:[1-9]\d*|0)?(?:\.\d+)?$' AND mi_idx.info::float <= 7200.0)
