Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EBE5464E
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 25 Aug 2024 11:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724583994; cv=none; b=d3gsi6gNAh2tvFqQJ+QBkO3JlX2dvrviTTeN97DL0yYqvzEpkITkDSCIAA9Nk7q+aDCeglUgbWdwI0YGNAulk7QJA0qJHq80CzshZPt6SYticsgZsLHhXkQJPN/WI3DJ9kAynVZS3QJSfIqfe9x/lYomp5Wm8cZBmtCmCalBWhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724583994; c=relaxed/simple;
	bh=NxXP+9Tj7Ma7qbOuUBw5f+orxXhUo7vqtHJu+g87oX4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U4giLDUZp8vyS0Zd28fun3iNGZggHIVV09PAjcMLXHfxgvb8VjB5hQz3JPn18eEUSfTiK9f8RrkhmpiVQw4XB+RioNyLKIFGAWqNA94UP5w606ZDse+U0dZ2F4HkrYqQOwU2Odu1ULI+ATXVBW2ZgN+NrfsFnhnB2ABrp1jcR9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyOfeht5; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyOfeht5"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71456acebe8so843309b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 25 Aug 2024 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724583992; x=1725188792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnIhzNWTBy2dvgbdWu1kUHfrHb98TIY9Kq9/3Jiigb0=;
        b=MyOfeht5qZeuXmqcHTHhT7Dz3Mpi9I7vU5q+zS7ZJcLrsDoMMgzvFLqOlHp/V1dESJ
         x9EH1bNzeCyQ+KID5gHPvxpQt5bxC8Su661daJaD44UJ0FVy9BreF3PqOc86USpwh5Uz
         mabceL9UBKhjUjILjDqxJ25JBH4HsmU4rLhci2/pGbBK+FTQ68Xd6siL8jiqm4546vwI
         B3OS0OwRfWFCHOUND6xPF94k6sU9jIGUmWVkxrltWaCWj2lxZieEDY72fF6//VheoOIP
         bpELK5Vf3T5oRYWmeuqxmeo6O2KuAOBLryFviAGkRXi2RNkywgJiQe7gWAja3j71Sps4
         TvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724583992; x=1725188792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnIhzNWTBy2dvgbdWu1kUHfrHb98TIY9Kq9/3Jiigb0=;
        b=puyMVENFFGgLnR5FsrzRwkJDahjbb0a01IC04PqzwK82wu2dJdNrpAcopc+HnRuNw7
         vOrKeJB6t0pG3JYvw5+CtUDt5ZfpT+8pf+Pmf6iSWsR3sOgEQrfYrz38p88zT2FP1kA0
         VvxBIRCr7CS0WZ2dpU3BZ3OPv/c6LrPIk7e7J/HiOaDXLwGz3oJ8Uf6xu7qRBiTnvzsl
         MC/+qfcro0ZCI/GnCUch0gB99KwT98lGbtTDdO1oGJdRJJVStEM0w6FM7A1C9XT+4S3N
         KCaI428m6qQSv90TvtSa/dVQQvVBGNmmEITiOAbFOrsNX8rhbrFyNTwF2PUeLhks+8qP
         o1Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVkMojMfT/5Axeh7JlhCU1v0sgXH7TR/eZUTn+9th9UMweE+ecwL9sqKJDN/1LdRyLwrtfP9pTM7huDVYgMI7L1owEECw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyqht2nRq+5R9SxfUnlMc6cCnVhYexI+4F4n3wgp+VR7HBGeC7M
	vi8KhavRhq2iEeJFUo+Nur/8qBjh8BaT2tdyzA5XCbi3cG4jCpWk
X-Google-Smtp-Source: AGHT+IG78cB3xRh69jsCqb3/wOLpy3CcO6Zg3iV0BTDnpDj/H8rutawMDNO+49k4ma/7dkt+wYvorg==
X-Received: by 2002:a05:6a20:439f:b0:1ca:cc16:1ebc with SMTP id adf61e73a8af0-1cc89d29a8amr8094741637.11.1724583991365;
        Sun, 25 Aug 2024 04:06:31 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:2c:e57:3d3a:9292:2a7f:6dd4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9acdb54asm6012409a12.42.2024.08.25.04.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 04:06:30 -0700 (PDT)
From: Amit Vadhavana <av2082000@gmail.com>
To: todd.e.brandt@linux.intel.com,
	skhan@linuxfoundation.org,
	ricardo@marliere.net
Cc: av2082000@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pm-graph: Update directory handling and installation process in Makefile
Date: Sun, 25 Aug 2024 16:36:20 +0530
Message-Id: <20240825110620.30109-1-av2082000@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Standardize directory variables to support more flexible installations.
- Add copyright and licensing information to the Makefile.
- Introduce ".PHONY" declarations to ensure that specific targets are always
  executed, regardless of the presence of files with matching names.
- Add a help target to provide usage instructions.

Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
---
 tools/power/pm-graph/Makefile | 111 ++++++++++++++++++++++------------
 1 file changed, 73 insertions(+), 38 deletions(-)

diff --git a/tools/power/pm-graph/Makefile b/tools/power/pm-graph/Makefile
index b5310832c19c..aeddbaf2d4c4 100644
--- a/tools/power/pm-graph/Makefile
+++ b/tools/power/pm-graph/Makefile
@@ -1,51 +1,86 @@
 # SPDX-License-Identifier: GPL-2.0
-PREFIX		?= /usr
-DESTDIR		?=
+#
+# Copyright (c) 2013, Intel Corporation.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+# Authors:
+#	 Todd Brandt <todd.e.brandt@linux.intel.com>
+
+# Prefix to the directories we're installing to
+DESTDIR ?=
+
+# Directory definitions. These are default and most probably
+# do not need to be changed. Please note that DESTDIR is
+# added in front of any of them
+
+BINDIR ?=	/usr/bin
+MANDIR ?=	/usr/share/man
+LIBDIR ?=	/usr/lib
+
+# Toolchain: what tools do we use, and what options do they need:
+INSTALL = /usr/bin/install
+INSTALL_DATA  = ${INSTALL} -m 644
 
 all:
 	@echo "Nothing to build"
 
 install : uninstall
-	install -d  $(DESTDIR)$(PREFIX)/lib/pm-graph
-	install sleepgraph.py $(DESTDIR)$(PREFIX)/lib/pm-graph
-	install bootgraph.py $(DESTDIR)$(PREFIX)/lib/pm-graph
-	install -d  $(DESTDIR)$(PREFIX)/lib/pm-graph/config
-	install -m 644 config/cgskip.txt $(DESTDIR)$(PREFIX)/lib/pm-graph/config
-	install -m 644 config/freeze-callgraph.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
-	install -m 644 config/freeze.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
-	install -m 644 config/freeze-dev.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
-	install -m 644 config/standby-callgraph.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
-	install -m 644 config/standby.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
-	install -m 644 config/standby-dev.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
-	install -m 644 config/suspend-callgraph.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
-	install -m 644 config/suspend.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
-	install -m 644 config/suspend-dev.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
-	install -m 644 config/suspend-x2-proc.cfg $(DESTDIR)$(PREFIX)/lib/pm-graph/config
-
-	install -d  $(DESTDIR)$(PREFIX)/bin
-	ln -s ../lib/pm-graph/bootgraph.py $(DESTDIR)$(PREFIX)/bin/bootgraph
-	ln -s ../lib/pm-graph/sleepgraph.py $(DESTDIR)$(PREFIX)/bin/sleepgraph
-
-	install -d  $(DESTDIR)$(PREFIX)/share/man/man8
-	install bootgraph.8 $(DESTDIR)$(PREFIX)/share/man/man8
-	install sleepgraph.8 $(DESTDIR)$(PREFIX)/share/man/man8
+	$(INSTALL) -d  $(DESTDIR)$(LIBDIR)/pm-graph
+	$(INSTALL) sleepgraph.py $(DESTDIR)$(LIBDIR)/pm-graph
+	$(INSTALL) bootgraph.py $(DESTDIR)$(LIBDIR)/pm-graph
+	$(INSTALL) -d  $(DESTDIR)$(LIBDIR)/pm-graph/config
+	$(INSTALL_DATA) config/cgskip.txt $(DESTDIR)$(LIBDIR)/pm-graph/config
+	$(INSTALL_DATA) config/freeze-callgraph.cfg $(DESTDIR)$(LIBDIR)/pm-graph/config
+	$(INSTALL_DATA) config/freeze.cfg $(DESTDIR)$(LIBDIR)/pm-graph/config
+	$(INSTALL_DATA) config/freeze-dev.cfg $(DESTDIR)$(LIBDIR)/pm-graph/config
+	$(INSTALL_DATA) config/standby-callgraph.cfg $(DESTDIR)$(LIBDIR)/pm-graph/config
+	$(INSTALL_DATA) config/standby.cfg $(DESTDIR)$(LIBDIR)/pm-graph/config
+	$(INSTALL_DATA) config/standby-dev.cfg $(DESTDIR)$(LIBDIR)/pm-graph/config
+	$(INSTALL_DATA) config/suspend-callgraph.cfg $(DESTDIR)$(LIBDIR)/pm-graph/config
+	$(INSTALL_DATA) config/suspend.cfg $(DESTDIR)$(LIBDIR)/pm-graph/config
+	$(INSTALL_DATA) config/suspend-dev.cfg $(DESTDIR)$(LIBDIR)/pm-graph/config
+	$(INSTALL_DATA) config/suspend-x2-proc.cfg $(DESTDIR)$(LIBDIR)/pm-graph/config
+
+	$(INSTALL) -d  $(DESTDIR)$(BINDIR)
+	ln -s ../lib/pm-graph/bootgraph.py $(DESTDIR)$(BINDIR)/bootgraph
+	ln -s ../lib/pm-graph/sleepgraph.py $(DESTDIR)$(BINDIR)/sleepgraph
+
+	$(INSTALL) -d  $(DESTDIR)$(MANDIR)/man8
+	$(INSTALL) bootgraph.8 $(DESTDIR)$(MANDIR)/man8
+	$(INSTALL) sleepgraph.8 $(DESTDIR)$(MANDIR)/man8
 
 uninstall :
-	rm -f $(DESTDIR)$(PREFIX)/share/man/man8/bootgraph.8
-	rm -f $(DESTDIR)$(PREFIX)/share/man/man8/sleepgraph.8
+	rm -f $(DESTDIR)$(MANDIR)/man8/bootgraph.8
+	rm -f $(DESTDIR)$(MANDIR)/man8/sleepgraph.8
 
-	rm -f $(DESTDIR)$(PREFIX)/bin/bootgraph
-	rm -f $(DESTDIR)$(PREFIX)/bin/sleepgraph
+	rm -f $(DESTDIR)$(BINDIR)/bootgraph
+	rm -f $(DESTDIR)$(BINDIR)/sleepgraph
 
-	rm -f $(DESTDIR)$(PREFIX)/lib/pm-graph/config/*
-	if [ -d $(DESTDIR)$(PREFIX)/lib/pm-graph/config ] ; then \
-		rmdir $(DESTDIR)$(PREFIX)/lib/pm-graph/config; \
+	rm -f $(DESTDIR)$(LIBDIR)/pm-graph/config/*
+	if [ -d $(DESTDIR)$(LIBDIR)/pm-graph/config ] ; then \
+		rmdir $(DESTDIR)$(LIBDIR)/pm-graph/config; \
 	fi;
-	rm -f $(DESTDIR)$(PREFIX)/lib/pm-graph/__pycache__/*
-	if [ -d $(DESTDIR)$(PREFIX)/lib/pm-graph/__pycache__ ] ; then \
-		rmdir $(DESTDIR)$(PREFIX)/lib/pm-graph/__pycache__; \
+	rm -f $(DESTDIR)$(LIBDIR)/pm-graph/__pycache__/*
+	if [ -d $(DESTDIR)$(LIBDIR)/pm-graph/__pycache__ ] ; then \
+		rmdir $(DESTDIR)$(LIBDIR)/pm-graph/__pycache__; \
 	fi;
-	rm -f $(DESTDIR)$(PREFIX)/lib/pm-graph/*
-	if [ -d $(DESTDIR)$(PREFIX)/lib/pm-graph ] ; then \
-		rmdir $(DESTDIR)$(PREFIX)/lib/pm-graph; \
+	rm -f $(DESTDIR)$(LIBDIR)/pm-graph/*
+	if [ -d $(DESTDIR)$(LIBDIR)/pm-graph ] ; then \
+		rmdir $(DESTDIR)$(LIBDIR)/pm-graph; \
 	fi;
+
+help:
+	@echo  'Building targets:'
+	@echo  '  all		  - Nothing to build'
+	@echo  '  install	  - Install the program and create necessary directories'
+	@echo  '  uninstall	  - Remove installed files and directories'
+
+.PHONY: all install uninstall help
-- 
2.25.1

