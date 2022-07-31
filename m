Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17AFC00140
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 Jul 2022 09:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3137682F0F;
	Sun, 31 Jul 2022 09:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3137682F0F
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nOYN6MEV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQa1_7U4KE8O; Sun, 31 Jul 2022 09:25:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4A1D882EA2;
	Sun, 31 Jul 2022 09:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A1D882EA2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F673C0033;
	Sun, 31 Jul 2022 09:25:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38234C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 09:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E191E82EA2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 09:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E191E82EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wAkeZwg9cuol
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 09:25:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3AAE82E22
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3AAE82E22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 09:25:45 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id c139so8104924pfc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 Jul 2022 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fgm3Q++1bshM2vl04u7TMk9GX8r0/GgZjPpDoVpdNEw=;
 b=nOYN6MEV8djhhHocvXe+hviriAisVPDKDjgJEmXQnC7GE3aIWE9Ofw/xhg2liiM82U
 +KwO7/qekJpFxGJTcIQs6Ctl4GJ9n7x29rIcz+B4lWnbhR8/e/3AaZFRo8KHc1eoRael
 X69jxEngBuKi3ivSukSnVKMM/JaZVdbWvwTwPK3t/I9QelyFY1ZC3lUHBLd4EA29jYwp
 Db7keNveNxVLU8fBjzU7u0+K4F6xtZ+/Q8cAztfuOCffqEbLLomDQ45aApYY0HBpbPk2
 SYHx7082vuAwMVHkTaOO5s83Pk9GFsL75hDgnJ/h/ctiqjRX+ZmWGCl9ZTaTKar4Kp6G
 7KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fgm3Q++1bshM2vl04u7TMk9GX8r0/GgZjPpDoVpdNEw=;
 b=RqBLayNkkCKAIppZogWbT8YFBD94BQJhYxKLGPbXTlIXGSa8KJ/jiSgXOaIDCaXpA7
 G00WyY/UWufiXBD3RHxcVxQcukTWSneYNXWbNAzZiFa/U8q5S4vguxje+zbBW39NxMIv
 c2GcJ9S+oY4dHk2X+eyTSy5YfffOOtraN4jYbHrypr50iTJgvYqzGYKbFOWD5Hq9krXR
 UCkPuTbg3hy3ogX2GPKEciwItF0IgxytMVnryWVHu3c48lq84bo3MFSSodD1dtfna+aC
 Y14apOSdJByq8mGpOF5ecDqUOCFfBvRNBHmvkRNOjUQ5B2/3uE7IkO4yheXjnCzD6bYk
 oECQ==
X-Gm-Message-State: ACgBeo1ZGBc6+yFXRbWecYmHujoX3s1MFuTLbSY2CLWEHWkzEUWJy5/n
 BLpn+LqoNIwlb5V3VMUcqYk=
X-Google-Smtp-Source: AA6agR7VU84e7l6aGVkbcFw+tkLywcnjeN6b4ZIQYsTlc3xYB3BhyXpmuUjM/Tsb71Wj1g6nvgb6AQ==
X-Received: by 2002:a63:5425:0:b0:41b:a9e0:bfc1 with SMTP id
 i37-20020a635425000000b0041ba9e0bfc1mr6783924pgb.206.1659259545257; 
 Sun, 31 Jul 2022 02:25:45 -0700 (PDT)
Received: from biggie.. ([103.230.148.186]) by smtp.gmail.com with ESMTPSA id
 t1-20020a170902e84100b0016d1b708729sm7147827plg.132.2022.07.31.02.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 02:25:44 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: keescook@chromium.org, shuah@kernel.org, brauner@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 guoren@kernel.org
Subject: [PATCH] selftests/seccomp: Check CAP_SYS_ADMIN capability in the test
 mode_filter_without_nnp
Date: Sun, 31 Jul 2022 14:55:29 +0530
Message-Id: <20220731092529.28760-1-gautammenghani201@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: wad@chromium.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 luto@amacapital.net, linux-kselftest@vger.kernel.org,
 Gautam Menghani <gautammenghani201@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel-mentees@lists.linuxfoundation.org, bpf@vger.kernel.org
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

In the "mode_filter_without_nnp" test in seccomp_bpf, there is currently
a TODO which asks to check the capability CAP_SYS_ADMIN instead of euid.
This patch adds support to check if the calling process has the flag 
CAP_SYS_ADMIN, and also if this flag has CAP_EFFECTIVE set.

Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 136df5b76319..16b0edc520ef 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -392,6 +392,8 @@ TEST(mode_filter_without_nnp)
 		.filter = filter,
 	};
 	long ret;
+	cap_t cap = cap_get_proc();
+	cap_flag_value_t is_cap_sys_admin = 0;
 
 	ret = prctl(PR_GET_NO_NEW_PRIVS, 0, NULL, 0, 0);
 	ASSERT_LE(0, ret) {
@@ -400,8 +402,8 @@ TEST(mode_filter_without_nnp)
 	errno = 0;
 	ret = prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &prog, 0, 0);
 	/* Succeeds with CAP_SYS_ADMIN, fails without */
-	/* TODO(wad) check caps not euid */
-	if (geteuid()) {
+	cap_get_flag(cap, CAP_SYS_ADMIN, CAP_EFFECTIVE, &is_cap_sys_admin);
+	if (!is_cap_sys_admin) {
 		EXPECT_EQ(-1, ret);
 		EXPECT_EQ(EACCES, errno);
 	} else {
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
