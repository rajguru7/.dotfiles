#!/usr/bin/bash

# checking for github api token in environment
if [ -z $(tmux showenv -h GITHUB_TOKEN 2>/dev/null) ]; then
    eval $(op signin)
    tmux set-environment -h GITHUB_TOKEN "$(op read op://Personal/zc3wfc7xcblkus2ttwxh5q52nq/token)"
    tmux send-keys -R \; clear-history
fi

# leetcode stats
curl -s "https://leetcode.com/graphql/" -H "Content-Type: application/json" --data '{ "query": " query userProblemsSolved($username: String!) { allQuestionsCount { difficulty count }  matchedUser(username: $username) { problemsSolvedBeatsStats { difficulty percentage } submitStatsGlobal { acSubmissionNum { difficulty count } } }} ", "variables": { "username": "saurabhrajguru7" } }' | jq -r '.data.matchedUser.submitStatsGlobal.acSubmissionNum[] | "\(.difficulty)\t\(.count)"' | column -t


# Set your GitHub username
# USERNAME="rajguru7"

# GitHub GraphQL API query
# QUERY="query {\
#   user(login: \\\\\\\"$USERNAME\\\\\\\") {\
#     repositories(first: 6, orderBy: {field: STARGAZERS, direction: DESC}) {\
#       nodes {\
#         name\
#         stargazers {\
#           totalCount\
#         }\
#       }\
#     }\
#   }\
# }"

# Send the request to GitHub API and format the response using jq
# tmux split-window -v "curl -s -H \"Authorization: Bearer TOKEN -X POST -d \"{\\\"query\\\":\\\"${QUERY}\\\"}\" https://api.github.com/graphql | jq -r '.data.user.repositories.nodes[] | \"\(.name)\t\(.stargazers.totalCount)\"' | column -t; read -n 1 -s"

NAME="rajguru7"

tmux split-window -v "$(cat <<EOF
curl -s https://api.github.com/graphql -X POST \
-H "Authorization: Bearer $(tmux show-environment -h GITHUB_TOKEN | sed 's/.*=//')" \
-H "Content-Type: application/json" \
-d $(echo -E $(jq -c -n --arg query "$(cat <<EOF1
query {
  user(login: "$NAME") {
    repositories(first: 6, orderBy: {field: STARGAZERS, direction: DESC}) {
      nodes {
        name
        stargazers {
          totalCount
        }
      }
    }
  }
}
EOF1
)" '{"query":$query}') | jq -R -c)
EOF
) | jq -r '.data.user.repositories.nodes[] | \"\(.name)\t\(.stargazers.totalCount)\"' | column -t; read -n 1 -s"

tmux split-window -h "leet-stats.bash; read -n 1 -s"

read -n 2 -s
