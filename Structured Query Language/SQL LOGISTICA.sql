SELECT TOTAL.CODFILIAL,                                               
       TOTAL.CODCONTA,                                                
       TOTAL.CONTA,                                                   
       SUM(TOTAL.VLORCAMES) VLORCAMES,                                
       SUM(TOTAL.VPAGO) VPAGO                                         
FROM (                                                                
SELECT PCORCLAN.CODFILIAL,                                            
       PCCONTA.CODCONTA,                                              
       PCCONTA.CONTA,                                                 
       0 VLORCAMES,                                                   
       0 VPAGO                                                        
  FROM PCCONTA,PCORCLAN                                               
WHERE 'FROTA' = :TIPO
  AND NVL(PCCONTA.INVESTIMENTO,'N') <> 'S'                        
  AND PCCONTA.GRUPOCONTA = 510                               
  AND PCCONTA.CODCONTA = PCORCLAN.CODCONTA                            
 AND PCORCLAN.CODFILIAL = 2
 AND PCCONTA.CODCONTA = :CONTA
  UNION ALL                                                           
SELECT PCLANC.CODFILIAL,                                              
       PCCONTA.CODCONTA,                                              
       PCCONTA.CONTA,                                                 
       0 VLORCAMES,                                                   
       SUM(NVL(PCLANC.VPAGO,0) * (-1)) VPAGO                      
  FROM PCLANC, PCNFSAID, PCCONTA                                      
 WHERE 'FROTA' = :TIPO 
   AND PCLANC.DTPAGADIANTFOR IS NULL                                  
   AND PCLANC.CODCONTA = PCCONTA.CODCONTA                             
   AND  (PCLANC.DTPAGTO IS NOT NULL)                            
   AND  (PCLANC.DTPAGTO >= :DATA1)                          
   AND  (PCLANC.DTPAGTO <= :DATA2)                             
AND NVL(PCLANC.VPAGO, 0) <> 0                                   
AND (NVL(PCCONTA.INVESTIMENTO,'N') <> 'S')                        
AND PCLANC.NUMTRANSVENDA = PCNFSAID.NUMTRANSVENDA(+)                  
AND NVL(PCLANC.CODROTINABAIXA,0) <> 737                               
 AND NVL (PCNFSAID.CONDVENDA, 0) NOT IN (4, 8, 10, 20, 98, 99)      
 AND NVL(PCNFSAID.CODFISCAL,0) NOT IN (522,622,722,532,632,732)     
 AND PCLANC.CODFILIAL = 2
  AND (Pcconta.GRUPOCONTA = 510)
   AND PCCONTA.CODCONTA = :CONTA                             
GROUP BY Pcconta.CODCONTA, Pcconta.CONTA,PCLANC.CODFILIAL             
) TOTAL                                                               
GROUP BY  TOTAL.CODFILIAL,                                           
       TOTAL.CODCONTA,                                                
       TOTAL.CONTA                                                    
UNION ALL
SELECT TOTAL.CODFILIAL,                                               
       TOTAL.CODCONTA,                                                
       TOTAL.CONTA,                                                   
       SUM(TOTAL.VLORCAMES) VLORCAMES,                                
       SUM(TOTAL.VPAGO) VPAGO                                         
FROM (                                                                
SELECT PCORCLAN.CODFILIAL,                                            
       PCCONTA.CODCONTA,                                              
       PCCONTA.CONTA,                                                 
       0 VLORCAMES,                                                   
       0 VPAGO                                                        
  FROM PCCONTA,PCORCLAN                                               
WHERE 'OPERACIONAL' = :TIPO
  AND NVL(PCCONTA.INVESTIMENTO,'N') <> 'S'                        
  AND PCCONTA.GRUPOCONTA = 505                               
  AND PCCONTA.CODCONTA = PCORCLAN.CODCONTA                            
 AND PCORCLAN.CODFILIAL = 2
  UNION ALL                                                           
SELECT PCLANC.CODFILIAL,                                              
       PCCONTA.CODCONTA,                                              
       PCCONTA.CONTA,                                                 
       0 VLORCAMES,                                                   
       SUM(NVL(PCLANC.VPAGO,0) * (-1)) VPAGO                      
  FROM PCLANC, PCNFSAID, PCCONTA                                      
 WHERE 'OPERACIONAL' = :TIPO 
   AND PCLANC.DTPAGADIANTFOR IS NULL                                  
   AND PCLANC.CODCONTA = PCCONTA.CODCONTA                             
   AND  (PCLANC.DTPAGTO IS NOT NULL)                            
   AND  (PCLANC.DTPAGTO >= :DATA1)                          
   AND  (PCLANC.DTPAGTO <= :DATA2)                             
AND NVL(PCLANC.VPAGO, 0) <> 0                                   
AND (NVL(PCCONTA.INVESTIMENTO,'N') <> 'S')                        
AND PCLANC.NUMTRANSVENDA = PCNFSAID.NUMTRANSVENDA(+)                  
AND NVL(PCLANC.CODROTINABAIXA,0) <> 737                               
 AND NVL (PCNFSAID.CONDVENDA, 0) NOT IN (4, 8, 10, 20, 98, 99)      
 AND NVL(PCNFSAID.CODFISCAL,0) NOT IN (522,622,722,532,632,732)     
 AND PCLANC.CODFILIAL = 2
  AND Pcconta.GRUPOCONTA = 505
GROUP BY Pcconta.CODCONTA, Pcconta.CONTA,PCLANC.CODFILIAL             
) TOTAL                                                               
GROUP BY  TOTAL.CODFILIAL,                                           
       TOTAL.CODCONTA,                                                
       TOTAL.CONTA                                                    
ORDER BY 5 DESC