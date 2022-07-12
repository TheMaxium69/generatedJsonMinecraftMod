echo "Start Script Create JSON"

#Recup Path Forge
$path = Read-Host "the path of 'Forge' | default : D:\Github\TyroServS3\forge-1.16.5-36.2.5-mdk\"
if ($path -eq "") {
  $path = "D:\Github\TyroServS3\forge-1.16.5-36.2.5-mdk\"
}

#Recup ModID Forge
$modid = Read-Host "it's MOD_ID | default : tyromod"
if ($modid -eq "") {
  $modid = "tyromod"
}

#Recup Type
$type = Read-Host "it's BLOCK or ITEM or TOOL | default : ITEM"
if ($type -eq "") {
  $type = "ITEM"
}

#Si TYPE okay
if (($type -eq "ITEM") -or ($type -eq "BLOCK") -or ($type -eq "TOOL")) {

  #Name du Type
  $name = Read-Host "the NAME of the" $type;

  if (($type -eq "ITEM") -or ($type -eq "TOOL")){

    #url de création
    $link = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + ".json"

    #Create File
    Out-File $link

    #Line "Layer0"
    $tempLayer = $modid + ":item/" + $name

    #Line "Parent"
    if (($type -eq "TOOL")){
      $tempParent = "item/handheld"
    } else {
      $tempParent = "item/generated"
    }

    #JSONContenu
    $itemJSON = @"
{
  "parent": "$tempParent",
  "textures": {
    "layer0": "$tempLayer"
  }
}
"@

    #Add contenue file
    ADD-content -path $link -value $itemJSON

  }


  if ($type -eq "BLOCK"){


                                  ### FILE ITEM
    #url de création
    $link_ITEM = $path +"src\main\resources\assets\"+$modid+"\models\item\"+ $name + ".json"

    #Create File
    Out-File $link_ITEM

    #Line "Parent"
    $tempParent_ITEM = $modid + ":block/" + $name

    #JSONContenu
    $itemJSON_ITEM = @"
{
  "parent": "$tempParent_ITEM"
}
"@
    #Add contenue file
    ADD-content -path $link_ITEM -value $itemJSON_ITEM

                                  ### FILE BLOCKSTATES
    #url de création
    $link_BS = $path +"src\main\resources\assets\"+$modid+"\blockstates\"+ $name + ".json"

    #Create File
    Out-File $link_BS

    #Line "Model"
    $tempModel_BS = $modid + ":block/" + $name

    #JSONContenu
    $itemJSON_BS = @"
{
  "variants": {
    "": {
      "model": "$tempModel_BS"
    }
  }
}
"@
    #Add contenue file
    ADD-content -path $link_BS -value $itemJSON_BS


                                  ### FILE BLOCK
    #url de création
    $link_B = $path +"src\main\resources\assets\"+$modid+"\models\block\"+ $name + ".json"

    #Create File
    Out-File $link_B

    #Line "All"
    $tempAll_B = $modid + ":block/" + $name

    #JSONContenu
    $itemJSON_B = @"
{
  "parent": "block/cube_all",
  "textures": {
    "all": "$tempAll_B"
  }
}
"@
    #Add contenue file
    ADD-content -path $link_B -value $itemJSON_B

  }


} else {
  echo "ERREUR"
}