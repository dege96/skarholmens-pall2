# Usage:
#   .\gacp.ps1 "Din commit-text här"
#   .\gacp.ps1   # använder standardmeddelandet "update"

param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]] $MessageParts
)

$msg = if ($MessageParts -and $MessageParts.Count -gt 0) { [string]::Join(' ', $MessageParts) } else { 'update' }

Write-Host "[gacp] commit message:" -NoNewline; Write-Host " $msg" -ForegroundColor Green

try {
    git add .
    git commit -m $msg
    git push
} catch {
    Write-Error $_
    exit 1
}

