
SELECT  *

FROM    (

SELECT  t.*, ROWNUM AS rn

FROM    (

SELECT  *

FROM    inforamtion

ORDER BY

info_mobile ) t

)

WHERE   rn BETWEEN 1 AND 10