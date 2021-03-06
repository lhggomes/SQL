SELECT F.FORNECEDOR, CP.NUMNOTA,  CG.CONTA,  SUM (CP.VALOR) AS RETENCAO 
FROM PCLANC CP, PCFORNEC F , PCCONTA CG
WHERE  CP.CODFORNEC = F.CODFORNEC
AND CP.CODCONTA IN (302011, 302010, 500004, 300027)
AND CG.CODCONTA = CP.CODCONTA
AND CP.CODFORNEC =  :FORNECEDOR
AND CP.DTEMISSAO BETWEEN :DATA1 AND :DATA2
AND F.CODCONTACSRF <> 0
AND CP.CODFILIAL = 1  
GROUP BY   F.FORNECEDOR, CP.NUMNOTA,  CG.CONTA 
ORDER BY 1, 2;

SELECT CODFORNEC, FORNECEDOR
FROM PCFORNEC
WHERE CODFORNEC LIKE (:CODFORNEC)
AND FORNECEDOR LIKE (:FORNECEDOR)
;

PCFORNEC.