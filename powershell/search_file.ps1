function searchFile($filename){

    $targetDir = 'C:\'
    $targetFile = $filename


    #status flg files
    $workDir = 'C:\Windows\Temp\'
    $status_flg_result = $workDir + 'cs_result.txt'
    $status_flg_done = $workDir + 'cs_done.txt'
    $status_flg_running = $workDir + 'cs_running.txt'


    # check already checked
    if((Test-Path $status_flg_done) -or (Test-Path $status_flg_running)){
        exit
    }


    # Start
    echo '' > $status_flg_running
    $result = Get-ChildItem $targetDir -Recurse -File -Include $targetFile


    # Write result
    if($result){
        echo $result > $status_flg_result
    }

    #Finish
    rm $status_flg_running
    echo '' > $status_flg_done
}

searchFile('white.png')
