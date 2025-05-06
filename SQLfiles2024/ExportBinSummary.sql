SELECT 
	ExportBinDetailID,
	eb.ExportBinID, 
	SeasonDesc AS Season,
	eb.ProductID,
	ProductDesc AS [SKU description],
	PackTypeDesc AS [PackType],
	KGWeight, 
	pd.NoOfUnits,
	CartonNo,
	ebd.PalletDetailID,
	ebd.InputToRepackID,
	COALESCE(pd.GraderBatchID,rt.GraderBatchID) AS GraderBatchID
FROM ma_Export_Bin_DetailT AS ebd
INNER JOIN
	ma_Export_BinT AS eb
ON eb.ExportBinID = ebd.ExportBinID
LEFT JOIN
	ma_Pallet_DetailT AS pd
ON pd.PalletDetailID = ebd.PalletDetailID
LEFT JOIN
	ma_RepackT AS rt
ON rt.RepackID = ebd.InputToRepackID
INNER JOIN
	sw_SeasonT AS st
ON st.SeasonID = eb.SeasonID
INNER JOIN
	sw_ProductT AS pt
ON pt.ProductID = eb.ProductID
INNER JOIN
	sw_Pack_TypeT AS ptt
ON ptt.PackTypeID = pt.PackTypeID


