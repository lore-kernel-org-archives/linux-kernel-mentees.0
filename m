Return-Path: <SRS0=2zBv=7I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98518C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 18:35:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 666B9206F1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 18:35:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="ecGB8EiR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 666B9206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30DC086362;
	Tue, 26 May 2020 18:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUKIpCWN0yRz; Tue, 26 May 2020 18:35:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 15FF286256;
	Tue, 26 May 2020 18:35:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03806C0888;
	Tue, 26 May 2020 18:35:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8271EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 18:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7DDBB8790A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 18:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id axs7Ub0R2i3y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 18:35:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8B71287899
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 18:35:13 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c12so2788735qkk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 11:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tOHefzf5rrf6G5EWDMOouxVnKSU7Wd/O1AnRn9bMs1U=;
 b=ecGB8EiRX+iwxbGas+Dcx/BedPX+XhFTrkIpEUtRlmlYtDVzT38LGjlDQ+q0FGUsVq
 vMlno1I/lZLGX10FakV/Gie2hEbDpAk9KwWjUPG2tp9zqkjs2XGBadd0xZTH7ZtTiz+g
 f6OYTzZ35mk2dWOeVG/8r0pwIUn4JixaihXgg9Di9Be2BWUjgpaQIFKGBsZ1+uowDH83
 +6aFYeXMhY5gvukVB1flp+GlXlpw6t6WZWGk6fX5tZgluAbwhKJtaZb3j7YIj2IIOl/x
 lt2akuZxcJ21/6+Vaj0s9YkLkKgZwjy6mUVeAzk8jXI3/Pnhw2EsE+qzD2CdI2zQUUjR
 ahJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tOHefzf5rrf6G5EWDMOouxVnKSU7Wd/O1AnRn9bMs1U=;
 b=HzFzWZVwuP8ZSHlR3jm6VBkp2vh32HXWW0BG+jNs/+zgjOapMxTpso7cVX1fvdoGhI
 59WttenKqnDBfniFmnxMngPbNcn5tT3GDD6Bs1G3ygEzApvwGUxiOA7Igu0Kd88zHh51
 ReKT8BFEuTLQCpxAlPm/Ca7rfzuEtrJrdtcsArGWI9AKGWc7+E9mHuAg5j3ubf4u5LBP
 54NC0AWwqShVUpFm+Ct4AP+f9wPS1d2DBhx9FUNDyvsNB61Ipuc9kwlseX6rkdXvpA48
 BYuWsuQ/aB3XQJVq7gSgsBcrYxN49N4e0pl7VGhCQB6jnzS74qCN6jXlyQHsjmvfR+Ee
 EmpQ==
X-Gm-Message-State: AOAM531L+HcaWBpmaU5ouVBGT6fguiFgnPB1B8+c+WDiZQuK7lKELn/v
 dGA7Adnk40SmmA1od3WGIyX+tg==
X-Google-Smtp-Source: ABdhPJxCRmUucVbdyfLei9YA5WE+HsPraMh/wlOImgdfrkErvWAIFR3hdUWwt5WWeBJVD5+n89/mHw==
X-Received: by 2002:a05:620a:22f5:: with SMTP id
 p21mr129040qki.241.1590518112425; 
 Tue, 26 May 2020 11:35:12 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id o2sm396942qtj.70.2020.05.26.11.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 11:35:11 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com,
	skhan@linuxfoundation.org
Date: Tue, 26 May 2020 15:35:06 -0300
Message-Id: <20200526183506.47104-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [Linux-kernel-mentees] [fixup] kunit: use KUnit defconfig by default
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

To improve the usability of KUnit, defconfig is used
by default if no kunitconfig is present.

 * https://bugzilla.kernel.org/show_bug.cgi?id=205259

Fixed up minor merge conflicts - Shuah Khan <skhan@linuxfoundation.org>

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
Version after kunit merge branch:
 * removes code related defconfig;
 * handles when there is no .kunitconfig. 
---
 tools/testing/kunit/kunit.py | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
index b3490271a103..787b6d4ad716 100755
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
@@ -32,8 +32,8 @@ KunitExecRequest = namedtuple('KunitExecRequest',
 KunitParseRequest = namedtuple('KunitParseRequest',
 			       ['raw_output', 'input_data'])
 KunitRequest = namedtuple('KunitRequest', ['raw_output','timeout', 'jobs',
-					   'build_dir', 'defconfig',
-					   'alltests', 'make_options'])
+					   'build_dir', 'alltests',
+					   'make_options'])
 
 KernelDirectoryPath = sys.argv[0].split('tools/testing/kunit/')[0]
 
@@ -60,8 +60,7 @@ def config_tests(linux: kunit_kernel.LinuxSourceTree,
 	kunit_parser.print_with_timestamp('Configuring KUnit Kernel ...')
 
 	config_start = time.time()
-	if request.defconfig:
-		create_default_kunitconfig()
+	create_default_kunitconfig()
 	success = linux.build_reconfig(request.build_dir, request.make_options)
 	config_end = time.time()
 	if not success:
@@ -131,7 +130,6 @@ def run_tests(linux: kunit_kernel.LinuxSourceTree,
 	run_start = time.time()
 
 	config_request = KunitConfigRequest(request.build_dir,
-					    request.defconfig,
 					    request.make_options)
 	config_result = config_tests(linux, config_request)
 	if config_result.status != KunitStatus.SUCCESS:
@@ -177,11 +175,6 @@ def add_common_opts(parser):
 			    help='Run all KUnit tests through allyesconfig',
 			    action='store_true')
 
-def add_config_opts(parser):
-	parser.add_argument('--defconfig',
-			    help='Uses a default .kunitconfig.',
-			    action='store_true')
-
 def add_build_opts(parser):
 	parser.add_argument('--jobs',
 			    help='As in the make command, "Specifies  the number of '
@@ -210,7 +203,6 @@ def main(argv, linux=None):
 	# The 'run' command will config, build, exec, and parse in one go.
 	run_parser = subparser.add_parser('run', help='Runs KUnit tests.')
 	add_common_opts(run_parser)
-	add_config_opts(run_parser)
 	add_build_opts(run_parser)
 	add_exec_opts(run_parser)
 	add_parse_opts(run_parser)
@@ -219,7 +211,6 @@ def main(argv, linux=None):
 						help='Ensures that .config contains all of '
 						'the options in .kunitconfig')
 	add_common_opts(config_parser)
-	add_config_opts(config_parser)
 
 	build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests')
 	add_common_opts(build_parser)
@@ -251,6 +242,9 @@ def main(argv, linux=None):
 			cli_args.build_dir,
 			kunit_kernel.kunitconfig_path)
 
+		if not os.path.exists(kunit_kernel.kunitconfig_path):
+			create_default_kunitconfig()
+
 		if not linux:
 			linux = kunit_kernel.LinuxSourceTree()
 
@@ -258,7 +252,6 @@ def main(argv, linux=None):
 				       cli_args.timeout,
 				       cli_args.jobs,
 				       cli_args.build_dir,
-				       cli_args.defconfig,
 				       cli_args.alltests,
 				       cli_args.make_options)
 		result = run_tests(linux, request)
@@ -272,11 +265,13 @@ def main(argv, linux=None):
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
@@ -292,6 +287,9 @@ def main(argv, linux=None):
 				cli_args.build_dir,
 				kunit_kernel.kunitconfig_path)
 
+		if not os.path.exists(kunit_kernel.kunitconfig_path):
+			create_default_kunitconfig()
+
 		if not linux:
 			linux = kunit_kernel.LinuxSourceTree()
 
@@ -313,6 +311,9 @@ def main(argv, linux=None):
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
