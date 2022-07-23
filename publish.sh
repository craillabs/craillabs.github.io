#!/usr/bin/env bash
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to you under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# copied from: https://github.com/apache/bahir-website/blob/master/publish.sh

set -e
cd site
bundle exec jekyll clean
bundle exec jekyll build -d _site
COMMIT_HASH=`git rev-parse HEAD`
cd ..
rm -rf docs
mkdir docs
mv site/_site/* docs
git add docs
echo "Publishing changes to /docs $COMMIT_HASH"
git commit -a -m "Publishing from $COMMIT_HASH"
echo "> > >"
echo " "
echo "Run git push to update the live site."
echo " "
echo " "
set +e
