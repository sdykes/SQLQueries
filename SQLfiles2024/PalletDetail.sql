SELECT 
	PalletDetailID,
	mpdt.PalletID,
	SeasonDesc AS Season,
	mpdt.ProductID,
	ProductDesc AS [SKU description],
	PackTypeDesc AS [Pack type],
	PalletTypeDesc AS [Pallet type],
	NoOfUnits,
	pt.TubesPerCarton,
	stt.RTEConversion,
	stt.PresizeAvgTubeWeight,
	NoOfUnits*TubesPerCarton*RTEConversion AS RTEs,
	GraderBatchID,
	psct.CompanyName AS [Packing site]
FROM ma_Pallet_DetailT AS mpdt
INNER JOIN
	ma_PalletT AS mpt
ON mpt.PalletID = mpdt.PalletID
INNER JOIN
	sw_Pallet_TypeT spt
ON spt.PalletTypeID = mpt.PalletTypeID
INNER JOIN
	sw_CompanyT AS psct
ON psct.CompanyID = mpdt.PackerCompanyID
INNER JOIN
	sw_SeasonT AS st
ON st.SeasonID = mpt.SeasonID
INNER JOIN
	sw_ProductT AS pt
ON pt.ProductID = mpdt.ProductID
INNER JOIN
	sw_Pack_TypeT AS ptt
ON ptt.PackTypeID = pt.PackTypeID
INNER JOIN
	sw_Tube_TypeT AS stt
ON stt.TubeTypeID = pt.TubeTypeID


