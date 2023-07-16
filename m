Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F6EC001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Jul 2023 18:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A8F04013C;
	Sun, 16 Jul 2023 18:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A8F04013C
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HeTYsvuj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gmrP54UtPOoI; Sun, 16 Jul 2023 18:44:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2D2644013B;
	Sun, 16 Jul 2023 18:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D2644013B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 136B7C0072;
	Sun, 16 Jul 2023 18:44:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 217CDC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 18:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E963E4023B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 18:44:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E963E4023B
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=HeTYsvuj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFLANBDly1um
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 18:44:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB69740230
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB69740230
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 18:44:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3143b72c5ffso3940385f8f.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 11:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689533050; x=1692125050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Iw9rxMmy489xUbQwxOXNVFRR34rAPTUVmC3dh4HsQWw=;
 b=HeTYsvujwYrQwwXDp0WMfX5PfsFlIaj6iOyQIXfhYDOXQFOXAymdjg45DuXKHpZVdJ
 T0aeNJd7Ukr89zC6YK00llwOXwwMwhYEvmhru6R/6shzkJ+Ukd7y+DIIZvnwnJX/J3I3
 lzlwAHp1rxIOasiaWGaNKZtkhzOFqAEO4USZ5UpVmpIrBKJ++StYna4dQjao6RT3DY3z
 jZ030yFpCTFSV/R5E2TwYhm4lrnd2utaZEcbhOPlI0c0I6IGQyGLT7QllT2zMfiqmACc
 W8IWNxCpZmfjezbzCziIQLwUl1CWTwNc0IUxRR7LEYPdb+MZJkH+B+Unu+t4e3s6mEOc
 FsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689533050; x=1692125050;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iw9rxMmy489xUbQwxOXNVFRR34rAPTUVmC3dh4HsQWw=;
 b=JucRn+xS49+P5LN/nzZ32iSpMboBN+695axOjUBVNrG+ZRVYgUh9tJcRxfWYcK4o6K
 fk57P4K0RQEiCanjnGKUvV2hK2scfuqxh1ZvxEL0+4pzQOlDQEtlL9dq4Vk3hGz3jsJf
 TsZnkHDDtPZXgCUEtujcUhnGK2S23yyjdHDIkQqhxonBiIAXk11lYkA1c+MD/lqN0Vu5
 uI3/uHzmfxe89OdPGjm2u/rrQJj1uWKkIPGUZWABxjP8vQ8U4KTUi93vEjXpuUCvvV3q
 LYKmbAAXJ/hX0iqI78tMguHvFX9cstPDUh9CpHq2JU2MpaczY7II8wyj9UPcZ5qQqi2C
 trdA==
X-Gm-Message-State: ABy/qLZWnYxl94vle3Di9EpITVSBquNl5swvdfWdfl5FYCIgmLRzQkIN
 CtBx/9RZxYM3PbGvJp0USjA=
X-Google-Smtp-Source: APBJJlGqrk4/ImODOjlE2fM0n8aEqgTPPtq8oeBjobvCf+cVue7GW3rAT7MupfI6Rwb2vIto6QFSbw==
X-Received: by 2002:adf:ffd2:0:b0:313:eb81:d2f6 with SMTP id
 x18-20020adfffd2000000b00313eb81d2f6mr11309115wrs.4.1689533049498; 
 Sun, 16 Jul 2023 11:44:09 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx..
 ([2001:8f8:1163:535c:e1af:2d96:1960:a57d])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c214700b003fbc681c8d1sm6212956wml.36.2023.07.16.11.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jul 2023 11:44:08 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] selftests/net: replace manual array size calc with
 ARRAYSIZE macro.
Date: Sun, 16 Jul 2023 22:43:49 +0400
Message-Id: <20230716184349.2124858-1-mahmoudmatook.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

fixes coccinelle WARNING: Use ARRAY_SIZE

Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
---
changelog since v3:
 - move changelog outside commit message.

changelog since v2:
 - integrat a commit that contains actual replacement for ARRAY_SIZE.
 - use ARRAY_SIZE for net/psock_lib.h

changelog since v1:
 - remove unnecessary extra new line

changelog since v0:
 - update net/Makefile to include kselftest.h
 - remove redefinition of ARRAYSIZE.
---
 tools/testing/selftests/net/Makefile          | 2 ++
 tools/testing/selftests/net/csum.c            | 6 ++++--
 tools/testing/selftests/net/hwtstamp_config.c | 6 ++++--
 tools/testing/selftests/net/psock_lib.h       | 4 +++-
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 7f3ab2a93ed6..a06cc25489f9 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -3,6 +3,8 @@
 
 CFLAGS =  -Wall -Wl,--no-as-needed -O2 -g
 CFLAGS += -I../../../../usr/include/ $(KHDR_INCLUDES)
+# Additional include paths needed by kselftest.h
+CFLAGS += -I../
 
 TEST_PROGS := run_netsocktests run_afpackettests test_bpf.sh netdevice.sh \
 	      rtnetlink.sh xfrm_policy.sh test_blackhole_dev.sh
diff --git a/tools/testing/selftests/net/csum.c b/tools/testing/selftests/net/csum.c
index 82a1c1839da6..90eb06fefa59 100644
--- a/tools/testing/selftests/net/csum.c
+++ b/tools/testing/selftests/net/csum.c
@@ -91,6 +91,8 @@
 #include <sys/types.h>
 #include <unistd.h>
 
+#include "kselftest.h"
+
 static bool cfg_bad_csum;
 static int cfg_family = PF_INET6;
 static int cfg_num_pkt = 4;
@@ -450,7 +452,7 @@ static void send_packet(int fd, const char *buf, int len)
 	iov[2].iov_len = len;
 
 	msg.msg_iov = iov;
-	msg.msg_iovlen = sizeof(iov) / sizeof(iov[0]);
+	msg.msg_iovlen = ARRAY_SIZE(iov);
 
 	msg.msg_name = &addr;
 	msg.msg_namelen = sizeof(addr);
@@ -505,7 +507,7 @@ static void __recv_prepare_packet_filter(int fd, int off_nexthdr, int off_dport)
 	struct sock_fprog prog = {};
 
 	prog.filter = filter;
-	prog.len = sizeof(filter) / sizeof(struct sock_filter);
+	prog.len = ARRAY_SIZE(filter);
 	if (setsockopt(fd, SOL_SOCKET, SO_ATTACH_FILTER, &prog, sizeof(prog)))
 		error(1, errno, "setsockopt filter");
 }
diff --git a/tools/testing/selftests/net/hwtstamp_config.c b/tools/testing/selftests/net/hwtstamp_config.c
index e1fdee841021..170728c96c46 100644
--- a/tools/testing/selftests/net/hwtstamp_config.c
+++ b/tools/testing/selftests/net/hwtstamp_config.c
@@ -16,6 +16,8 @@
 #include <linux/net_tstamp.h>
 #include <linux/sockios.h>
 
+#include "kselftest.h"
+
 static int
 lookup_value(const char **names, int size, const char *name)
 {
@@ -50,7 +52,7 @@ static const char *tx_types[] = {
 	TX_TYPE(ONESTEP_SYNC)
 #undef TX_TYPE
 };
-#define N_TX_TYPES ((int)(sizeof(tx_types) / sizeof(tx_types[0])))
+#define N_TX_TYPES ((int)(ARRAY_SIZE(tx_types)))
 
 static const char *rx_filters[] = {
 #define RX_FILTER(name) [HWTSTAMP_FILTER_ ## name] = #name
@@ -71,7 +73,7 @@ static const char *rx_filters[] = {
 	RX_FILTER(PTP_V2_DELAY_REQ),
 #undef RX_FILTER
 };
-#define N_RX_FILTERS ((int)(sizeof(rx_filters) / sizeof(rx_filters[0])))
+#define N_RX_FILTERS ((int)(ARRAY_SIZE(rx_filters)))
 
 static void usage(void)
 {
diff --git a/tools/testing/selftests/net/psock_lib.h b/tools/testing/selftests/net/psock_lib.h
index faa884385c45..6e4fef560873 100644
--- a/tools/testing/selftests/net/psock_lib.h
+++ b/tools/testing/selftests/net/psock_lib.h
@@ -14,6 +14,8 @@
 #include <arpa/inet.h>
 #include <unistd.h>
 
+#include "kselftest.h"
+
 #define DATA_LEN			100
 #define DATA_CHAR			'a'
 #define DATA_CHAR_1			'b'
@@ -63,7 +65,7 @@ static __maybe_unused void pair_udp_setfilter(int fd)
 	struct sock_fprog bpf_prog;
 
 	bpf_prog.filter = bpf_filter;
-	bpf_prog.len = sizeof(bpf_filter) / sizeof(struct sock_filter);
+	bpf_prog.len = ARRAY_SIZE(bpf_filter);
 
 	if (setsockopt(fd, SOL_SOCKET, SO_ATTACH_FILTER, &bpf_prog,
 		       sizeof(bpf_prog))) {
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
