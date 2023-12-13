Get-ChildItem -Path . -Filter *.md | ForEach-Object {
$file = $_.FullName
$content = Get-Content $file -Raw
$prepend = "---`nlayout: default`ntitle: tittel`nnav_order: 1`nhas_children: true`nparent: parent`n---`n`n"

$content = $prepend + $content
Set-Content $file $content
}