param([string]$Aluno, [switch]$DryRun)
$cfg = Get-Content alunos.json -Raw | ConvertFrom-Json
$alunos = $cfg.alunos
if ($Aluno) { $alunos = $alunos | Where-Object { $_.id -eq $Aluno } }
foreach ($a in $alunos) {
  $id = $a.id; $repo = $a.repo; $branch = if ($a.branch) { $a.branch } else { "main" }
  $path = "alunos/$id"
  $url = if ($repo -like "https://*") { $repo } else { "https://github.com/$repo.git" }
  if (-not (Test-Path $path)) {
    Write-Host "ADD $id -> $repo ($branch) em $path"
    if (-not $DryRun) { git submodule add -b $branch $url $path }
  } else {
    Write-Host "UPDATE $id ($path) -> $branch"
    if (-not $DryRun) { git submodule update --remote --merge -- $path }
  }
}
if (-not $DryRun) { Write-Host "sync concluido" }
