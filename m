Return-Path: <SRS0=IV6d=5R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C63FC2D0E8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 01:36:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F314A20BED
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Apr 2020 01:36:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="j237GYzK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F314A20BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E6AA986A85;
	Wed,  1 Apr 2020 01:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXihHVV911vm; Wed,  1 Apr 2020 01:36:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7BEB086A75;
	Wed,  1 Apr 2020 01:36:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F663C1AE8;
	Wed,  1 Apr 2020 01:36:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8A94C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 01:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A3317855EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 01:36:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTGoBs2eNxLa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 01:36:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E5C7287D6C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Apr 2020 01:36:44 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id t17so20305457qtn.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 18:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IbgGcVF0EJCkLy2QmL9Rcj9NjTuET0dt713t3OmqqbY=;
 b=j237GYzKoXjs1kMFmRh42jSasBRN0D7GB+dLS33p3s+FcbM6DlqulG5sneDSwJ761j
 V6fW4MvqxnPCFHSrD0hFA405b6NxssHove7YA0wgQVqlPCwdX7fcyo/Esvn9jcAQryok
 Ywu2ZvldoS3Jc4Xlo9EoDX8zrF6E8uN5RWChZ8yjeyc5XmhAUpdJa8Suzjgw4gJr7G3F
 C9dpxGJrABuWQN+S9kP+tbtrUKowkIcxuUEVcV2X97JC1WuNB2HGfF6HDMhctd2BpAue
 hx1+nimq1fJ441QW8i9Bwj3byVdnEu/nyypKLLeJoeaibIsK9o3zZM4GFXNfVgtOfZ1z
 eioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IbgGcVF0EJCkLy2QmL9Rcj9NjTuET0dt713t3OmqqbY=;
 b=JJvGwxU+XdzBP20duBQZZNSriJqi1MYOL+Pz2Ru4h5HKBU2vPFi8xYiJv9TV0Iq17O
 HwO22A6InH5ElnIy2YUl5YwWLa9ZHIkASyVwm2WPNIGugiDAzO0wJh/fdXvTDQzyy5tF
 XArElXgghGShubL6N3SvjCXt+BPuy6sdDYhKrOARoeWO/TUxxMa27OMhqQWEIKwueCdZ
 iKeucYw/MKzNxuo902dLh3IGQUucUCP1ew7MOufATfExK4m6on44xQjYuSMwIlIEnl5G
 jY27pje9P7fYtp/xWus/1KmBkCZiM06RarioQ6lqDtPWJ7qQqfyV66OvNxYerW5OTKTJ
 arYA==
X-Gm-Message-State: ANhLgQ3ZZRazLGEwoPGGvcgzdMQOu9S/VXC3TDt+tGoJBB5bXDJLiD/c
 2AgDud8bH3DIcSn3NeYP6ZRIgg==
X-Google-Smtp-Source: ADFU+vuCtJl0alErKaDbHnravdHUnZEMxreqX2xAcP5PQ+W9SAURzTl80251dKNQNke6ULhDfGC3JQ==
X-Received: by 2002:ac8:1608:: with SMTP id p8mr8109582qtj.123.1585705003728; 
 Tue, 31 Mar 2020 18:36:43 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id w28sm513147qtc.27.2020.03.31.18.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 18:36:43 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Tue, 31 Mar 2020 22:36:39 -0300
Message-Id: <20200401013639.16388-1-vitor@massaru.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] kunit: Fix kunit.py run
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
v2:
 - Use the correct next branch
---
 tools/testing/kunit/kunit_kernel.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
index cc5d844ecca1..5c30751387c7 100644
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
