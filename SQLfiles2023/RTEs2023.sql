SELECT 
	GraderBatchID,
	SUM(pd.NoOfUnits*pt.TubesPerCarton*ttt.RTEConversion) AS TotalRTEs
FROM ma_Pallet_DetailT AS pd
INNER JOIN
	ma_PalletT AS pl
ON pl.PalletID = pd.PalletID
INNER JOIN
	sw_SeasonT AS st
ON st.SeasonID = pl.SeasonID
INNER JOIN
	sw_ProductT AS pt
ON pt.ProductID = pd.ProductID
INNER JOIN 
	sw_Tube_TypeT AS ttt
ON ttt.TubeTypeID = pt.TubeTypeID
WHERE GraderBatchID IS NOT NULL
GROUP BY GraderBatchID

