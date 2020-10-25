SELECT C.NUMCOTACAO, C.DTCADASTRO AS DATA, I.CODFORNEC,                                                                                                            
F.FORNECEDOR, DECODE(FC.SITUACAO, 'F', 'APROVADA','PENDENTE') AS SITUACAO,                                                                                       
I.CODFILIAL AS FILIAL, FL.RAZAOSOCIAL, FL.CGC, I.CODPROD, B.DESCRICAO,                                                                                                       
C.CODFUNCLANC AS COD_FUNC, U.NOME AS FUNCIONARIO_LANCAMENTO,                                                                                                       
P.QTPEDIDA, I.PCOMPRA AS VALOR, P.QTPEDIDA*I.PCOMPRA AS VT_PRODUTO, CODUSUARIOLOGADO AS USUARIO                                            
FROM PCCOTACAOCIAP C, PCITEMCOTACAOCIAP I, PCFORNEC F, PCPRODCIAP B, PCPRODCOTACAOCIAP P, PCEMPR U, PCFORNECCOTACAOCIAP FC, PCFILIAL FL                                      
WHERE :REVENDA = 'Não'
AND C.CODFUNCLANC = :FUNCLANC
AND I.CODFILIAL =  FL.CODIGO
AND I.CODPROD = B.CODPROD                                                                                                                                        
AND I.CODFORNEC = F.CODFORNEC                                                                                                                                      
AND FC.NUMCOTACAO = C.NUMCOTACAO                                                                                                                                   
AND C.NUMCOTACAO = I.NUMCOTACAO                                                                                                                                    
AND I.NUMCOTACAO = P.NUMCOTACAO                                                                                                                                    
AND I.CODFORNEC = FC.CODFORNEC                                                                                                                                     
AND I.CODPROD = P.CODPROD                                                                                                                                          
AND C.CODFUNCLANC = U.MATRICULA                                                                                                                                    
AND C.NUMCOTACAO = :NUMCOTACAO                                                                                                                                     
AND I.CODFORNEC = :CODFORNEC
AND I.CODFILIAL = :FILIAL                                                                                                                                          
AND C.DTCADASTRO BETWEEN :DTINICIAL AND :DTFINAL                                                                                                                   
UNION 
SELECT C.NUMCOTACAO, C.DTCADASTRO AS DATA, I.CODFORNEC,                                                                                                            
F.FORNECEDOR, DECODE(FC.SITUACAO, 'F', 'APROVADA','PENDENTE') AS SITUACAO,                                                                                       
I.CODFILIAL AS FILIAL, FL.RAZAOSOCIAL, FL.CGC, I.CODPROD, B.DESCRICAO,                                                                                                       
C.CODFUNCLANC AS COD_FUNC, U.NOME AS FUNCIONARIO_LANCAMENTO,                                                                                                       
P.QTPEDIDA, I.PCOMPRA AS VALOR, P.QTPEDIDA*I.PCOMPRA AS VT_PRODUTO, CODUSUARIOLOGADO AS USUARIO                                            
FROM PCCOTACAO C, PCITEMCOTACAO I, PCFORNEC F, PCPRODUT B, PCPRODCOTACAO P, PCEMPR U, PCFORNECCOTACAO FC, PCFILIAL FL                                         
WHERE :REVENDA = 'Sim'
AND C.CODFUNCLANC = :FUNCLANC
AND I.CODFILIAL =  FL.CODIGO
AND I.CODPROD = B.CODPROD                                                                                                                                        
AND I.CODFORNEC = F.CODFORNEC                                                                                                                                      
AND FC.NUMCOTACAO = C.NUMCOTACAO                                                                                                                                   
AND C.NUMCOTACAO = I.NUMCOTACAO                                                                                                                                  
AND I.NUMCOTACAO = P.NUMCOTACAO                                                                                                                                    
AND I.CODFORNEC = FC.CODFORNEC                                                                                                                                     
AND I.CODPROD = P.CODPROD                                                                                                                                          
AND C.CODFUNCLANC = U.MATRICULA                                                                                                                                    
AND C.NUMCOTACAO = :NUMCOTACAO                                                                                                                                     
AND I.CODFORNEC = :CODFORNEC
AND I.CODFILIAL = :FILIAL                                                                                                                                          
AND C.DTCADASTRO BETWEEN :DTINICIAL AND :DTFINAL
;