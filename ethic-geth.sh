
#!/bin/bash
#
#    Script that to start node geth.
#
#    Copyright (C) by EthiHub.
#
#    This file is part of EthicHub platform.
#
#    This is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# ------------------------------------------------------------------------------
# Start EthicHub Geth Node
#
# Usage:
#   1. Download this script to start geth node
#   2. `chmod 700 ethichub-geth`
#   3. Then run this script `./ethichub-geth` in a separate window.
#
# Parameters:
#   corsdomain Comma separated list of domains from which to accept cross origin requests (browser enforced). (p.e 'http://test.domain.com:port' or '*.domain.com:port')
#   vhosts     Comma separated list of virtual hostnames from which to accept requests (server enforced).  (p.e 'test.domain.com' no need port)
#
# Sample Usage:
#   ./ethichub-geth '*.ethichub.com' 'geth.ethichub.com'
#
set -e
# CORSDOMAIN
CORSDOMAIN=${1:-"*.ethichub.com"}
# RPC
VHOSTS=${2:-"geth.ethichub.com"}

if [ ! -d /var/log/geth ]; then
      mkdir -p /var/log/geth;
fi

geth --rpc --rpcaddr 0.0.0.0 --rpcapi "eth,net,web3,txpool" --syncmode light --rpccorsdomain "*.ethichub.com" --rpcvhosts "geth.ethichub.com" 1>> /var/log/geth/geth.log 2>> /var/log/geth/err-geth.log
