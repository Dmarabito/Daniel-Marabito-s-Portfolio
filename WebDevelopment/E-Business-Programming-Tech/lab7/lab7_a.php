<!DOCTYPE html>
<body>
<p>
<?php
$FileFinalLocation = $_FILES["fileToUpload"]["name"];
$FileName = $_FILES["fileToUpload"]["name"];
$UploadErrorMessage = "";
$FileUploadSuccess=false;
$UploadedFileContents = array();
if(OkayCheck($UploadErrorMessage)){
    if(move_uploaded_file($_FILES["fileToUpload"]["tmp_name"],$FileFinalLocation)){$FileUploadSuccess =true;}
    else {
        $UploadErrorMessage = "Error: Something went wrong with the transfer.";
    }
}
?>
</p>
<p><?php if($UploadErrorMessage!=""){echo($UploadErrorMessage);}?></p>
<p><?php if($FileUploadSuccess){echo($_FILES["fileToUpload"]["name"]." has been uploaded");}?></p>
<p>
<?php 
    if ($FileUploadSuccess){
        $UploadedFile = fopen($_FILES["fileToUpload"]["name"],"r") or die("ahhhhhhhhhhh");
        $WritingFile = fopen("output.txt","w") or die("ahhhhhhhhhhh");
        while (!feof($UploadedFile)){
            array_push($UploadedFileContents,fgets($UploadedFile));
            echo(count($UploadedFileContents).") ".end($UploadedFileContents)."<br/>");
            fwrite($WritingFile,strtoupper(end($UploadedFileContents)));
        }
        fclose($WritingFile);
        fclose($UploadedFile);
    }
?>
</p>
</body>
</html>

<?php 
function OkayCheck (&$UploadErrorMessage){
    $UploadAcceptable = true;
    if(file_exists($_FILES["fileToUpload"]["name"])){
        $UploadAcceptable = false;
        $UploadErrorMessage = $UploadErrorMessage==""?"File already exists":$UploadErrorMessage." and "."File already exists";
    }

    if(pathinfo($_FILES["fileToUpload"]["name"])["extension"]!="txt"){
        $UploadAcceptable = false;
        $UploadErrorMessage = $UploadErrorMessage=="" ? (pathinfo($_FILES["fileToUpload"]["name"])["extension"])." is not an accepted file type, please use .txt"
        :$UploadErrorMessage." and "
        .(pathinfo($_FILES["fileToUpload"]["name"])["extension"])." is not an accepted file type, please use .txt";
    }

    if ($_FILES["fileToUpload"]["size"]>1024){
        $UploadAcceptable = false;
        $UploadErrorMessage = $UploadErrorMessage==""?"We accept files of up to 1024 bytes, your file is too big at ".$_FILES["fileToUpload"]["size"]."Bytes"
        :$UploadErrorMessage." and "."We accept files of up to 1024 bytes, your file is too big at ".$_FILES["fileToUpload"]["size"]." bytes";
    }

    return $UploadAcceptable;
}
?>