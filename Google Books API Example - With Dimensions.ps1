#setup variables
$api = "API CODE GOES HERE"
$barcode = Read-Host "Enter the barcode of the book"

#build the url and get response
$URL = "https://www.googleapis.com/books/v1/volumes?q=''isbn:$barcode"
$headers = @{
    Accept = "application/json"
    Authorization = $api
    }
$response = Invoke-RestMethod -Uri $URL -ContentType ‘application/json’ -Headers $headers -Method Get
#Get the book ID
$bookid = $response.items.id

#the querey above doesn't get the book dimensions. searching the book ID returns the dimensions
$URL2 = "https://www.googleapis.com/books/v1/volumes/$bookid"
$headers = @{
    Accept = "application/json"
    Authorization = $api
    }
$Bookinfo = Invoke-RestMethod -Uri $URL2 -ContentType ‘application/json’ -Headers $headers -Method Get

foreach ($book in $Bookinfo)
{
    $volume = $book.items

    foreach ($item in $bookinfo)
    {
        $volinfo = $item.volumeInfo
        $thumbnail = $volinfo.imageLinks 
        foreach ($link in $thumbnail)
        {
            $thumblink = $link.thumbnail
        }

        write-host "Title:" -ForegroundColor Green
        Write-Host $volinfo.title
        write-host "Author:" -ForegroundColor Green
        Write-Host $volinfo.authors
        write-host "Category:" -ForegroundColor Green
        Write-Host $volinfo.categories
        write-host "Language:" -ForegroundColor Green
        Write-Host $volinfo.language
        write-host "Maturity Rating:" -ForegroundColor Green
        Write-Host $volinfo.maturityRating
        write-host "Description:" -ForegroundColor Green
        Write-Host $volinfo.description
        write-host "Thumbnail:" -ForegroundColor Green
        Write-Host $thumblink
        Write-Host "Height: " $volinfo.dimensions.height
        Write-Host "Width: " $volinfo.dimensions.width
        Write-Host "Thickness: " $volinfo.dimensions.thickness -ForegroundColor Yellow
    }

}
