SELECT 
	BinDeliveryID,
	COUNT(BinID) AS NoOfBinsPacked
FROM ma_BinT
WHERE GraderBatchID IS NOT NULL
GROUP BY BinDeliveryID

