Return-Path: <SRS0=NG44=77=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FC5C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 12:39:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A3932070A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Jun 2020 12:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="K0ZOAG6G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A3932070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E0C9A2048A;
	Thu, 18 Jun 2020 12:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dG5ywZM3Uiuy; Thu, 18 Jun 2020 12:39:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 874B020521;
	Thu, 18 Jun 2020 12:39:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F6A4C07FF;
	Thu, 18 Jun 2020 12:39:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76A14C016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 12:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5C0662048A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 12:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TMm5aG6zHoQJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 12:39:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 01D3F203C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 12:39:17 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c185so5285946qke.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Jun 2020 05:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=72mYtR8brLn0NtD1nMNXJ5LkwsKwBqKm9sI8cal1E90=;
 b=K0ZOAG6GPspKsFM7RuoT1Zxla/nSwmJil3wicypom/nE8jjCpK25dmHoz1r1NnXadc
 ww5oAw4uDtuC0r5OyCQKa7v6tue9ZyNUOKyFMkfrCDrEWcgvBPPmvopYsQYDI5AgV8Gv
 AtgDwfC2zGMOR1pOrxPMfHWMFT7z+VjmYyImE54pHzbcrk5YncmWcOFjkVSbGFPeE+wW
 J5QfJWa55NA5KWZb3jklwT0BXjvcVEfIHaG1N2RZgfLA0MGe6Faz6CVqNbqomhSnM10D
 9iYNa53DJtVno8jZynfCQw0FxObMJ0l0mxqquCkzFHCssr3s2M+VbMkq/fVboKjCGbRO
 gHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=72mYtR8brLn0NtD1nMNXJ5LkwsKwBqKm9sI8cal1E90=;
 b=BfkzLyAiXd3XvUDPw8La9h76in1SOZnu4Y+Nbljhcfoc6qEezevC5aS4x6o7zeOHOY
 Yu/RimiARpWbXNjnhSDs326SBpsKKmXRXyY1FW7SeWwE72VdM8f5SdQ9hIYucNUXa4Ml
 ojrKfGV+l1K7QD9X0Lqp3b3tOYdMKENcFPa/h6IT22HXYsOFfZTikKRaqrOnaAWIDbsB
 TDq+bSWKKm+LT0oxTSqk3RPCx002KOSNS5veAJD1k4aUkQnuxiGKQENYxH3nzQwWP3f5
 VB8ldvrYaqe2fz5JJM4UJB0AZ1MDTrd3qbOG3dfjksIpkSrH9CC9ynH2RVkO36Lfk5Py
 WcUQ==
X-Gm-Message-State: AOAM5338ALXvnOYK675r/4ZxYQ4oyabZwZ98wlfl8kq1UwIWMJXGwWdY
 xdQ81d+ShMOfAkwaM8aP7OSh6A==
X-Google-Smtp-Source: ABdhPJysbQyaTGuA2V7J4PdGuIk1FXVCoiQx2IebAeWXZ00/o4KUBNVIzISUhVKWFuY7ZPiZkyl5pg==
X-Received: by 2002:a05:620a:1310:: with SMTP id
 o16mr3413267qkj.68.1592483956719; 
 Thu, 18 Jun 2020 05:39:16 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id 124sm2870143qkm.115.2020.06.18.05.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 05:39:16 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Thu, 18 Jun 2020 09:39:12 -0300
Message-Id: <20200618123912.64762-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] kunit: fix KconfigParseError
	handling CC_VERSION_TEXT
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
parse_from_string() doesn't expect a string in value field and this
causes the failure below:
	
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
v2: 
 - maintains CC_VERSION_TEXT in the .config file to ensure full rebuild
   when the compiler is updated.
---
 tools/testing/kunit/kunit_config.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/kunit/kunit_config.py b/tools/testing/kunit/kunit_config.py
index e75063d603b5..c407c7c6a2b0 100644
--- a/tools/testing/kunit/kunit_config.py
+++ b/tools/testing/kunit/kunit_config.py
@@ -81,6 +81,12 @@ class Kconfig(object):
 
 			if line[0] == '#':
 				continue
+
+			if 'CONFIG_CC_VERSION_TEXT' in line:
+				name, value = line.split('=')
+				entry = KconfigEntry(name, value)
+				self.add_entry(entry)
+				continue
 			else:
 				raise KconfigParseError('Failed to parse: ' + line)
 

base-commit: 7bf200b3a4ac10b1b0376c70b8c66ed39eae7cdd
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
