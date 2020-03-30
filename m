Return-Path: <SRS0=MQ9E=5P=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F2CC2D0F0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Mar 2020 23:03:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5197220733
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Mar 2020 23:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="qaE9ka01"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5197220733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 09CE887E74;
	Mon, 30 Mar 2020 23:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R2fm-XZ6CTjK; Mon, 30 Mar 2020 23:03:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F9BD8788D;
	Mon, 30 Mar 2020 23:03:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 277AAC1AE8;
	Mon, 30 Mar 2020 23:03:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2955C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Mar 2020 23:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E3524203C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Mar 2020 23:03:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0uLRusojtyRq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Mar 2020 23:03:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by silver.osuosl.org (Postfix) with ESMTPS id A4ED0203AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Mar 2020 23:03:01 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id k13so21120537qki.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Mar 2020 16:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kfP3d4P8jwaZXBD9eOyojCY2clb925eYfLTaD8OeKhA=;
 b=qaE9ka01+XIZt+e6Bvi86miiEoTYjIAZNc6SBrJHsRF8RCkg86ZaVTJROEIRnMjbX+
 epd/phtbktcNMRoCxb7vZX6Uhk31J7yqFb6MwNNJRzsjAuhxOSqF6Fj3w73J+otw36rm
 OhfKblcf3wgx2qK3ZGstg761wknK0bbodDx8aXiYsF8Y7xVUDYoNGoLpSASWg2c3X9mj
 KX42UsxIDrw+v1w7GyYu7f2qjDQzhIvNPOGxC8wcDG8kDGo68q8ffi9Hox+EvyO+YLjG
 T5SYPpcbPf9Vtdh9g+Jm56bfxJbkws3MmYsj5E4XViubrU10Xh4eHltlNPRyRB+/Virv
 C4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kfP3d4P8jwaZXBD9eOyojCY2clb925eYfLTaD8OeKhA=;
 b=dCyy0+swvyNx71+zm8fqgchtkf37/EV5UticzK0nKvRBCQ6aD6RpM9fjBxx/yKJwZG
 8KB386xZHeow/vlFCghCXYEMHdvlmBcYDqVTKAf7XYovTTwOA6Dg8icOcxlnoeF2zFCW
 YomwkL/vKiqM3xP/CMFA4XjzcEyRp0LDDpYn1TlgoeaSWm2tVl2WqD4DeOnbst+Auhbi
 zpQXU1C4wJaWe07ZO7OFkoaPVNproF5191gBqvtbsmcNPOQq0rN+6N5Js1PK6XTSeiL0
 Aao8pnkeqLu/GwZOqMyV4tonUf51cASMYptePUDU6RdHuhY0v43nCH70lPag8dqCHsSv
 DiSg==
X-Gm-Message-State: ANhLgQ0KngrkQz4KrRwFDX9Fhox95t8RrJFzj5fveVljqvVZMJHrTCgb
 34ybsEz58q2D7RkSxAS1Tm0aZQ==
X-Google-Smtp-Source: ADFU+vuRo0Z9og1N04QkJ35KoQ07MEFGwx1jCIe2vGcNdl80NJ4ucpQC+2OppHx5h2cN8yRDQj+PoA==
X-Received: by 2002:a05:620a:539:: with SMTP id
 h25mr2309572qkh.395.1585609380619; 
 Mon, 30 Mar 2020 16:03:00 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id i20sm931146qkl.135.2020.03.30.16.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 16:03:00 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Mon, 30 Mar 2020 20:02:56 -0300
Message-Id: <20200330230256.28323-1-vitor@massaru.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] kunit: Fix kunit.py run
	--build_dir='<foo>' fails on "unclean" trees
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
 tools/testing/kunit/kunit_kernel.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index d99ae75ef72f..0cb1f81ac8f2 100644
--- a/tools/testing/kunit/kunit_kernel.py
+++ b/tools/testing/kunit/kunit_kernel.py
@@ -15,6 +15,7 @@ import kunit_config
 
 KCONFIG_PATH = '.config'
 kunitconfig_path = '.kunitconfig'
+env = dict(os.environ.copy(), ARCH='um', CROSS_COMPILE='')
 
 class ConfigError(Exception):
 	"""Represents an error trying to configure the Linux kernel."""
@@ -36,22 +37,22 @@ class LinuxSourceTreeOperations(object):
 			raise ConfigError(e.output)
 
 	def make_olddefconfig(self, build_dir):
-		command = ['make', 'ARCH=um', 'olddefconfig']
+		command = ['make', 'olddefconfig']
 		if build_dir:
 			command += ['O=' + build_dir]
 		try:
-			subprocess.check_output(command)
+			subprocess.check_output(command, env=env)
 		except OSError as e:
 			raise ConfigError('Could not call make command: ' + e)
 		except subprocess.CalledProcessError as e:
 			raise ConfigError(e.output)
 
 	def make(self, jobs, build_dir):
-		command = ['make', 'ARCH=um', '--jobs=' + str(jobs)]
+		command = ['make', '--jobs=' + str(jobs)]
 		if build_dir:
 			command += ['O=' + build_dir]
 		try:
-			subprocess.check_output(command)
+			subprocess.check_output(command, env=env)
 		except OSError as e:
 			raise BuildError('Could not call execute make: ' + e)
 		except subprocess.CalledProcessError as e:
@@ -66,7 +67,8 @@ class LinuxSourceTreeOperations(object):
 			[linux_bin] + params,
 			stdin=subprocess.PIPE,
 			stdout=subprocess.PIPE,
-			stderr=subprocess.PIPE)
+			stderr=subprocess.PIPE,
+			env=env)
 		process.wait(timeout=timeout)
 		return process
 
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
