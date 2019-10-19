# Architecture  {#architecture}

## Overall `bdvers`architecture {-}

## Packages: {-}

## `bddwc`

#### Overview Design 

<div class="figure">
<img src="images/arc/Arc_bddwc_overview.svg" alt="bddwc overview"  />
<p class="caption">(\#fig:unnamed-chunk-1)bddwc overview</p>
</div>



#### R functions dependency & information 
<!--html_preserve--><div id="htmlwidget-4b4056659103710c9a63" style="width:672px;height:480px;" class="visNetwork html-widget"></div>
<script type="application/json" data-for="htmlwidget-4b4056659103710c9a63">{"x":{"nodes":{"node":["clean_dwc","darwinize_names","download_cloud_data","get_darwin_core_info","link_old_new","rename_user_data","test_cloud","test_columns_cloud","test_data_dwc","test_data_renamed","test_data_user"],"type":["function","function","function","function","function","function","function","function","function","function","function"],"isExported":[false,true,true,false,false,true,false,false,false,false,false],"outDegree":[0,3,4,1,1,2,0,0,0,0,0],"inDegree":[2,0,0,0,0,0,2,1,2,2,2],"numRecursiveDeps":[0,3,4,1,1,2,0,0,0,0,0],"numRecursiveRevDeps":[2,0,0,0,0,0,2,1,2,2,2],"betweenness":[0,0,0,0,0,0,0,0,0,0,0],"pageRank":[0.0980874316939891,0.0655737704918033,0.0655737704918033,0.0655737704918033,0.0655737704918033,0.0655737704918033,0.135245901639344,0.0795081967213115,0.0980874316939891,0.149180327868852,0.112021857923497],"id":["clean_dwc","darwinize_names","download_cloud_data","get_darwin_core_info","link_old_new","rename_user_data","test_cloud","test_columns_cloud","test_data_dwc","test_data_renamed","test_data_user"],"label":["clean_dwc","darwinize_names","download_cloud_data","get_darwin_core_info","link_old_new","rename_user_data","test_cloud","test_columns_cloud","test_data_dwc","test_data_renamed","test_data_user"],"color":["#97C2FC","#97C2FC","#97C2FC","#97C2FC","#97C2FC","#97C2FC","#97C2FC","#97C2FC","#97C2FC","#97C2FC","#97C2FC"],"x":[0,0,0,0,0,0,0,0,0,-1,1],"y":[null,null,null,null,null,null,null,null,null,null,null]},"edges":{"SOURCE":["darwinize_names","darwinize_names","darwinize_names","download_cloud_data","download_cloud_data","download_cloud_data","download_cloud_data","get_darwin_core_info","link_old_new","rename_user_data","rename_user_data"],"TARGET":["clean_dwc","test_data_dwc","test_data_user","clean_dwc","test_cloud","test_columns_cloud","test_data_dwc","test_cloud","test_data_renamed","test_data_renamed","test_data_user"],"from":["darwinize_names","darwinize_names","darwinize_names","download_cloud_data","download_cloud_data","download_cloud_data","download_cloud_data","get_darwin_core_info","link_old_new","rename_user_data","rename_user_data"],"to":["clean_dwc","test_data_dwc","test_data_user","clean_dwc","test_cloud","test_columns_cloud","test_data_dwc","test_cloud","test_data_renamed","test_data_renamed","test_data_user"],"color":["#848484","#848484","#848484","#848484","#848484","#848484","#848484","#848484","#848484","#848484","#848484"]},"nodesToDataframe":true,"edgesToDataframe":true,"options":{"width":"100%","height":"100%","nodes":{"shape":"dot","physics":false},"manipulation":{"enabled":false},"edges":{"smooth":false,"arrows":"to"},"physics":{"stabilization":false},"layout":{"hierarchical":{"enabled":true,"edgeMinimization":false,"direction":"BU","sortMethod":"hubsize"}},"interaction":{"dragNodes":true,"dragView":true,"zoomView":false}},"groups":null,"width":null,"height":null,"idselection":{"enabled":true,"style":"width: 150px; height: 26px","useLabels":true,"main":"Select by id"},"byselection":{"enabled":false,"style":"width: 150px; height: 26px","multiple":false,"hideColor":"rgba(200,200,200,0.5)"},"main":null,"submain":null,"footer":null,"background":"rgba(0, 0, 0, 0)","igraphlayout":{"type":"square"},"highlight":{"enabled":true,"hoverNearest":false,"degree":{"from":11,"to":11},"algorithm":"hierarchical","hideColor":"rgba(200,200,200,0.5)","labelOnly":true},"collapse":{"enabled":false,"fit":false,"resetHighlight":true,"clusterOptions":null,"keepCoord":true,"labelSuffix":"(cluster)"},"tooltipStay":300,"tooltipStyle":"position: fixed;visibility:hidden;padding: 5px;white-space: nowrap;font-family: verdana;font-size:14px;font-color:#000000;background-color: #f5f4ed;-moz-border-radius: 3px;-webkit-border-radius: 3px;border-radius: 3px;border: 1px solid #808074;box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


<!--html_preserve--><div id="htmlwidget-652b9fb34fc6237464ba" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-652b9fb34fc6237464ba">{"x":{"filter":"none","data":[["1","2","3","4","5","6","7","8","9","10","11"],["clean_dwc","darwinize_names","download_cloud_data","get_darwin_core_info","link_old_new","rename_user_data","test_cloud","test_columns_cloud","test_data_dwc","test_data_renamed","test_data_user"],["Clean Dictionary Data","Darwinize names","Download Darwin Cloud Data","Retrieve Information about Darwin Core Terms","Link Old/New Name for Checkboxes","Rename Dataset According to Darwinized Names","Test If Provided Path to Cloud Data is Valid","Test If Provided Columns of Cloud Data are Valid","Test If Provided Dictionary Data is Valid","Test If Provided Renaming Data is Valid","Test If Provided User Data is Valid"],["Clean dictionary from unnecessary or empty fields\n","`darwinize_names()` is a function to darwinize given names using a reference\n","`download_cloud_data()` is a function used to download Darwin Cloud\n","`get_darwin_core_info()` is a function (not exported) to download\n","`combine_old_new()` is a function that combines (`paste`) fieldname and\n","`rename_user_data()` is a function used to rename given dataset\n","Test If Provided Path to Cloud Data is Valid\n","Test If Provided Columns of Cloud Data are Valid\n","Test If Provided Dictionary Data is Valid\n","Test If Provided Renaming Data is Valid\n","Test If Provided User Data is Valid\n"],[false,true,true,false,false,true,false,false,false,false,false],["<a href=\"https://github.com/bd-R/bdDwC/blob/master/R/dictionary.R#L86\">Link<\/a>","<a href=\"https://github.com/bd-R/bdDwC/blob/master/R/darwinizer.R#L23\">Link<\/a>","<a href=\"https://github.com/bd-R/bdDwC/blob/master/R/dictionary.R#L27\">Link<\/a>","<a href=\"https://github.com/bd-R/bdDwC/blob/master/R/dictionary.R#L130\">Link<\/a>","<a href=\"https://github.com/bd-R/bdDwC/blob/master/R/darwinizer.R#L203\">Link<\/a>","<a href=\"https://github.com/bd-R/bdDwC/blob/master/R/darwinizer.R#L152\">Link<\/a>","<a href=\"https://github.com/bd-R/bdDwC/blob/master/R/test.R#L96\">Link<\/a>","<a href=\"https://github.com/bd-R/bdDwC/blob/master/R/test.R#L116\">Link<\/a>","<a href=\"https://github.com/bd-R/bdDwC/blob/master/R/test.R#L39\">Link<\/a>","<a href=\"https://github.com/bd-R/bdDwC/blob/master/R/test.R#L68\">Link<\/a>","<a href=\"https://github.com/bd-R/bdDwC/blob/master/R/test.R#L11\">Link<\/a>"]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>FunctionName<\/th>\n      <th>Title<\/th>\n      <th>Description<\/th>\n      <th>isExported<\/th>\n      <th>GithubURL<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":11,"order":[],"autoWidth":false,"orderClasses":false,"columnDefs":[{"orderable":false,"targets":0}],"lengthMenu":[10,11,25,50,100]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

## `bddwc.app`

<div class="figure">
<img src="images/arc/Arc_bddwc_app.svg" alt="Shiny App overview"  />
<p class="caption">(\#fig:unnamed-chunk-2)Shiny App overview</p>
</div>

## `bdchecks`
#### Overview Design 

<div class="figure">
<img src="images/arc/Arc_bdchecks_overview.svg" alt="bdchecks overview"  />
<p class="caption">(\#fig:unnamed-chunk-3)bdchecks overview</p>
</div>

## `bdchecks.app`

<div class="figure">
<img src="images/arc/Arc_bdchecks_app.svg" alt="bdchecks Shiny App"  />
<p class="caption">(\#fig:unnamed-chunk-4)bdchecks Shiny App</p>
</div>
## `bdclean`

<div class="figure">
<img src="images/arc/Arc_bdclean_app.svg" alt="bdclean Shiny App"  />
<p class="caption">(\#fig:unnamed-chunk-5)bdclean Shiny App</p>
</div>

## `bdutilities`

## `bdutilities.app`


## Packages in the making {-}

### `bdvis`

### `bdtools`
