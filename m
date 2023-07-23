Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32535C001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Jul 2023 09:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B263560AB2;
	Sun, 23 Jul 2023 09:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B263560AB2
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FYJY+Bnu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQedk1FgIv3g; Sun, 23 Jul 2023 09:38:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CC716607AA;
	Sun, 23 Jul 2023 09:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC716607AA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6EAAC0071;
	Sun, 23 Jul 2023 09:38:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE2E4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 09:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 98DE581842
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 09:38:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98DE581842
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FYJY+Bnu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTR7bBcjUWCn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 09:38:38 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD11A817A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 09:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD11A817A9
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso2447780f8f.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 02:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690105116; x=1690709916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oxNqVJ8M0RlStNJiqmdGBEdZEF6FgJ1pvu+FzFr7WF0=;
 b=FYJY+Bnur9aWsu4JUe2QcktPfX1ZzMT7ckqyKMJjd1FsziSSoGOxn7tMu0APZfH0Yc
 LqMCRiBaRJGPUuoJiWt9BOQdwz7fEHapRbLkQIpw9dq8bvJI03LVa80Ir8R2KCnnbGPi
 Gqs78Hc9HX2pHoStqBZHbnRRoYAbMLukkM88Bz+++peQC5xRWxYWZUGwXIVZHdIjzUip
 emvyfzWkkIuArKz7ae6X1L0xZ7+fHpiJi8Nc0hEApqibuoXtE5NhGJ6ZBiUOGNSoBDTs
 jjaVXyenoxODBkRjpLTcbru/9k1YWKSKxfvJj/53v9GBiTUk1KIjBbng/e8ROP4bOla4
 Pefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690105116; x=1690709916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oxNqVJ8M0RlStNJiqmdGBEdZEF6FgJ1pvu+FzFr7WF0=;
 b=Fz5RNspHChLyOjbAd6u2TGenXTUtlZmgY6Dm75fggH/A/p8yvp+ZizqWic0nbHQ892
 5Lad8JKE46Lfyn8QD6kwr7UO3Niqa5Tt1LGbbj/NYfqn1yB5zexIQuyW9ZVMXltvbEWR
 jJUSjpnUAEAi8BvRNiJwp3xtIKV8gr5Px78NHo5r2RmCUlDEHa0SKYBLoMkapZU6OFjX
 u4+NOeAfouB/5ca7xzAxTMssMztzGXGpZCNRx4yOtZo2swWmvTkQDQgIbBt3cdpgngPT
 a8h8w+3udh+CFlqI7O0IrZRJ0YmoKl5sssHE2es1UIR85sKNsUTjNEieue67GaJfpOi2
 WqaA==
X-Gm-Message-State: ABy/qLaQlYpDZyEOBKViZ/JFTrRSBF51XknzKyyOKwntdUSa5cnSgSss
 bLsgavaRAd158E8EFNXFrrA=
X-Google-Smtp-Source: APBJJlHEoHQAlhF6vEArYxkf108SJhFb8RJ0pr+GGHx6NyP863uApYvVhr8KpOvpDqncDS8OfFbWMw==
X-Received: by 2002:a5d:61c5:0:b0:30f:af19:81f3 with SMTP id
 q5-20020a5d61c5000000b0030faf1981f3mr4621201wrv.41.1690105115424; 
 Sun, 23 Jul 2023 02:38:35 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx..
 ([2001:8f8:1163:535c:ce7:4d43:f827:e4e8])
 by smtp.gmail.com with ESMTPSA id
 r5-20020adff105000000b003145521f4e5sm9186373wro.116.2023.07.23.02.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jul 2023 02:38:34 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/bpf: fix build errors if CONFIG_NF_CONNTRACK_MARK
 not set.
Date: Sun, 23 Jul 2023 13:38:06 +0400
Message-Id: <20230723093806.2850822-1-mahmoudmatook.mm@gmail.com>
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

'mark' member in 'struct nf_conn' is conditionally defined
 by CONFIG_NF_CONNTRACK_MARK
 so any reference to it should follow the same.

 $ make -C tools/testing/selftests/bpf
	progs/test_bpf_nf.c:219:12: error: no member named 'mark' in 'struct nf_conn'
	                        if (ct->mark == 42) {
	                            ~~  ^
	progs/test_bpf_nf.c:220:9: error: no member named 'mark' in 'struct nf_conn'
	                                ct->mark++;
	                                ~~  ^
	progs/test_bpf_nf.c:221:34: error: no member named 'mark' in 'struct nf_conn'
                                test_exist_lookup_mark = ct->mark;

Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
---
 .../testing/selftests/bpf/progs/test_bpf_nf.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/test_bpf_nf.c b/tools/testing/selftests/bpf/progs/test_bpf_nf.c
index 77ad8adf68da..0b285de8b7e7 100644
--- a/tools/testing/selftests/bpf/progs/test_bpf_nf.c
+++ b/tools/testing/selftests/bpf/progs/test_bpf_nf.c
@@ -157,7 +157,10 @@ nf_ct_test(struct nf_conn *(*lookup_fn)(void *, struct bpf_sock_tuple *, u32,
 		struct nf_conn *ct_ins;
 
 		bpf_ct_set_timeout(ct, 10000);
-		ct->mark = 77;
+		#if defined(CONFIG_NF_CONNTRACK_MARK)
+			ct->mark = 77;
+		#endif
+
 
 		/* snat */
 		saddr.ip = bpf_get_prandom_u32();
@@ -188,7 +191,9 @@ nf_ct_test(struct nf_conn *(*lookup_fn)(void *, struct bpf_sock_tuple *, u32,
 				bpf_ct_change_timeout(ct_lk, 10000);
 				test_delta_timeout = ct_lk->timeout - bpf_jiffies64();
 				test_delta_timeout /= CONFIG_HZ;
-				test_insert_lookup_mark = ct_lk->mark;
+				#if defined(CONFIG_NF_CONNTRACK_MARK)
+					test_insert_lookup_mark = ct_lk->mark;
+				#endif
 				bpf_ct_change_status(ct_lk,
 						     IPS_CONFIRMED | IPS_SEEN_REPLY);
 				test_status = ct_lk->status;
@@ -210,10 +215,12 @@ nf_ct_test(struct nf_conn *(*lookup_fn)(void *, struct bpf_sock_tuple *, u32,
 		       sizeof(opts_def));
 	if (ct) {
 		test_exist_lookup = 0;
-		if (ct->mark == 42) {
-			ct->mark++;
-			test_exist_lookup_mark = ct->mark;
-		}
+		#if defined(CONFIG_NF_CONNTRACK_MARK)
+			if (ct->mark == 42) {
+				ct->mark++;
+				test_exist_lookup_mark = ct->mark;
+			}
+		#endif
 		bpf_ct_release(ct);
 	} else {
 		test_exist_lookup = opts_def.error;
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
