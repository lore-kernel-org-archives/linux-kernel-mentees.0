Return-Path: <SRS0=FjTm=7L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0321BC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 19:28:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AE4E20810
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 May 2020 19:28:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="rM5yGeEP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AE4E20810
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5E82A88578;
	Fri, 29 May 2020 19:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oYZR6FWd3O3s; Fri, 29 May 2020 19:28:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8BE8F88577;
	Fri, 29 May 2020 19:28:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 736ADC07FF;
	Fri, 29 May 2020 19:28:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A186C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 19:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8E37189417
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 19:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xivHEUon4GGX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 19:28:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ADBF28940E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 19:28:50 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id i68so2905262qtb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 May 2020 12:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2yrhlCJB5EdnMFeYW6dCoHgeGO9Wv2PNUyggTiWf66I=;
 b=rM5yGeEPKD1ETwS8p5hRXM1GRXsRU0ckAKC3dyimsrlw1vS2rJwpsAMVoQTgtFp/DV
 FZHDJ4blwRXdYidNVLHlZkwf/JjNlrxftmAzDI4YNv57PCZn16bKvW8Nbet9apvrGJpB
 Dh/cAqXEbs7XMI6pWL93SaGxEWJjols/VZTB7lraAPLuupPcyjB0vvNei3Ax64CJmVDM
 fDdTBepAccSwosJIH6L02feciSsBqqz9GGij+ncBgVWBDiSlua+gQtWczj/baqHgZweG
 vY9vh+CxNJf5TEjZa/UxWbHsZHQAJuqz41u1xCrnAOxcLSk6oJQpkOk8MnbC/Csho+Nl
 jpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2yrhlCJB5EdnMFeYW6dCoHgeGO9Wv2PNUyggTiWf66I=;
 b=j7UboX2/14lpGmhKglQnclr1uiCJXRUaZozcA9c7JT0NYQyvPA7eX295M9qlL4b3dc
 nnpc9jVJn8OmITFT3kCbTCu7mQlMwW1MFe5fUFUT5wlzU19JKkTcy7cX8OuyV/v9g+H2
 mEA+4B+1qYIkYofJaHr+tZ0bU5HjYyG8I87DDID9FA2r3lZigMI78K/VwonIWRFfnKWg
 UxNcvEvGYL7oal2/lKZPgDG8Nd7x6a0rI/Y46s9MaXgNc3LNBlKx77x2TWOTfmGHhGXM
 yarceDN3I53UewhCUVyQliENX0p7+L4vXZGsIJQD8gafScGL1yD2u0D5+Vr3LOktweWv
 z5Nw==
X-Gm-Message-State: AOAM531+vymLLF3954lGrLJZFYBZRmTcifqXoQgVzWY0cE5jI9bjnl5L
 GZTI6/T5UydG3d7MpGt1QOxQyw==
X-Google-Smtp-Source: ABdhPJx5RzeYnSHBhEQtvg6BqNax43i3eDbcLHygMZ5Uh9urOiS7DO2jD4wj/aIF6aluVDFXTouPAw==
X-Received: by 2002:ac8:4556:: with SMTP id z22mr10639657qtn.37.1590780529381; 
 Fri, 29 May 2020 12:28:49 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id v126sm7486339qkd.36.2020.05.29.12.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 12:28:48 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org
Date: Fri, 29 May 2020 16:28:45 -0300
Message-Id: <20200529192845.60468-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] kunit: Fix TabError,
	remove defconfig code and handle when there is no kunitconfig
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

The identation before this code (`if not os.path.exists(cli_args.build_dir):``)
was with spaces instead of tabs after fixed up merge conflits,
this commit revert spaces to tabs:

[iha@bbking linux]$ tools/testing/kunit/kunit.py run
  File "tools/testing/kunit/kunit.py", line 247
    if not linux:
                ^
TabError: inconsistent use of tabs and spaces in indentation

Remove defconfig related code to fix these two errors,
the commit 9bdf64b35 was created before 45ba7a893ad,
and the commit 9bdf64b35 removes defconfig related code:

[iha@bbking linux]$ tools/testing/kunit/kunit.py run
Traceback (most recent call last):
  File "tools/testing/kunit/kunit.py", line 338, in <module>
    main(sys.argv[1:])
  File "tools/testing/kunit/kunit.py", line 215, in main
    add_config_opts(config_parser)

[iha@bbking linux]$ tools/testing/kunit/kunit.py run
Traceback (most recent call last):
  File "tools/testing/kunit/kunit.py", line 337, in <module>
    main(sys.argv[1:])
  File "tools/testing/kunit/kunit.py", line 255, in main
    result = run_tests(linux, request)
  File "tools/testing/kunit/kunit.py", line 133, in run_tests
    request.defconfig,
AttributeError: 'KunitRequest' object has no attribute 'defconfig'

Handles when there is no .kunitconfig, the error occurs because
commit 9bdf64b35 was created before 45ba7a893ad.

[iha@bbking linux]$ tools/testing/kunit/kunit.py run
Traceback (most recent call last):
  File "tools/testing/kunit/kunit.py", line 335, in <module>
    main(sys.argv[1:])
  File "tools/testing/kunit/kunit.py", line 246, in main
    linux = kunit_kernel.LinuxSourceTree()
  File "/home/iha/sdb/opensource/lkmp/linux/tools/testing/kunit/kunit_kernel.py", line 109, in __init__
    self._kconfig.read_from_file(kunitconfig_path)
  File "/home/iha/sdb/opensource/lkmp/linux/tools/testing/kunit/kunit_config.py", line 88, in read_from_file
    with open(path, 'r') as f:
FileNotFoundError: [Errno 2] No such file or directory: '.kunit/.kunitconfig'

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
Fix the fixup on this commits: 9bdf64b, ddbd60c.

Some errors occurs because these commits were created before
this commit 45ba7a8, as explained in the commit message.
---
 tools/testing/kunit/kunit.py | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index ec73b07d1265..787b6d4ad716 100755
--- a/tools/testing/kunit/kunit.py
+++ b/tools/testing/kunit/kunit.py
@@ -23,7 +23,7 @@ import kunit_parser
 KunitResult = namedtuple('KunitResult', ['status','result','elapsed_time'])
 
 KunitConfigRequest = namedtuple('KunitConfigRequest',
-				['build_dir', 'defconfig', 'make_options'])
+				['build_dir', 'make_options'])
 KunitBuildRequest = namedtuple('KunitBuildRequest',
 			       ['jobs', 'build_dir', 'alltests',
 				'make_options'])
@@ -130,7 +130,6 @@ def run_tests(linux: kunit_kernel.LinuxSourceTree,
 	run_start = time.time()
 
 	config_request = KunitConfigRequest(request.build_dir,
-					    request.defconfig,
 					    request.make_options)
 	config_result = config_tests(linux, config_request)
 	if config_result.status != KunitStatus.SUCCESS:
@@ -212,7 +211,6 @@ def main(argv, linux=None):
 						help='Ensures that .config contains all of '
 						'the options in .kunitconfig')
 	add_common_opts(config_parser)
-	add_config_opts(config_parser)
 
 	build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests')
 	add_common_opts(build_parser)
@@ -238,11 +236,14 @@ def main(argv, linux=None):
 	cli_args = parser.parse_args(argv)
 
 	if cli_args.subcommand == 'run':
-                if not os.path.exists(cli_args.build_dir):
-                    os.mkdir(cli_args.build_dir)
-                kunit_kernel.kunitconfig_path = os.path.join(
-                        cli_args.build_dir,
-                        kunit_kernel.kunitconfig_path)
+		if not os.path.exists(cli_args.build_dir):
+			os.mkdir(cli_args.build_dir)
+		kunit_kernel.kunitconfig_path = os.path.join(
+			cli_args.build_dir,
+			kunit_kernel.kunitconfig_path)
+
+		if not os.path.exists(kunit_kernel.kunitconfig_path):
+			create_default_kunitconfig()
 
 		if not linux:
 			linux = kunit_kernel.LinuxSourceTree()
@@ -264,11 +265,13 @@ def main(argv, linux=None):
 				cli_args.build_dir,
 				kunit_kernel.kunitconfig_path)
 
+		if not os.path.exists(kunit_kernel.kunitconfig_path):
+			create_default_kunitconfig()
+
 		if not linux:
 			linux = kunit_kernel.LinuxSourceTree()
 
 		request = KunitConfigRequest(cli_args.build_dir,
-					     cli_args.defconfig,
 					     cli_args.make_options)
 		result = config_tests(linux, request)
 		kunit_parser.print_with_timestamp((
@@ -284,6 +287,9 @@ def main(argv, linux=None):
 				cli_args.build_dir,
 				kunit_kernel.kunitconfig_path)
 
+		if not os.path.exists(kunit_kernel.kunitconfig_path):
+			create_default_kunitconfig()
+
 		if not linux:
 			linux = kunit_kernel.LinuxSourceTree()
 
@@ -305,6 +311,9 @@ def main(argv, linux=None):
 				cli_args.build_dir,
 				kunit_kernel.kunitconfig_path)
 
+		if not os.path.exists(kunit_kernel.kunitconfig_path):
+			create_default_kunitconfig()
+
 		if not linux:
 			linux = kunit_kernel.LinuxSourceTree()
 
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
