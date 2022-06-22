try{
cls
$ErrResp =""

$response = ""

$curDir = (Get-Location).path
$curDir = $curDir + '\results.json'

$file_data = Get-Content $curDir
$PostData = $file_data | ConvertTo-Json
$ipaddr = "127.0.0.1"

$response = Invoke-WebRequest -Uri 'https://MyServerURL-HERE/api/data' -Method POST -Body $PostData -ErrorVariable ErrResp
Write-Host $response

}
catch [System.Net.WebException] {   
        $respStream = $_.Exception.Response.GetResponseStream()
        $reader = New-Object System.IO.StreamReader($respStream)
        $respBody = $reader.ReadToEnd() | ConvertFrom-Json
        $respBody;
 }
 
 $ErrResp