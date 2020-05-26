Return-Path: <SRS0=2zBv=7I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE2EC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 18:34:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E2B2068D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 18:34:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="KGN04Gs7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E2B2068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B8CC1886B5;
	Tue, 26 May 2020 18:34:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7o8VJEEibmV; Tue, 26 May 2020 18:34:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AA1BD885C8;
	Tue, 26 May 2020 18:34:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E17EC0888;
	Tue, 26 May 2020 18:34:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61171C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 18:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4AA988631D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 18:34:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yXzLGJcCkvvj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 18:34:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F30E087899
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 18:34:41 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id w3so16165224qkb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 11:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X6aXjORE3d23i1StkTonhzGHIalGKnrHwR2gVaYOR1Q=;
 b=KGN04Gs7yNeKZzj8Lcyig10HxzNnFYhK42ZHpbQ7VNBeH5oOdHxr0avRB6BsoYRpdg
 HHf0NqmqHMxFxlPGrp/dyvpQBszyjEKVlw2KCc1XphtusuGVsAUn7O1bVuxVSvUHzDAO
 qDMbPlvkjYEKPQMSqNb3avW9ZnJ1JV677JoYBfxCY8u2Sr2CGJV7eb2fYyH7YyCp1xfS
 BvD8LhMMJltV/8TSjKAidYgKWQplesk60AeoWpiEIsKiT1shwbBy0mYHMo8JS2ky0+sA
 cMfCEn2PRi6ogyHzvbfD+0swY8H9NjiTzeEUn4ariY/8fTEGzx/HoNwF6w30WHKRhxEb
 fquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X6aXjORE3d23i1StkTonhzGHIalGKnrHwR2gVaYOR1Q=;
 b=d2GYpDFWRu8Ve358IDB+jukB3nUhgLw8/x7g2cdVeoJHkz5fcJNXVNcyYWuhCIlC/j
 P9rx+ZEdcTe7XsFxe1rTcNRWr2PzGtXlxY8tGXFhe8c+pE+jNsdDNt+VN+vPAPk3KGsu
 fIh53Yz6aT0UvEA1cuP7uJO3RjUCKRByJfR3C9p2BPH6B4mubJizaJRuk36fW5COxupc
 nps+zbFe5afPgEb3+YJOwaf5AfoU4VDJ1fzhcS7xRf1DIHdojW69NhtbU1xz9KH5Tob6
 KIo2LMmoCFF8nPe7eGjzLrgCupGy9cFhYDhzYDi2D4pyCj6inmE7P8xwD7dkZjt5nFA9
 icoQ==
X-Gm-Message-State: AOAM531jYYxagVge+sMjsgt+XvPqMxUOCSENn8G6G9pezUIKUoR8eoOh
 QnRd336G6TQVoAFWgDAN+LhMVw==
X-Google-Smtp-Source: ABdhPJx197AECqahGr2mrLzhHicRNVl3wRfVxYHrdKQzzsTRV2BokxzXwXPWx0y9cHLpDk04xJuo0A==
X-Received: by 2002:a37:484e:: with SMTP id v75mr142237qka.79.1590518080875;
 Tue, 26 May 2020 11:34:40 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id l22sm342526qki.45.2020.05.26.11.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 11:34:40 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org
Date: Tue, 26 May 2020 15:34:36 -0300
Message-Id: <20200526183436.47026-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [Linux-kernel-mentees] [fixup] kunit: use --build_dir=.kunit as
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

Fixed up minor merge conflicts - Shuah Khan <skhan@linuxfoundation.org>

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
version after merge on kunit brach:
 * fix identation (tabs instead of spaces)
---
 tools/testing/kunit/kunit.py | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index b01838b6f5f9..b3490271a103 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -169,7 +169,7 @@ def add_common_opts(parser):
 	parser.add_argument('--build_dir',
 			    help='As in the make command, it specifies the build '
 			    'directory.',
-			    type=str, default='', metavar='build_dir')
+                            type=str, default='.kunit', metavar='build_dir')
 	parser.add_argument('--make_options',
 			    help='X=Y make option, can be repeated.',
 			    action='append')
@@ -245,12 +245,11 @@ def main(argv, linux=None):
 	cli_args = parser.parse_args(argv)
 
 	if cli_args.subcommand == 'run':
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
 
 		if not linux:
 			linux = kunit_kernel.LinuxSourceTree()
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
