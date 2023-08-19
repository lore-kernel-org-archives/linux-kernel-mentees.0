Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F0DEE49A3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Aug 2023 19:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F343E831D5;
	Sat, 19 Aug 2023 19:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F343E831D5
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ermcIWZ7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VO2VwdV7Vg5s; Sat, 19 Aug 2023 19:50:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BCFDE8210E;
	Sat, 19 Aug 2023 19:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCFDE8210E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9DD2EC0039;
	Sat, 19 Aug 2023 19:50:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76F0CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 19:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44A9C832EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 19:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44A9C832EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yFnscNDqeoH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 19:50:46 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 451108210E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 19:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 451108210E
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fe4cdb72b9so19145475e9.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 12:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692474644; x=1693079444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ed1L9DO87oWFUUO+hp/1iqQshAPP0RxGE8TIKJiSCVI=;
 b=ermcIWZ7aKo/ZIQrmHAtx9i82fs+DGo+8+rdar7aCA9iNpKRHZC6bf3Y1UMuhhDvhS
 OEKlPDS4iwOpeE9WRZsgadEkAS6l1oBb1Fy4SiSBf6HhaOpulUf6WBqmZ/8BEHVvqfgo
 CUdqJpfieU5a7o2IEywBAfO4WGusMddJDGeDfDZwTtUiiHmgj8mnCfDuDrLiysMNpZL2
 m9yjNFdpr/zpEBe6EQOQ3foIV1FnqSfEYUo85ZAr3kW8PuPxKIcdZw8HV8jVyzfTDG5u
 Qu5VseudUycp3ygf1mQq69cHeP1r9AeHw6Mh+qyXwVlcpcWiZqoKU93/hjCG4o/B5vba
 k2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692474644; x=1693079444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ed1L9DO87oWFUUO+hp/1iqQshAPP0RxGE8TIKJiSCVI=;
 b=gRncvC3wZCFA0D64Wm/Y6BuCKGt6TdzZffg28Fg3uAllyrIRv1OeqV5OTiiJshZrnP
 YRGIuwITEJ+vHsDQLzyMmkv0e1Piw0ZZ4pRYdvc9oVVrN/ZvVM+vGxOTuW2XwO6wkqV3
 1CFcPYMFGCT7pRivkPA+CRQXedA++mm++VmBjH66cf9+si/5iWOwfrohE/f7eZf8dEER
 oi1y6yq5qY197VYfKP8v1yBl4KdQpgWgyVXL7OYV7V+y02BFVuLT1OMGly6SKhIEZkmz
 7/Y5GMgLkj+WTajkozvYAHLwAzUkFtqRxSiRn+Eet7w47LfuDP7B0ozqMYfvqOLL+ScJ
 FANw==
X-Gm-Message-State: AOJu0YyH0Fs/rZ1Bj+PpfaZtZD0n+pqfCaUOFRBw0oYXGy/PspDDjBt8
 EB8F/MtPJ+aigN5ker0m0WI=
X-Google-Smtp-Source: AGHT+IGGsfzB1e+jD2yQqE1ZxZhkWAdlFaDNtEQytVeoXH1m7gO9tnE8fsk5i7jvoJSe14A7P6Fkdg==
X-Received: by 2002:a7b:c8d0:0:b0:3fc:7d2:e0c0 with SMTP id
 f16-20020a7bc8d0000000b003fc07d2e0c0mr1819335wml.27.1692474644304; 
 Sat, 19 Aug 2023 12:50:44 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx.. ([5.194.84.172])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a1c7913000000b003fe26bf65e7sm6861382wme.13.2023.08.19.12.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Aug 2023 12:50:43 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, willemdebruijn.kernel@gmail.com,
 davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
 shuah@kernel.org
Subject: [PATCH 2/2] selftests/net: replace ternary operator with min()/max()
Date: Sat, 19 Aug 2023 23:50:05 +0400
Message-Id: <20230819195005.99387-3-mahmoudmatook.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230819195005.99387-1-mahmoudmatook.mm@gmail.com>
References: <20230819195005.99387-1-mahmoudmatook.mm@gmail.com>
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
 tools/testing/selftests/net/Makefile          | 2 ++
 tools/testing/selftests/net/so_txtime.c       | 7 ++++---
 tools/testing/selftests/net/udpgso_bench_tx.c | 6 +++---
 3 files changed, 9 insertions(+), 6 deletions(-)

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
index 477392715a9a..e92a7a753959 100644
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
+		len = min(total_len, cfg_mss);
 
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
