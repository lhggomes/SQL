SELECT C.NUMCOTACAO, C.DTCADASTRO AS DATA, I.CODFORNEC,                                                                                                            
F.FORNECEDOR, DECODE(FC.SITUACAO, 'F', 'APROVADA','PENDENTE') AS SITUACAO,                                                                                       
I.CODFILIAL AS FILIAL, I.CODPROD, B.DESCRICAO,                                                                                                                  
C.CODFUNCLANC AS COD_FUNC, U.NOME AS FUNCIONARIO_LANCAMENTO,                                                                                                       
P.QTPEDIDA, I.PCOMPRA AS VALOR, P.QTPEDIDA*I.PCOMPRA AS VT_PRODUTO, CODUSUARIOLOGADO AS USUARIO
                                              
FROM PCCOTACAOCIAP C, PCITEMCOTACAOCIAP I, PCFORNEC F, PCPRODCIAP B, PCPRODCOTACAOCIAP P, PCEMPR U, PCFORNECCOTACAOCIAP FC                                         

WHERE I.CODPROD = B.CODPROD                                                                                                                                        
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
--GROUP BY C.NUMCOTACAO, C.DTCADASTRO, I.CODFORNEC,  F.FORNECEDOR, I.CODFILIAL, I.CODPROD, B.DESCRICAO, I.PCOMPRA, C.CODFUNCLANC, U.NOME, FC.SITUACAO                
ORDER BY C.NUMCOTACAO

;