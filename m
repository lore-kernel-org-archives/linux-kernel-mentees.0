Return-Path: <SRS0=pM+b=5W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF1AC2BA2B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 22:19:24 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D6820753
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 22:19:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="m3OlceIm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0D6820753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9798E232BD;
	Mon,  6 Apr 2020 22:19:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWtjJriwqHu5; Mon,  6 Apr 2020 22:19:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0DA032324B;
	Mon,  6 Apr 2020 22:19:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF68EC089E;
	Mon,  6 Apr 2020 22:19:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80AAAC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 22:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 56771866F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 22:19:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W7lwxCIpYeF6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 22:19:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 982F086640
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 22:19:21 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id i3so1187429qtv.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Apr 2020 15:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OPrlCY8jQsQXtLUnLDlfV3dzYEfymLtvdW8F4aI7TfY=;
 b=m3OlceImpplocncT+pL8x7NKjNxj63YBiWKChKASzcRMWdu/2mK+uafJmmE2IkMp55
 7c/t/K14EDQxUksZXBbiKzHGIbD0VASz5jMxB2pxC8/roVrjtIE1CENOna76aad1iy1q
 TaTZD9/1D4fpTuwOw/5s9sqoLeUkH3IfdIt5HnV8a82hZmpactr3zehOcO0F/reZASrb
 1c7mB9NZGyC15MxEENaRqsdEqN6PsJEN0EzkCSOYeMf8y7l1XuzLyfKCDqG7S8+FsiLW
 Svn9XbAaQ/1gen3RUT/8TaQmqR+bqLNobFkN31jG9qxnLYq12+hPHGFBEOvCEXv5eAJs
 ThpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OPrlCY8jQsQXtLUnLDlfV3dzYEfymLtvdW8F4aI7TfY=;
 b=QCPIDfSi3ngf+T/5i/wNsN/V6Ic0qpqIGRea7hPkC59VUeMtNO0btzZy9Q0AgGjq4p
 pcEVjxZ9l/5Rmg4KAlGtx6A33eivt5Kh0mSC0RivTwtXRxs6QTb1qAQw7qE9+cDJ7TiH
 aOUDbqDmTIGNkgw6oEJqU9MuHhyUTEHoc0JFl2dExK1SXvkNPs7fSqn+AXeKI6La3HS8
 bQK88ZihTPEzmyCSRPIlwkRkT8UAV1GowJ2mVIuCQOfmYpg8CNSMTQOo5KDglYeyF898
 GGPCrKJvchvHMCvdMGzlCDiyFd2qbccesf7tEX8/h52c8dKT+7nIminTeaWdgKe6vsQZ
 GPVA==
X-Gm-Message-State: AGi0PuaFLk6Z0PcjHr6xYVvxGRaRsBowG/8mQX7ZMNur/YVGEp/lAoZb
 JW8GoBHomrO4k/QYB3WHKFXssw==
X-Google-Smtp-Source: APiQypIgCypxzVhSxBHo3S9YP15zDlJ8kCqvoD0wznCPGR7+wsJ5GU1Oq3bn/SWODBllN8dV7NEuKg==
X-Received: by 2002:ac8:7316:: with SMTP id x22mr1914028qto.4.1586211560566;
 Mon, 06 Apr 2020 15:19:20 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id f1sm14521822qkl.72.2020.04.06.15.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 15:19:19 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Mon,  6 Apr 2020 19:19:16 -0300
Message-Id: <20200406221916.50008-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3,
	RESEND] kunit: Fix kunit.py run --build_dir='<foo>' fails on
	"unclean" trees
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

Fix this bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219

For some reason, the environment variable ARCH is used instead of ARCH
passed as an argument, this patch uses a copy of the env, but using
ARCH=um and CROSS_COMPILER='' to avoid this problem.

This patch doesn't change the user's environment variables, avoiding
side effects.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
v2:
 - Use the correct next branch

v3:
 - Use torvalds/master branch
 - Use base parameter on git send-email
---
 tools/testing/kunit/kunit_kernel.py | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index 63dbda2d029f..96216c699fde 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -20,6 +20,7 @@ import kunit_parser
 KCONFIG_PATH = '.config'
 kunitconfig_path = '.kunitconfig'
 BROKEN_ALLCONFIG_PATH = 'tools/testing/kunit/configs/broken_on_uml.config'
+env = dict(os.environ.copy(), ARCH='um', CROSS_COMPILE='')
 
 class ConfigError(Exception):
 	"""Represents an error trying to configure the Linux kernel."""
@@ -41,13 +42,15 @@ class LinuxSourceTreeOperations(object):
 			raise ConfigError(e.output)
 
 	def make_olddefconfig(self, build_dir, make_options):
-		command = ['make', 'ARCH=um', 'olddefconfig']
+		command = ['make', 'olddefconfig']
 		if make_options:
 			command.extend(make_options)
 		if build_dir:
 			command += ['O=' + build_dir]
 		try:
-			subprocess.check_output(command, stderr=subprocess.PIPE)
+			subprocess.check_output(command,
+						stderr=subprocess.PIPE,
+						env=env)
 		except OSError as e:
 			raise ConfigError('Could not call make command: ' + e)
 		except subprocess.CalledProcessError as e:
@@ -57,9 +60,10 @@ class LinuxSourceTreeOperations(object):
 		kunit_parser.print_with_timestamp(
 			'Enabling all CONFIGs for UML...')
 		process = subprocess.Popen(
-			['make', 'ARCH=um', 'allyesconfig'],
+			['make', 'allyesconfig'],
 			stdout=subprocess.DEVNULL,
-			stderr=subprocess.STDOUT)
+			stderr=subprocess.STDOUT,
+			env=env)
 		process.wait()
 		kunit_parser.print_with_timestamp(
 			'Disabling broken configs to run KUnit tests...')
@@ -71,13 +75,13 @@ class LinuxSourceTreeOperations(object):
 			'Starting Kernel with all configs takes a few minutes...')
 
 	def make(self, jobs, build_dir, make_options):
-		command = ['make', 'ARCH=um', '--jobs=' + str(jobs)]
+		command = ['make', '--jobs=' + str(jobs)]
 		if make_options:
 			command.extend(make_options)
 		if build_dir:
 			command += ['O=' + build_dir]
 		try:
-			subprocess.check_output(command)
+			subprocess.check_output(command, env=env)
 		except OSError as e:
 			raise BuildError('Could not call execute make: ' + e)
 		except subprocess.CalledProcessError as e:
@@ -91,7 +95,8 @@ class LinuxSourceTreeOperations(object):
 		with open(outfile, 'w') as output:
 			process = subprocess.Popen([linux_bin] + params,
 						   stdout=output,
-						   stderr=subprocess.STDOUT)
+						   stderr=subprocess.STDOUT,
+						   env=env)
 			process.wait(timeout)
 
 

base-commit: 7e63420847ae5f1036e4f7c42f0b3282e73efbc2
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
