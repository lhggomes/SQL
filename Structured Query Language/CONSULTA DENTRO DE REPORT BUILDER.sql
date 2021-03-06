Value := ConsultaSQL( 'SELECT SUM(A.VL) FROM ('+
           'SELECT NVL(P.VALOR,0) AS VL '+ 
           ' FROM PCNFSAID NF, PCPREST P '+
           ' WHERE NF.NUMNOTA = P.DUPLIC '+
           ' AND P.DTPAG IS NULL '+
           ' AND NF.DTCANCEL IS NULL '+ 
           ' AND NF.DTSAIDA >= TRUNC(SYSDATE-360) ' +
           ' AND P.DTEMISSAO >= trunc(SYSDATE-360) '+
           ' AND NF.NFFORNEC = '+ BDECtasPagar['NUMNOTA']+
           ' UNION '+
           ' SELECT 0 AS VL FROM DUAL '+
           ') A' 
           );


SELECT BP.DATAENTRADA,P.CODPROD,P.DESCRICAO, BP.NUMNOTA, BP.NUMTRANSACAO,
G.CODGRUPO,G.DESCGRUPO,
COUNT(BP.CODPROD) AS QTD, SUM(BP.VLRATUALBEM) AS VLTOTAL
FROM PCBENSPATRIMONIAIS BP, PCPRODCIAP P, PCBENSGRUPO G
WHERE BP.CODPROD = P.CODPROD
AND P.CODGRUPOBEM = G.CODGRUPO(+)
AND BP.DATAENTRADA <= :DATA2
AND ((BP.DATABAIXA IS NULL OR  ((:DATA2 <= BP.DATABAIXA) AND (BP.TIPOBAIXA <> 'TR')) OR ((:DATA2 < BP.DATABAIXA)))
        OR (BP.DATABAIXA IS NOT NULL AND BP.TIPOBAIXA IN ('P4', 'P5', 'DT')))
--AND BP.DATAENTRADA >= TRUNC(SYSDATE-30)
--AND M.CODOPER IN ('SD')
AND BP.CODFILIAL = :CODFILIAL
AND G.CODGRUPO = :CODGRUPO 
GROUP BY BP.DATAENTRADA,P.CODPROD,P.DESCRICAO, BP.NUMNOTA, BP.NUMTRANSACAO,
G.CODGRUPO,G.DESCGRUPO
ORDER BY 1, 4, 2




value:= ConsultaSQL('SELECT DESCGRUPO FROM  PCBENSGRUPO WHERE  




  
  Value := ConsultaSQL( 'SELECT SUM(A.VL) FROM ('+
           'SELECT NVL(P.VALOR,0) AS VL '+ 
           ' FROM PCNFSAID NF, PCPREST P '+
           ' WHERE NF.NUMNOTA = P.DUPLIC '+
           ' AND P.DTPAG IS NULL '+
           ' AND NF.DTCANCEL IS NULL '+ 
           ' AND NF.DTSAIDA >= TRUNC(SYSDATE-360) ' +
           ' AND P.DTEMISSAO >= trunc(SYSDATE-360) '+
           ' AND NF.NFFORNEC = '+ BDECtasPagar['NUMNOTA']+
           ' UNION '+
           ' SELECT 0 AS VL FROM DUAL '+
           ') A' 
           );