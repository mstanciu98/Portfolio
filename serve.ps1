param(
  [int]$Port = 8000
)

$Root = (Get-Location).Path
$Prefix = "http://localhost:$Port/"
$Listener = [System.Net.HttpListener]::new()
$Listener.Prefixes.Add($Prefix)

$ContentTypes = @{
  ".html" = "text/html; charset=utf-8"
  ".json" = "application/json; charset=utf-8"
  ".css" = "text/css; charset=utf-8"
  ".js" = "application/javascript; charset=utf-8"
  ".jpg" = "image/jpeg"
  ".jpeg" = "image/jpeg"
  ".png" = "image/png"
  ".gif" = "image/gif"
  ".svg" = "image/svg+xml"
  ".pdf" = "application/pdf"
  ".webp" = "image/webp"
}

try {
  $Listener.Start()
  Write-Host "Serving $Root at $Prefix"
  Write-Host "Press Ctrl+C to stop."

  while ($Listener.IsListening) {
    $Context = $Listener.GetContext()
    $Response = $Context.Response
    $RequestPath = [Uri]::UnescapeDataString($Context.Request.Url.AbsolutePath.TrimStart("/"))

    if ([string]::IsNullOrWhiteSpace($RequestPath)) {
      $RequestPath = "index.html"
    }

    $FilePath = [System.IO.Path]::GetFullPath((Join-Path $Root $RequestPath))

    if (-not $FilePath.StartsWith($Root, [StringComparison]::OrdinalIgnoreCase) -or -not (Test-Path -LiteralPath $FilePath -PathType Leaf)) {
      $Response.StatusCode = 404
      $Body = [Text.Encoding]::UTF8.GetBytes("Not found")
      $Response.OutputStream.Write($Body, 0, $Body.Length)
      $Response.Close()
      continue
    }

    $Extension = [System.IO.Path]::GetExtension($FilePath).ToLowerInvariant()
    $Response.ContentType = if ($ContentTypes.ContainsKey($Extension)) { $ContentTypes[$Extension] } else { "application/octet-stream" }

    $Bytes = [System.IO.File]::ReadAllBytes($FilePath)
    $Response.ContentLength64 = $Bytes.Length
    $Response.OutputStream.Write($Bytes, 0, $Bytes.Length)
    $Response.Close()
  }
}
finally {
  if ($Listener.IsListening) {
    $Listener.Stop()
  }

  $Listener.Close()
}
