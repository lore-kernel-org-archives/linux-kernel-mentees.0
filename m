Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A215EB64DC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Jul 2023 19:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECA3382B08;
	Fri, 14 Jul 2023 19:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECA3382B08
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kdFj+D5d
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWpLdHwIuznJ; Fri, 14 Jul 2023 19:46:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DBF8E827D9;
	Fri, 14 Jul 2023 19:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBF8E827D9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBCB9C0071;
	Fri, 14 Jul 2023 19:46:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6703BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 19:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E5A960BD9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 19:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E5A960BD9
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=kdFj+D5d
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3OKxYnL08GuN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 19:46:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E05160A87
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E05160A87
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 19:46:44 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf107so21342655e9.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 12:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689364003; x=1691956003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L/XBx+rOW69bTWn7J4y9AfvlrihBcp26V+F+JjCNTmg=;
 b=kdFj+D5dalQPcdbLkQsLpOi5jgUk6B/bsslpNbf+Hgj1cYzoAGJjW+jZoFfqB2axwf
 ztSpaLxI9AkQsOH10pfV2nJ/bakeAkz1Q+UkO0qSyctgeemiBjRDEvaTuVZZCjl0Uysg
 qxPhz6qDXiWoRv1xtISlCQkKcde1LQWkuFBDiwL8K5Sgdy+LO5DFDNGL6RKoyVM+V6fM
 SV48A0cqghuM4QTdXOrVLS9s/rmq3aPkafrWcVLcW9PIl1yHO4tmvXvwXvYQTl9frXZV
 jRuYtydLqWYfydR/nEcrffBV2YhDTGll6e+xs01YnvdwlF4B0x6uNLnTj/BEPlms78fP
 dxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689364003; x=1691956003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L/XBx+rOW69bTWn7J4y9AfvlrihBcp26V+F+JjCNTmg=;
 b=DY2GQaIk735NOBi+gX0CbY4m2vJ5SXWTAcnf1TO0fSshUnH482A/2hva6AmyNuYw3h
 iNyaXWmU4bqazRaTPBejf1a1jya+IlAtneMp7BYk2GO09Xevt7QaKcBNSOY0XyqxZ24R
 dp5R7lacVnTV2P6wf1W2/tK46TQZiJJ2WS6Usoro4xF0xLNewqdJlzmd52/0m6LoBRhm
 tf73glNarddvVGxwPCyCXxu2CuO34VI3NNHZopa0Cckf/Cht8w10UQ9obND0YhpUzm1t
 RlDofefzvY4GhgzziFj2cXn4Yakh/rf5nGwSyC8wLbGLl062835Yk59/x47rLi7Wwoqo
 dWNw==
X-Gm-Message-State: ABy/qLa/1wUB847VBY5ytJzkDXL9yrsQurbbed+dSCnc14hgI1YGOJuI
 0DbqhJLWGRO8Bv+NxCSpu/E=
X-Google-Smtp-Source: APBJJlE6CdAINDs5rFAFfEZ7pFwcVuW8Xt+8zXg44DU7BmOmKcYfSd1HDyIncHQIQaarhvpLLQwm3g==
X-Received: by 2002:a7b:c414:0:b0:3fb:424b:ef6f with SMTP id
 k20-20020a7bc414000000b003fb424bef6fmr4519454wmi.23.1689364002604; 
 Fri, 14 Jul 2023 12:46:42 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx..
 ([2001:8f8:1163:535c:552f:1d2:678e:5d15])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a1cf709000000b003fc00892c13sm2067125wmh.35.2023.07.14.12.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 12:46:42 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: shuah@kernel.org
Subject: [PATCH v1] selftests/net: replace manual array size calc with
 ARRAYSIZE macro.
Date: Fri, 14 Jul 2023 23:46:35 +0400
Message-Id: <20230714194635.1779496-1-mahmoudmatook.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, linux-kselftest@vger.kernel.org,
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

changelog since v0:
 - update net/Makefile to include kselftest.h
 - remove redefinition of ARRAYSIZE.

Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
---
 tools/testing/selftests/net/Makefile          | 2 ++
 tools/testing/selftests/net/csum.c            | 6 ++----
 tools/testing/selftests/net/hwtstamp_config.c | 5 ++---
 3 files changed, 6 insertions(+), 7 deletions(-)

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
index 702f34a9d506..90eb06fefa59 100644
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
@@ -123,10 +125,6 @@ static struct sockaddr_in6 cfg_saddr6 = {.sin6_family = AF_INET6};
 #define MAX_HEADER_LEN	(sizeof(struct ipv6hdr) + ENC_HEADER_LEN + sizeof(struct tcphdr))
 #define MAX_PAYLOAD_LEN 1024
 
-#ifndef ARRAY_SIZE
-#define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
-#endif
-
 /* Trivial demo encap. Stand-in for transport layer protocols like ESP or PSP */
 struct udp_encap_hdr {
 	uint8_t nexthdr;
diff --git a/tools/testing/selftests/net/hwtstamp_config.c b/tools/testing/selftests/net/hwtstamp_config.c
index 263cc1c34165..873f4937f37f 100644
--- a/tools/testing/selftests/net/hwtstamp_config.c
+++ b/tools/testing/selftests/net/hwtstamp_config.c
@@ -16,9 +16,8 @@
 #include <linux/net_tstamp.h>
 #include <linux/sockios.h>
 
-#ifndef ARRAY_SIZE
-#define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
-#endif
+#include "kselftest.h"
+
 
 static int
 lookup_value(const char **names, int size, const char *name)
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
