Return-Path: <SRS0=g7AB=56=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3ECC38A29
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Apr 2020 23:09:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 323152054F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Apr 2020 23:09:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="d/XycrnO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 323152054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0347987E54;
	Tue, 14 Apr 2020 23:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6e1DmNm3q3g; Tue, 14 Apr 2020 23:09:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8A7DF87D6E;
	Tue, 14 Apr 2020 23:09:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80914C1D7D;
	Tue, 14 Apr 2020 23:09:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04E3BC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 23:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F07BB86A3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 23:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z08IBxDouODS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 23:09:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4078E84F4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 23:09:56 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id x2so11824799qtr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 16:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GmpDGYHNWO1HVRGOCC1HUE41KMOfYWwP4MYA86x9Hs=;
 b=d/XycrnOIE9zVNs85mQ8kiqfaX2FAKRGtTainrFJ0IzS2KMbTBKck6+HKcl12KMfi/
 mLyCl0M1OBOJwXwZ3mkeZWf734twgkheW3CbMFKK9vgo54UnwfYGSfuqlmm2nneOODqY
 lFI2ztDOic5VkmRttn366D+g3jqOHNKyx6SEMuHpgfwN4dMbeYlKBWMp7+Sx0VtOHgkw
 QAB6RJyglN5wdqlfuhGUcdCQiEH3Z01NDBhyXZH9qCDuhlHStFTK31cHPnoZ3HSzOw1n
 zELCk4JBQJoOxdIR6Znl2rOgnjsEmPOnLC0nGGBLDO2jdXjzhoB0uXDpMRgRXyQfNDmR
 X8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GmpDGYHNWO1HVRGOCC1HUE41KMOfYWwP4MYA86x9Hs=;
 b=aI0Far/iYYHl9UQBjKU/J8tD3UDXyVy/FyawFlsJ6fkbhI3180QZmQq5gklz1quecM
 jjRFCjlhY4rOXmz7mqdl2LzDNoBqAP3GIAguRt1QriHaKyBqrfjpmdmVAh5mTfuEX1gr
 T9ETVM1hg0k70LV7NbPm9IhqrX9Rv9nojDg02qlR1kf09SsykwG2Z8iYl0CLIWsPeQXn
 d8RiQbmLnoBx0UOmrnifyLQNcEF2HVslABs6JUgqfYwqvMHIZ9V7THN6F6Tkh9hU0tOS
 njUXvwZrHtfeXUtj3g0DA3QVRUnvcFzB3ZYbXp/Hk/swe+JJ/vsR7axDFCoDvmGO27Vu
 s2Kg==
X-Gm-Message-State: AGi0PuYUvLLjUs6v6M/IgETPdxNvfwEe4vUY1WGlTku5YMqLw/vl1Drk
 NXx8eRInYZ0kdvNIyRKJQV1QUA==
X-Google-Smtp-Source: APiQypIq7HA/Rl7AQcDjE3FdKvf8IBKg1xI6rru45NLF9fLflB46Gk0TTOpZ6L0hLOq23HmizGMYBQ==
X-Received: by 2002:ac8:16e4:: with SMTP id y33mr19301422qtk.4.1586905795146; 
 Tue, 14 Apr 2020 16:09:55 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id f1sm11455084qkl.72.2020.04.14.16.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 16:09:54 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Tue, 14 Apr 2020 20:09:50 -0300
Message-Id: <20200414230950.83665-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [Linux-kernel-mentees] [RESEND] kunit: use --build_dir=.kunit as
	default
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

To make KUnit easier to use, and to avoid overwriting object and
.config files, the default KUnit build directory is set to .kunit

 * Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205221

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 tools/testing/kunit/kunit.py | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index 7dca74774dd2..5da190c79481 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -116,7 +116,7 @@ def main(argv, linux=None):
 	run_parser.add_argument('--build_dir',
 				help='As in the make command, it specifies the build '
 				'directory.',
-				type=str, default='', metavar='build_dir')
+				type=str, default='.kunit', metavar='build_dir')
 
 	run_parser.add_argument('--defconfig',
 				help='Uses a default .kunitconfig.',
@@ -136,12 +136,11 @@ def main(argv, linux=None):
 		if get_kernel_root_path():
 			os.chdir(get_kernel_root_path())
 
-		if cli_args.build_dir:
-			if not os.path.exists(cli_args.build_dir):
-				os.mkdir(cli_args.build_dir)
-			kunit_kernel.kunitconfig_path = os.path.join(
-				cli_args.build_dir,
-				kunit_kernel.kunitconfig_path)
+		if not os.path.exists(cli_args.build_dir):
+			os.mkdir(cli_args.build_dir)
+		kunit_kernel.kunitconfig_path = os.path.join(
+			cli_args.build_dir,
+			kunit_kernel.kunitconfig_path)
 
 		if cli_args.defconfig:
 			create_default_kunitconfig()
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
