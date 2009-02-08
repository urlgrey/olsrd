# The olsr.org Optimized Link-State Routing daemon(olsrd)
# Copyright (c) 2004-2009, the olsr.org team - see HISTORY file
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in
#   the documentation and/or other materials provided with the
#   distribution.
# * Neither the name of olsr.org, olsrd nor the names of its
#   contributors may be used to endorse or promote products derived
#   from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# Visit http://www.olsr.org for more information.
#
# If you find this software useful feel free to make a donation
# to the project. For more information see the website or contact
# the copyright holders.
#

CONFSRCS += src/olsr_cfg.c
CONFSRCS += src/olsr_cfg_gen.c
CONFSRCS += src/olsr_ip_acl.c
CONFSRCS += src/olsr_ip_prefix_list.c
CONFSRCS += src/olsr_cfg_data.c
CONFSRCS += src/ipcalc.c
CONFSRCS += src/builddata.c
CONFSRCS += src/common/autobuf.c
CONFSRCS += src/common/string.c
CONFSRCS += $(CONFDIR)/config-verify.c

CONFOBJS += $(CONFSRCS:%.c=%.o)

config-verify: $(CONFOBJS)
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

.PHONY: config-verify_clean config-verify_install

config-verify_clean:
	rm -f $(CONFOBJS)
	rm -f config-verify

config-verify_install:
	# executable not to be installed
	$(STRIP) config-verify