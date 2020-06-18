Return-Path: <SRS0=NG44=77=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08256C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 03:57:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74AE2217A0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 03:57:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="Z0X0AmgF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74AE2217A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0CF9B8847C;
	Thu, 18 Jun 2020 03:57:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HPrdf7mgxGUP; Thu, 18 Jun 2020 03:57:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D6FD88466;
	Thu, 18 Jun 2020 03:57:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 628B5C07FF;
	Thu, 18 Jun 2020 03:57:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF1D0C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 03:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BA43586C31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 03:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bjR6_lA_p30x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 03:57:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6370986237
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 03:57:41 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id b27so4346342qka.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Jun 2020 20:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kxq9wRrE0VcoWqdZaicI3/uHvnI8AYX6HIWvnm/8zQU=;
 b=Z0X0AmgFWFKBZX0ES2R4eb0Zccw1evdsbhMfTQR8REFSgqGBre9aVWppzpZHKBD1T2
 p2vk59LxddnUhMiGRtjZSxJwll0NNPe283ZTTiZ1HjLE0v2EsPbiDHrGWEFSNfFDJ96t
 zG34duQCPI6NFTakIDfkNqOa2QNGLK0X8vQsPM8kuiDKllhrvTAg2SVTXN2KRnCL97op
 citaOJ/yBH3DLNHEX3GdXrivfTYhkDqky8KacUjgsFIcnYZpN9F/4tlrHDcx96M38x/4
 nihDusTfHIueFxSn7yrqTqe0sg3gFV8YWOtHdjVpA+iA0v9xFWXdi6O2GXGkFW5gc1YR
 C0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kxq9wRrE0VcoWqdZaicI3/uHvnI8AYX6HIWvnm/8zQU=;
 b=IHN00ZsbGF9jRiIibpZq1jFGzK26emtLKcqDvcOCcLIJI8NoiALXds1CTOu+UBi4Xm
 YiDPYsT1SELvIhSKj21SYpbI9hNgABoaWa4JrmmnQ1e2eghA6xCdLwObdT5/VpPwU75V
 j3AGEcZSnGvpIl2vaIU6+znhxZkWwHq16O3FmuoB4/Bjc40C0BbLKAgc5u32ghVqXOwu
 wDOoE0X2Vt1PqXAKY6ljb4H+aJdaQFmoyWA6KcheBHiDJ4wBj1+yGyWaNCuW1lzShJqO
 a79PdObqpofD/UY9uMq9avdKokxyPKqy/QUe3/OFKfpgQX2uTyDyEc6J8qactlZ2jcGO
 oL2w==
X-Gm-Message-State: AOAM533WZgdEzyVeMwcpjdn+yMZYq62wGN+HqvjcbPmoFtUum6HnyXy0
 t4V6QhyOpP4x5kJw9ISCb8WemA==
X-Google-Smtp-Source: ABdhPJx7UOP/sLgtGoIwIcclUrfK9C91LRQm5rNLMKQL+9lN8jMkDMH6MlF3cRaZ2mvb6P4/pXHg4A==
X-Received: by 2002:a37:a386:: with SMTP id m128mr2023002qke.224.1592452660335; 
 Wed, 17 Jun 2020 20:57:40 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id a1sm1846168qkn.87.2020.06.17.20.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 20:57:39 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Thu, 18 Jun 2020 00:57:36 -0300
Message-Id: <20200618035736.245566-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] kunit: fix KconfigParseError by
	ignoring CC_VERSION_TEXT
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

Commit 8b59cd81dc5 ("kbuild: ensure full rebuild when the compiler
is updated") added the environment variable CC_VERSION_TEXT,
parse_from_string() doesn't expect a string and this causes the
failure below:

[iha@bbking linux]$ tools/testing/kunit/kunit.py run --timeout=60
[00:20:12] Configuring KUnit Kernel ...
Generating .config ...
Traceback (most recent call last):
  File "tools/testing/kunit/kunit.py", line 347, in <module>
    main(sys.argv[1:])
  File "tools/testing/kunit/kunit.py", line 257, in main
    result = run_tests(linux, request)
  File "tools/testing/kunit/kunit.py", line 134, in run_tests
    config_result = config_tests(linux, config_request)
  File "tools/testing/kunit/kunit.py", line 64, in config_tests
    success = linux.build_reconfig(request.build_dir, request.make_options)
  File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_kernel.py", line 161, in build_reconfig
    return self.build_config(build_dir, make_options)
  File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_kernel.py", line 145, in build_config
    return self.validate_config(build_dir)
  File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_kernel.py", line 124, in validate_config
    validated_kconfig.read_from_file(kconfig_path)
  File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_config.py", line 89, in read_from_file
    self.parse_from_string(f.read())
  File "/home/iha/lkmp/linux/tools/testing/kunit/kunit_config.py", line 85, in parse_from_string
    raise KconfigParseError('Failed to parse: ' + line)
kunit_config.KconfigParseError: Failed to parse: CONFIG_CC_VERSION_TEXT="gcc (GCC) 10.1.1 20200507 (Red Hat 10.1.1-1)"

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 tools/testing/kunit/kunit_config.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/kunit/kunit_config.py b/tools/testing/kunit/kunit_config.py
index e75063d603b5..3033520597b6 100644
--- a/tools/testing/kunit/kunit_config.py
+++ b/tools/testing/kunit/kunit_config.py
@@ -9,6 +9,7 @@
 import collections
 import re
 
+CONFIG_IGNORE_CC_VERSION_TEXT = 'CONFIG_CC_VERSION_TEXT'
 CONFIG_IS_NOT_SET_PATTERN = r'^# CONFIG_(\w+) is not set$'
 CONFIG_PATTERN = r'^CONFIG_(\w+)=(\S+)$'
 
@@ -79,7 +80,7 @@ class Kconfig(object):
 				self.add_entry(entry)
 				continue
 
-			if line[0] == '#':
+			if line[0] == '#' or CONFIG_IGNORE_CC_VERSION_TEXT in line:
 				continue
 			else:
 				raise KconfigParseError('Failed to parse: ' + line)

base-commit: 7bf200b3a4ac10b1b0376c70b8c66ed39eae7cdd
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
