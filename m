Return-Path: <SRS0=g7AB=56=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A7FC2BB1D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Apr 2020 22:51:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D6132074D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Apr 2020 22:51:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="sVFynu6u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D6132074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 65AB28592F;
	Tue, 14 Apr 2020 22:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wzphq1woyjMC; Tue, 14 Apr 2020 22:51:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EF9DE85913;
	Tue, 14 Apr 2020 22:51:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9465C089E;
	Tue, 14 Apr 2020 22:51:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93896C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 22:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 820DD85932
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 22:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uAbLqlhiw70s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 22:51:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A9D9D8592F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 22:51:00 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id v7so15365660qkc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 15:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GmpDGYHNWO1HVRGOCC1HUE41KMOfYWwP4MYA86x9Hs=;
 b=sVFynu6uxe/1IYpgyK5vHozGoALV27D0esYW0h/gqLr0R7i12qBcB6m3tuCoCBvSR/
 BarOB3ND2X8zcoVR8cG93fmbKXTwES+Bn+7jDRt+FBXoQbaacVQVx8McUH/AmdkYxbok
 63d5rf8DlAcQa7ADrPPCgPYw/57YH73qGw116x0sBUJRgUGLbVs/ytJr8gpCbqdD5ZvV
 OrGNjkvwP3rRhDPyjAAG6rolsWKXGZRj0Kaw1o1pkr7pArW8k6v1bvq/CXlpai1WXOua
 qU6t2iP7oSQPBPr8zmP6wqJUMsS3B03rNjKLW6BqaAQfxhEff/kntWZTIyXIafVTGvZM
 BGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GmpDGYHNWO1HVRGOCC1HUE41KMOfYWwP4MYA86x9Hs=;
 b=VIAJWbvWTXUg/m+Idijp/5adofJ7KU/nIyegFV1B+2rE1vySjkxEAs9ioItbObKArl
 UY7w4W0qlGm/ktfRNhHC4s4H9BrB6zp/E2q25baJTN8h+3ub2SSJCn4f9/b8vrgoTpny
 vl/MCcov+rcv2U2cvHtLlhnHPc5GTjfpVwgkdLYAU6NL2kv7w3g/flfrBveJAemacCHn
 tIo5bJK3ykdy4+jaE0P7rOBU1D1fYNQ3syBxZ4BB+8qYjQ6iX/lNiMOI9X+RJWh/PCQ4
 9F839w6U6sC8J5SGIL9NDa5VKSQXrM5gX4+M19foVLcAkLeQyrOzPX0iFznz1XcKJIE7
 8AfA==
X-Gm-Message-State: AGi0PuaXKay6B7paqHbfED6nDqql7lRYg/Jm4GKU/NA9SuMscqv5AKyo
 KFPUIld6odj3jRZfGyPRBRmKsA==
X-Google-Smtp-Source: APiQypJcvNv4pDReOcJEKCheR7ohpA3eksDlyYI4BNeYNc+nCmyMn5w0jJ+afnHpid9Nx37EUAFj3A==
X-Received: by 2002:a37:4ed5:: with SMTP id
 c204mr23485573qkb.328.1586904659318; 
 Tue, 14 Apr 2020 15:50:59 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id j90sm11747701qte.20.2020.04.14.15.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 15:50:58 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Tue, 14 Apr 2020 19:50:54 -0300
Message-Id: <20200414225054.81721-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.or, linux-kernel-mentees@lists.linuxfoundation.org,
 brendanhiggins@google.com, linux-kselftest@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] kunit: use --build_dir=.kunit as
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
