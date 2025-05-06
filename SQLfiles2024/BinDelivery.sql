SELECT 
	bd.BinDeliveryID,
	bd.BinDeliveryNo,
	st.SeasonDesc AS Season,
	ft.FarmCode AS RPIN,
	ft.FarmName AS Orchard,
	fbt.BlockCode AS Block,
	sbt.SubdivisionCode AS [Production site],
	cto.CompanyName AS Owner,
	bd.HarvestDate,
	bd.NoOfBins,
	cts.CompanyName AS [Storage site],
	mt.MaturityCode AS Maturity,
	stt.StorageTypeDesc AS [Storage type],
	pknt.PickNoDesc AS PickNo
FROM ma_Bin_DeliveryT AS bd
INNER JOIN
	sw_SeasonT AS st
ON st.SeasonID = bd.SeasonID
INNER JOIN
    sw_FarmT AS ft
ON ft.FarmID = bd.FarmID
INNER JOIN
	sw_Farm_BlockT AS fbt
ON fbt.BlockID = bd.BlockID
INNER Join
	sw_SubdivisionT AS sbt
ON sbt.SubdivisionID = fbt.SubdivisionID 
INNER JOIN
    sw_CompanyT AS cts
ON cts.CompanyID = bd.FirstStorageSiteCompanyID 
INNER JOIN
	sw_CompanyT AS cto
ON cto.CompanyID = ft.GrowerCompanyID
INNER JOIN
    sw_MaturityT AS mt
ON mt.MaturityID = bd.MaturityID 
INNER JOIN
    sw_Storage_TypeT AS stt
ON stt.StoragetypeID = bd.StorageTypeID  
INNER JOIN
    sw_Pick_NoT AS pknt
ON pknt.PickNoID = bd.PickNoID 
WHERE PresizeFlag = 0

