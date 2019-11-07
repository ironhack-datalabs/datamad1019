### Challenge 2: Count Commits

from challenge1 import githubRequestAuthorized,cutUrlDomain

data = githubRequestAuthorized("/repos/ironhack-datalabs/datamad1019").json()
url = cutUrlDomain(data['commits_url'])
#Obtain commits information from API Github
commits = githubRequestAuthorized(url.split('{/sha}')[0]).json()

#Count the number of commits made this year
import re

ccount = 0
for c in commits:
    date = c['commit']['committer']['date']
    re.sub(r'[A-Z]',' ',date)
    if int(date[:4]) >= 2019:
        ccount += 1
print('Number of commits in year 2019: ', ccount)  