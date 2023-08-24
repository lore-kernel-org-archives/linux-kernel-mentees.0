Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E6AC27C40
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Aug 2023 20:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79A4341C62;
	Thu, 24 Aug 2023 20:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A4341C62
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=p9ESrZp7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O9YTW_3cNmEj; Thu, 24 Aug 2023 20:26:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 189CE40EC1;
	Thu, 24 Aug 2023 20:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 189CE40EC1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9D97C0071;
	Thu, 24 Aug 2023 20:25:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5FC2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 20:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEBE583963
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 20:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEBE583963
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=p9ESrZp7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fswghpt91eqC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 20:25:55 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B097683934
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 20:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B097683934
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31c615eb6feso138294f8f.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Aug 2023 13:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692908753; x=1693513553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BSwlyHxagWvlq7wv+/QmpMx6Hn8ySgsLpysR6zi7jgU=;
 b=p9ESrZp7gQV0drD3U0uv6540fluT+uTtEKOLuzZW37x+BJli6WA43KW9KzIwZTUNbp
 TGlr+FWzSUhr7C3YWxo5HV2HuTopulboabEfjqXBJW1ZsjSb1xWPffdhh9KFT7HiI/9E
 ACTRhKnlCflwhb+fsKXE39pkUT/UOR6AvNhVfV4pVc5a5LCa/mgquazXvIBFu91yQXlc
 +pBs/El/RnNjFb5+rIvFIdgcLjRj6p4iKxaHmTOk/WOwzMuyATNqkF9vxDO0JOuN8Xsu
 CdSPSt0YA9W1Pcqwpuf9SZxKgd8CZPJ3CGJiCUmVEWvqoNj4mHp0CjzWhJ/5IoC2Ehdg
 D/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692908753; x=1693513553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BSwlyHxagWvlq7wv+/QmpMx6Hn8ySgsLpysR6zi7jgU=;
 b=ia0o6xnKMZ3o45Uq66W++Qoe+rKH0YoEi99fbjuUoNaEpCyMsMprmzIRKktvgsP6DS
 bfAR4UA9vJwmz+0qTTJNhGuULCt6TzJwIVjIra4n1m4M/Nw86hpT+M/fL/Wunw9sAI4M
 6PaoB2nHAgYThG4kJgN/TIiYhCm2w0Wpk/vaJ3FL6q3NOwRGfxjShPObJ6qJpnDubVqu
 YSZVFzkmliUB5WHuCYCbdlshCsvMzRYS3PPEuSEPrEmLoWtUivuRNnsid4H/pzc7sW2T
 3lKdTF8xrEha2GnLMK59zdCJz/SSmov4XpbH3/bvLUem8LZWMswWj5SuloNGC4QXx2l2
 LufQ==
X-Gm-Message-State: AOJu0YwXdlyx87cfWBdMlZ3KCjUWidZRUdsmPq7UcKNOd8/lBHpk5fKg
 vnkzJ9n7rkVdZG4orvS+3tc=
X-Google-Smtp-Source: AGHT+IGkwDoDovxr7bTL5Guk5NyoCW+s1SVG8bTybEhihMR7S1bmwaDgeg3Kd3ld0agb8d6I40PJfQ==
X-Received: by 2002:adf:dcce:0:b0:317:5b76:826 with SMTP id
 x14-20020adfdcce000000b003175b760826mr12597431wrm.0.1692908753624; 
 Thu, 24 Aug 2023 13:25:53 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx..
 ([2001:8f8:1163:806e:f960:7197:6afd:b6ed])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a5d5405000000b0031435731dfasm150416wrv.35.2023.08.24.13.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 13:25:53 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: keescook@chromium.org, edumazet@google.com,
 willemdebruijn.kernel@gmail.com, wad@chromium.org, luto@amacapital.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 shuah@kernel.org, pabeni@redhat.com, linux-kselftest@vger.kernel.org,
 davem@davemloft.net
Subject: [PATCH v2 2/2] selftests/net: replace ternary operator with
 min()/max()
Date: Fri, 25 Aug 2023 00:24:15 +0400
Message-Id: <20230824202415.131824-2-mahmoudmatook.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230824202415.131824-1-mahmoudmatook.mm@gmail.com>
References: <20230824202415.131824-1-mahmoudmatook.mm@gmail.com>
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
Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
---
changes in v2:
cast var cfg_mss to int to avoid static assertion
after providing a stricter version of min() that does signedness checking.
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
