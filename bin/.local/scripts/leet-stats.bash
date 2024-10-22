#!/usr/bin/bash

NAME="rajguru7"

resp="$(curl -s https://api.github.com/graphql -X POST \
-H "Authorization: Bearer $(tmux show-environment -h GITHUB_TOKEN | sed 's/.*=//')" \
-H "Content-Type: application/json" \
-d "$(jq -c -n --arg query "$(cat <<EOF1
{
  user(login: "$NAME") {
    followers {
      totalCount
    }
    open_prs: pullRequests(states: OPEN) {
      totalCount
    }
    merged_prs: pullRequests(states: MERGED) {
      totalCount
    }
    contributionsCollection {
      contributionCalendar {
        totalContributions
      }
    }
  }
}
EOF1
)" '{"query":$query}')")"

followers=$(echo "$resp" | jq -r '.data.user.followers.totalCount')
open_prs=$(echo "$resp" | jq -r '.data.user.open_prs.totalCount')
merged_prs=$(echo "$resp" | jq -r '.data.user.merged_prs.totalCount')
tot_contri=$(echo "$resp" | jq -r '.data.user.contributionsCollection.contributionCalendar.totalContributions')


# Create a table using column
echo -e "Followers\t$followers"
echo -e "Open PRs\t$open_prs"
echo -e "Merged PRs\t$merged_prs"
echo -e "Total Contri\t$tot_contri"
