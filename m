Return-Path: <SRS0=/QZw=DF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0735EC2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 06:43:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AC4C21941
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Sep 2020 06:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaAPsr1e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AC4C21941
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A73CA203F5;
	Mon, 28 Sep 2020 06:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EPPDpiVg4vPC; Mon, 28 Sep 2020 06:42:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5F1CB203E3;
	Mon, 28 Sep 2020 06:42:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4499AC0889;
	Mon, 28 Sep 2020 06:42:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21AE2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 06:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DE88F203E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 06:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9bEzIMYhERjy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 06:42:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 81D7520025
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 06:42:55 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id z23so6853618ejr.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 27 Sep 2020 23:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=qN+S61oVmPC+Q3dWpJjCh6WwaRMPQCJpevSG1rLGzow=;
 b=gaAPsr1eQolYUOGe9xSWxntexJqKCVnQSoYWSGe3KJDLR7z09fD1A5fKObl5/9IGKR
 ueMKPiAKANCX0LUiqWxJ6KjyDH6q1JEwC60B/dk03wYJptr83gc+GnjJO3001Me15EEW
 oMvgetsntbd7vqqgDJ8U/mEMEeXdlqNVLWg9D7WM+cC8Aaa6Kk6JCIchYNcRPZodnXsA
 7p8DfJB0m5Ecvk0/y/5daHEP+hJm8zQFrBiGihVE7CtkungkUfFgQsZoJ1HtiejuWdt2
 cSo1DdcXwxIuzAo9M1UIvf4CbNOqwjGdvgLjIM/n8M37oWBR/LSEk2VaAzanqtTExLoD
 PKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qN+S61oVmPC+Q3dWpJjCh6WwaRMPQCJpevSG1rLGzow=;
 b=gsoiQV37UoihDSc5Q3+r0V4SuqqMlljWCULFvrm+PEpKUkIBep8o35Hduabah6XWKh
 19aBMguM2qIds8l0+Sot0TCd8DQnOwzyCALeVAK1eDlFlQuu4phpapXG9tAfV9/BeKkk
 lCtc+B/swT4PDNdvAeKlbOXcBCUhXXmZ8RnPx9QE3hQoQEYTvjslBp+PxMGz7dzPL3Dc
 fxCw56ctsbHA0KOD9C2U7OYeWeSRiv4VBLpgl8QXA4x2dGo8tQcdqzG6qeeNF628ppMt
 sTQJJdl0cKtCjwFsC6A9jxTorow3/1BjZBDPD752xott7Shxcy59N1hkJOJqqRPHizGh
 xOXw==
X-Gm-Message-State: AOAM532kArpBZs+nbThUlZSMnhcYWLMhJaJevZ5X15HS8hy5iMnuNdUx
 B75SkyGd0FbaIkeoHkJtLBI=
X-Google-Smtp-Source: ABdhPJyoLdeeL5FGFduOYkr7rEhDILDQ4q8oJjqEotR4NwQH3lEnzkjqzfIzQPtc9b6BgiUtc3TNTQ==
X-Received: by 2002:a17:906:2c14:: with SMTP id
 e20mr244311ejh.205.1601275373814; 
 Sun, 27 Sep 2020 23:42:53 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d9d:5000:b971:2536:319e:5b1d])
 by smtp.gmail.com with ESMTPSA id lz22sm9221047ejb.98.2020.09.27.23.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 23:42:52 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org
Date: Mon, 28 Sep 2020 08:42:44 +0200
Message-Id: <20200928064244.29206-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC] kbuild: doc: describe proper
	script invocation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

During an investigation to fix up the execute bits of scripts in the kernel
repository, Andrew Morton and Kees Cook pointed out that the execute bit
should not matter, and that build scripts cannot rely on that. Kees could
not point to any documentation, though.

Provide some basic documentation how the build shall invoke scripts, such
that the execute bits do not matter.

This serves as reference for further clean-up patches in the future.

Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20200925 and v5.9-rc7

Kees, Andrew, please ack.

Masahiro-san, please pick this small documentation update into your kbuild tree.

Ujjwal Kumar, a potential future mentee, will follow up with further fixes to
the build scripts.

 Documentation/kbuild/makefiles.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 58d513a0fa95..9d0d198adb7e 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -21,6 +21,7 @@ This document describes the Linux kernel Makefiles.
 	   --- 3.10 Special Rules
 	   --- 3.11 $(CC) support functions
 	   --- 3.12 $(LD) support functions
+	   --- 3.13 Script Invocation
 
 	=== 4 Host Program support
 	   --- 4.1 Simple Host Program
@@ -605,6 +606,23 @@ more details, with real examples.
 		#Makefile
 		LDFLAGS_vmlinux += $(call ld-option, -X)
 
+3.13 Script invocation
+----------------------
+
+	Make rules may invoke scripts to build the kernel. The rules shall
+	always provide the appropriate interpreter to execute the script. They
+	shall not rely on the execute bits being set, and shall not invoke the
+	script directly.
+
+	Kbuild provides variables $(CONFIG_SHELL), $(AWK), $(PERL),
+	$(PYTHON) and $(PYTHON3) to refer to interpreters for the respective
+	scripts.
+
+	Example::
+
+		#Makefile
+		cmd_depmod = $(CONFIG_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
+			     $(KERNELRELEASE)
 
 4 Host Program support
 ======================
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
