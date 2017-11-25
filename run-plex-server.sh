#!/bin/bash
#
# Copyright (c) 2017 Michael de Silva, CTO Inertialbox (inertialbox.com)
# Blog: mwdesilva.com  // Expertise: desilva.io // Twitter: @bsodmike
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN

set -e

docker run \
  -d \
  --restart unless-stopped \
  --name plex \
  -p 32400:32400/tcp \
  -p 3005:3005/tcp \
  -p 8324:8324/tcp \
  -p 32469:32469/tcp \
  -p 1900:1900/udp \
  -p 32410:32410/udp \
  -p 32412:32412/udp \
  -p 32413:32413/udp \
  -p 32414:32414/udp \
  -e TZ="${PLEX_TZ}" \
  -e PLEX_CLAIM="${PLEX_CLAIM}" \
  -e ADVERTISE_IP="http://${PLEX_HOST_IP}:32400/" \
  -h ${PLEX_HOST_IP} \
  -v ${PLEX_DATA_PATH}/config:/config \
  -v ${PLEX_DATA_PATH}/transcode:/transcode \
  -v ${PLEX_DEFAULT_LIBRARY}:/data \
  plexinc/pms-docker
