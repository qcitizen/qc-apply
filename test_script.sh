#!/bin/bash
####### Run test cases for pyscript.py script #######
### Remove Old Logs
rm -rf data.log

### Test Case # 1
echo 'aaabccccdd' | python3 pyscript.py >> data.log

### Test Case # 2
echo 'aaaaaffffffffffc' | python3 pyscript.py >> data.log

### Test Case # 3
echo 'abcd' | python3 pyscript.py >> data.log

### Test Case # 4
echo 'ccceee12eccceee' | python3 pyscript.py >> data.log

### Test Case # 5
echo 'effeac01cb65c' | python3 pyscript.py >> data.log

### Print Expected Result
echo '----------Expected Result----------'
VAR1=`cat expected_result`
echo $VAR1

### Print Actual Result
echo '----------Actual Result----------'
VAR2=`cat data.log`
echo $VAR2

### Compare Results
if [ "$VAR1" == "$VAR2" ]; then
    echo -e "\e[92m##########PASS##########\e[0m"
else
    echo -e "\e[31m##########FAIL##########\e[0m"
fi
