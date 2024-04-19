## Usage
# searchFile 'C:/Users/' 'white.png'

function searchFile($targetDir, $targetFile){

    #status flg files
    $workDir = 'C:\Windows\Temp\'
    $status_flg_result = $workDir + 'cs_found.txt'
    $status_flg_done = $workDir + 'cs_done.txt'
    $status_flg_running = $workDir + 'cs_running.txt'


    # check already done
    if(Test-Path $status_flg_done) {
        echo 'already done'
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

    echo 'Done'
}

