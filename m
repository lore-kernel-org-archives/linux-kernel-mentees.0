Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92B4C6FA8F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Aug 2023 21:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 743D341DB1;
	Thu, 24 Aug 2023 21:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 743D341DB1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Xh2TifXL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 34i1qPvqQO9t; Thu, 24 Aug 2023 21:46:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F2BC141DAF;
	Thu, 24 Aug 2023 21:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2BC141DAF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB6BBC0088;
	Thu, 24 Aug 2023 21:46:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2CE6C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 21:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBAD741DAF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 21:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBAD741DAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKrGKGi_MzKd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 21:46:15 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C83A41DB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 21:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C83A41DB2
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31aeedbb264so229919f8f.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692913573; x=1693518373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jv0lTM8uBfeXOWvVVDcJ9oeJdudwiBMRLvDZHlkmsvI=;
 b=Xh2TifXLZP3ohpVEGhT70uCm9sh5Dp09MSPFBJHFCZBljrO//yagZ86xpY1R/VWylm
 Q77iSRZCYMqB+15GXTI04v0fSC4cO5nmPnlm3IxCZBm3AUbq0UTbYwzBM7aD0jiuM2B7
 Q5yq99hxksg3/sFBUScm1MqI+Fc6l7MQuBpYB7x0kG2f70UaHDR6etJbtJVjmgoFoRRg
 7hGVzBmrgcgDjEOIjhBnuLhYEw8nAtXGTz0uyaS8l8voQxHtjYB3UzoGZPe39VRbzaqe
 WKntVKF91+r/YeAQVdLtC+Zif7SQ56B7Nli4KGT8aIf6mpkknVt8RBiJUfFHvs8EGopP
 xFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692913573; x=1693518373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jv0lTM8uBfeXOWvVVDcJ9oeJdudwiBMRLvDZHlkmsvI=;
 b=cwE924BoTlZxkCR82On9F1IKNn1bJXuJSVxF5GeXLzl9oteLhbqw/mNWKCMCHfcr4P
 BEdVN1tfKhC8+86+t8PAx+4zlL3lTEbWeV09bKCEFU3Wo88VpQfuzOg8qqOIxSzMs5gu
 A60mAjfMjrmtZ7XKfH91v85XxZptD5w1DsmottRzGmoG4+JIIwFRj1zhf+OncEe3gpk/
 dPj1MXmVEtje02vvAAuVk3rwF0mVYELcYXr7QACaU3AHBCB3mETfo/JpHLJYFeBFC6E8
 as3Y1Gak3DO+Pzmp/w+Ewr+avrXEyZnOdBrl1+/JlPvwdc8W2+I4U5R6wa3PdxFkxc9u
 eehA==
X-Gm-Message-State: AOJu0YyyZP258aYtu7kbIMp45EEC0Jh3ELoSKnua3vl2koB1T+Uxq6WN
 /Eqe0CeU+4Uv2S+Vkm8xTWM=
X-Google-Smtp-Source: AGHT+IGOq7LhO2o9APNZsg1ZRPsWtMxB5dNzwCQLvXzw/uDaa++M4H/gTJgHhCYpUy1DwWOUWPLFCQ==
X-Received: by 2002:a5d:494c:0:b0:317:5e5e:60e0 with SMTP id
 r12-20020a5d494c000000b003175e5e60e0mr11771129wrs.28.1692913573343; 
 Thu, 24 Aug 2023 14:46:13 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx..
 ([2001:8f8:1163:806e:f960:7197:6afd:b6ed])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a5d4101000000b0031c6ae19e27sm278550wrp.99.2023.08.24.14.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 14:46:12 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: davem@davemloft.net, keescook@chromium.org, luto@amacapital.net,
 netdev@vger.kernel.org, pabeni@redhat.com, willemdebruijn.kernel@gmail.com,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, wad@chromium.org,
 kuba@kernel.org, edumazet@google.com, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] selftests/net: replace ternary operator with
 min()/max()
Date: Fri, 25 Aug 2023 01:45:06 +0400
Message-Id: <20230824214506.137505-2-mahmoudmatook.mm@gmail.com>
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

Fix the following coccicheck warning:
tools/testing/selftests/net/udpgso_bench_tx.c:297:18-19: WARNING opportunity for min()
tools/testing/selftests/net/udpgso_bench_tx.c:354:27-28: WARNING opportunity for min()
tools/testing/selftests/net/so_txtime.c:129:24-26: WARNING opportunity for max()
tools/testing/selftests/net/so_txtime.c:96:30-31: WARNING opportunity for max()

Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
---
changes in v3:
remove Suggested-by tag
fix wrong comment inside selftests/net/Makefile

changes in v2:
cast var cfg_mss to int to avoid static assertion
after providing a stricter version of min() that does signedness checking.
---
 tools/testing/selftests/net/Makefile          | 2 ++
 tools/testing/selftests/net/so_txtime.c       | 7 ++++---
 tools/testing/selftests/net/udpgso_bench_tx.c | 6 +++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 7f3ab2a93ed6..f50f04a513a7 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -3,6 +3,8 @@
 
 CFLAGS =  -Wall -Wl,--no-as-needed -O2 -g
 CFLAGS += -I../../../../usr/include/ $(KHDR_INCLUDES)
+# Additional include path to include kselftest.h
+CFLAGS += -I../
 
 TEST_PROGS := run_netsocktests run_afpackettests test_bpf.sh netdevice.sh \
 	      rtnetlink.sh xfrm_policy.sh test_blackhole_dev.sh
diff --git a/tools/testing/selftests/net/so_txtime.c b/tools/testing/selftests/net/so_txtime.c
index 2672ac0b6d1f..2936174e7de4 100644
--- a/tools/testing/selftests/net/so_txtime.c
+++ b/tools/testing/selftests/net/so_txtime.c
@@ -33,6 +33,8 @@
 #include <unistd.h>
 #include <poll.h>
 
+#include "kselftest.h"
+
 static int	cfg_clockid	= CLOCK_TAI;
 static uint16_t	cfg_port	= 8000;
 static int	cfg_variance_us	= 4000;
@@ -93,8 +95,7 @@ static void do_send_one(int fdt, struct timed_send *ts)
 		msg.msg_controllen = sizeof(control);
 
 		tdeliver = glob_tstart + ts->delay_us * 1000;
-		tdeliver_max = tdeliver_max > tdeliver ?
-			       tdeliver_max : tdeliver;
+		tdeliver_max = max(tdeliver_max, tdeliver);
 
 		cm = CMSG_FIRSTHDR(&msg);
 		cm->cmsg_level = SOL_SOCKET;
@@ -126,7 +127,7 @@ static void do_recv_one(int fdr, struct timed_send *ts)
 		error(1, 0, "read: %dB", ret);
 
 	tstop = (gettime_ns(cfg_clockid) - glob_tstart) / 1000;
-	texpect = ts->delay_us >= 0 ? ts->delay_us : 0;
+	texpect = max(ts->delay_us, 0);
 
 	fprintf(stderr, "payload:%c delay:%lld expected:%lld (us)\n",
 			rbuf[0], (long long)tstop, (long long)texpect);
diff --git a/tools/testing/selftests/net/udpgso_bench_tx.c b/tools/testing/selftests/net/udpgso_bench_tx.c
index 477392715a9a..6bd32a312901 100644
--- a/tools/testing/selftests/net/udpgso_bench_tx.c
+++ b/tools/testing/selftests/net/udpgso_bench_tx.c
@@ -25,7 +25,7 @@
 #include <sys/types.h>
 #include <unistd.h>
 
-#include "../kselftest.h"
+#include "kselftest.h"
 
 #ifndef ETH_MAX_MTU
 #define ETH_MAX_MTU 0xFFFFU
@@ -294,7 +294,7 @@ static int send_udp(int fd, char *data)
 	total_len = cfg_payload_len;
 
 	while (total_len) {
-		len = total_len < cfg_mss ? total_len : cfg_mss;
+		len = min(total_len, (int)cfg_mss);
 
 		ret = sendto(fd, data, len, cfg_zerocopy ? MSG_ZEROCOPY : 0,
 			     cfg_connected ? NULL : (void *)&cfg_dst_addr,
@@ -351,7 +351,7 @@ static int send_udp_sendmmsg(int fd, char *data)
 			error(1, 0, "sendmmsg: exceeds max_nr_msg");
 
 		iov[i].iov_base = data + off;
-		iov[i].iov_len = cfg_mss < left ? cfg_mss : left;
+		iov[i].iov_len = min(cfg_mss, left);
 
 		mmsgs[i].msg_hdr.msg_iov = iov + i;
 		mmsgs[i].msg_hdr.msg_iovlen = 1;
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
