SELECT 
    'rm -f ' || substring(l36_vc_nom_img_fre FROM 1 FOR position('.' IN l36_vc_nom_img_fre)) || '*' || chr(10) || 
    'rm -f ' || substring(l36_vc_nom_img_ver FROM 1 FOR position('.' IN l36_vc_nom_img_ver)) || '*' 
FROM tbom_l36_arqu_regi JOIN tbom_l35_dcto_log ON 
    l35_ni_mst_key = l36_ni_mst_key AND 
    l35_ni_nsc_doc = l36_ni_nsc_doc 
WHERE 
    l36_ni_mst_key = :mst_key AND
    l35_ni_cod_arq = 2621
;

SELECT 'rm /img/arquivos/0' || :mst_key || '/' || l20_vc_nom_arq_ent || '*' 
FROM tbom_l20_arqu_cont_tran 
WHERE l20_ni_mst_key = :mst_key ;

--SELECT 'cd /aplic/TMDP1/imagem/0' || substring(:mst_key::text FROM 1 FOR 1) || '/' || substring(:mst_key::text FROM 2 FOR 4);

SELECT 'find /aplic/TMDP1/imagem/0' || substring(:mst_key::text FROM 1 FOR 1) || '/' || substring(:mst_key::text FROM 2 FOR 4) || E' -depth -type d -empty -exec rmdir -v \\{\\} \\;';
