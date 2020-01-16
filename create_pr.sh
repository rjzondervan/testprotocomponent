#/bin/bash

export $globalowner=rjzondervan
export $owner=rjzondervan
export $repository=testgeneratedcomponent1
export $branch=master
export $RELEASE_NAME=V0.1
export $message="update from proto component"

git remote add child https://github.com/$owner/$repository
git branch update-$RELEASE_NAME
git checkout update-$RELEASE_NAME
if[$owner==$globalowner];then
    git push -u child update-$RELEASE_NAME
else

fi
hub pull-request -b $owner/$repository:$branch -h $globalowner/$repository:update-$RELEASE_NAME -m $message
git remote remove child