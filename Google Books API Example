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

#Loop through the nested data to get the info we want
foreach ($book in $response)
{
    $bookinfo = $book.items

    foreach ($item in $bookinfo)
    {
        $volinfo = $item.volumeInfo
        $thumbnail = $volinfo.imageLinks 
        foreach ($link in $thumbnail)
        {
            $thumblink = $link.thumbnail
        }

        write-host "Title: " $volinfo.title
        write-host ""
        write-host "Author: " $volinfo.authors
        write-host ""
        write-host "Category: " $volinfo.categories
        write-host ""
        write-host "Language: " $volinfo.language
        write-host ""
        write-host "Maturity Rating: " $volinfo.maturityRating
        write-host ""
        write-host "Description: " $volinfo.description
        write-host ""
        write-host "Thumbnail: " $thumblink


    }

}
