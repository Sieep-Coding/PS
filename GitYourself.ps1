function GitYourself {
    param (
        [string]$repo,
        [string]$commit,
        [string]$branch
    )
    <#summary
    This is a powershell script to automate the creation of git PRs
    not ready for production yet
    <#params: repo, commit, branch#>
    #>
    $repo = 'C:\' 
    Write-Output "found repo at: $repo"
    $commit = Read-Host 'Commit Message:'
    if ($commit == "") {
        Write-Debug "No commit message."
        exit 1
    }
    Write-Output "Commit Message: $commit"
    $branch = Read-Host 'Branch name:'
    if ($branch == "") {
        Write-Debug "No branch name."
        exit 1    
    }
    Write-Output "Branch Found: $branch"

    Set-Location -Path $repo

    git add .

    git commit -m $commit

    git push --set-upstream origin $branch

    Write-Output "Changes have been pushed to the remote repository on branch '$branch'."
}