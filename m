Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74B1C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 20:57:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3623820757
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 20:57:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uQwTBpZJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3623820757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8587D2045B;
	Tue, 29 Sep 2020 20:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4q29fgdfj10t; Tue, 29 Sep 2020 20:57:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BAF792001F;
	Tue, 29 Sep 2020 20:57:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94E52C0889;
	Tue, 29 Sep 2020 20:57:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B28CAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 20:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9B40C85F8A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 20:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8kSIUfjDA--q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 20:57:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EEEC985F7C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 20:57:48 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id u3so3398664pjr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 13:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MzVnM7zGHKWvt5JrX6t8rOtvcMExwl3IXeOBymXLfl4=;
 b=uQwTBpZJ3aFBIqyiAYDyoqCRKC7SmV/Yy7SJeDINPjs+CWMS9N07ErB+dePpf4qiHe
 MEp0ckYFpRKe0FM+DIvQBOx0sCV6KFy1LK2NZHUhAZhFUpMlfzNhTv1gTh4l7TLUxMCf
 Qg21dlIZu3tsLKXPTuAl3m+3ZA5LelbW7bSZBi1EFzlF8nJe+4JmDpzM93edPU61hVAn
 F4BXCI5McVWkgjSB4f6S157O/f9s2wErPM0MtKW3pc9OUlcB2ygUHKbk2AFD/jSSQIU6
 FKK/+ZgcjjdzdeJTEnXpgnoSpSrCaoyixbh4lQdqvhFMc9pxqRO9OCP0J1RKqauElInX
 tjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MzVnM7zGHKWvt5JrX6t8rOtvcMExwl3IXeOBymXLfl4=;
 b=Y5Nmnjs7kP/DNY5wmO3QWKaycA3PMCtPEZpb0C4SJ69KF8CGbZZGYl6F4t67Vp55Cs
 z9MqkUWSBth3PRCkxcH13a2lidboKVDNR2C1oBEy5UFwhC2mX9SWzNRZUjy1c1Vby2aU
 xpjSpDFQVUWHnihPWu46IxPBI2IwfZiAQvIp5xQBTeVvVezQogNJJAU66VKabCe9N9M8
 yU00H+4R1TfA+cX/YSZVUUh1eRJ3Zj9+e0RrS2cs7qEK386v7qDGfo9YQK1tl4py9i6Y
 WU86pJbl71EqjpxBZPAH0jsS5gtzLhxh3ZeFT+JLi/dIG/WVXpNSLp/AHZo6cpazIrEu
 zw0Q==
X-Gm-Message-State: AOAM531Ygk33JEARHz3EQaCeIiwEpGm3oem/NEknCR3rS2PmZyMrVmF1
 E6zV9nTTtKNmmgMPogyYOts=
X-Google-Smtp-Source: ABdhPJx/Yaj7/R4iDvNT+XxibxN5WU1hvgg+TWq5ZL3K5/9B3DlTNzyprO1OkksiFB3CI4Q5l7IsMw==
X-Received: by 2002:a17:90a:6e45:: with SMTP id
 s5mr5417604pjm.12.1601413068385; 
 Tue, 29 Sep 2020 13:57:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6825:89f0:a659:1148:a80f])
 by smtp.gmail.com with ESMTPSA id x4sm6605421pff.57.2020.09.29.13.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 13:57:47 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Wed, 30 Sep 2020 02:27:31 +0530
Message-Id: <20200929205731.207393-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, dwaipayaray1@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC] checkpatch: fix multistatement
	macro checks
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

Checkpatch generates incorrect error message for certain
macros.

When checkpatch was run on commit 4649079b9de1
"tracing: Make ftrace packed events have align of 1"), it
generated multiple errors of the form:

ERROR: Macros with multiple statements should be enclosed in a do -
while loop
+#define __field_packed(type, container, item)    type item;

This should certainly not be enclosed in a do - while loop.
The problem was with the trailing semicolon. Any statement
with trailing semicolon was marked as a multi-line macro.
This was fixed by having a seperate rule for excluding
single statements terminated by semicolon.

The second problem is due to while (...) {...} macros not being
handled.
For example, on commit fe557319aa06 ("maccess: rename probe_kernel_
{read,write} to copy_{from,to}_kernel_nofault"), checkpatch
generated following error:

ERROR: Macros with multiple statements should be enclosed in a do -
while loop
+#define copy_to_kernel_nofault_loop(dst, src, len, type, err_label) \
 	while (len >= sizeof(type)) {
        ....

This was fixed by having a seperate rule to match such while blocks.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9e65d21456f1..4fb612200c27 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5342,10 +5342,12 @@ sub process {
 			    $dstat !~ /^\.$Ident\s*=/ &&				# .foo =
 			    $dstat !~ /^(?:\#\s*$Ident|\#\s*$Constant)\s*$/ &&		# stringification #foo
 			    $dstat !~ /^do\s*$Constant\s*while\s*$Constant;?$/ &&	# do {...} while (...); // do {...} while (...)
+				$dstat !~ /^while\s*$Constant\s*$Constant$/ &&			# while (...) {...}
 			    $dstat !~ /^for\s*$Constant$/ &&				# for (...)
 			    $dstat !~ /^for\s*$Constant\s+(?:$Ident|-?$Constant)$/ &&	# for (...) bar()
 			    $dstat !~ /^do\s*{/ &&					# do {...
 			    $dstat !~ /^\(\{/ &&						# ({...
+				$dstat !~ /;$/ &&						# statement;
 			    $ctx !~ /^.\s*#\s*define\s+TRACE_(?:SYSTEM|INCLUDE_FILE|INCLUDE_PATH)\b/)
 			{
 				if ($dstat =~ /^\s*if\b/) {
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
