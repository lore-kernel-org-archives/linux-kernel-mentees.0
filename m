Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615F7C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 07:57:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB9372145D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 07:57:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bwqx3uHy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB9372145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6334222FC6;
	Thu,  1 Oct 2020 07:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gtWBsjYcD3aT; Thu,  1 Oct 2020 07:57:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4926922F26;
	Thu,  1 Oct 2020 07:57:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D871C0889;
	Thu,  1 Oct 2020 07:57:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14290C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F0F208730A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BNiln12SRA1o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:57:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BDA1D87307
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 07:57:34 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id j136so669096wmj.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 00:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=fO/xwDjrhenhlWFGk3DdZkVFlX+/hkokIVqB85yj9q8=;
 b=Bwqx3uHyCyScf2SC7J0dP6b8TluUSYa3R57F+xWoWEDaEK+o7QRMP+bCtb+0kvaBD9
 h+22TRDB+CqJMxYCVuW2YKGT90lchFukm71dkB8lFRdI6sJS5o9TOUmP3ttxhokvDe6O
 8yOqJesCuSSmpxXc7pEcvlQyy0mLiWDb8S6r8DCQ3VcsjdaClp6f70GjcpPnKvCHZlbw
 62VskwilqJr+7miBCi794mo/B/UKfzfI9CitGwoG+hV1xoD3IP1l+iYKkH44mEVIkZzq
 OCO8TGmoef9l55dzoRUX/liwp2LoIk5QKo9rTIJPY/p/uR+MHRqZuNcQWmaHuwjJo1TM
 vykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fO/xwDjrhenhlWFGk3DdZkVFlX+/hkokIVqB85yj9q8=;
 b=Sas5HizDstVDWvKhY8hEhlwI5z4uG4UIMB35udwyY0EEB/WHU7kxpoqIwM8DQd+QKl
 uRTjgRFy/YFozRQgr8rKUB/pEX6s4ie+Hyy2qTKsNAxqP0Il/26s/luMpjZEKCU+ARwn
 BJinogUHsOEybrCEBG3wHVIGNgPwHhuzZ9ppht5lxPYTUXz7H0hAVijy+BA27kZVI1Ee
 IGz6oY9HiXXfZQh7v/JFUTifTkdWdvrZVbDlTsHuGrXZyVvmZJ4N3LGU0o+qaW41A9JD
 IrFFxtB6XJZbP8ZCGBssYmFmGEWp6+jFSHnM31BmhiRnC5klbNW+Ff52KdllH+L9YGnO
 sweg==
X-Gm-Message-State: AOAM533MITf99UGXzEXBfNVFpPGhXwWW3jIBwCRDV1OsPlIdui9xWu7k
 DfvL5FTi2wTcGw+Cb+i2hiY=
X-Google-Smtp-Source: ABdhPJzqmTeSoVSj3eZWfMKoqv/hpLTEtUApfBAwXbTtQp2UVy5XutKX6uMVXd+nsjlytHcsbI/NNw==
X-Received: by 2002:a1c:4054:: with SMTP id n81mr6819205wma.81.1601539053027; 
 Thu, 01 Oct 2020 00:57:33 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d4d:ba00:2c39:a8cb:1b2a:4845])
 by smtp.gmail.com with ESMTPSA id b64sm7500948wmh.13.2020.10.01.00.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 00:57:32 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org
Date: Thu,  1 Oct 2020 09:57:23 +0200
Message-Id: <20201001075723.24246-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] kbuild: doc: describe proper script
	invocation
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

Masahiro Yamada explained the convention of setting execute bits to make it
easier for manual script invocation.

Provide some basic documentation how the build shall invoke scripts, such
that the execute bits do not matter, and acknowledge that execute bits
are useful nonetheless.

This serves as reference for further clean-up patches in the future.

Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
Link: https://lore.kernel.org/linux-kbuild/CAK7LNAQdrvMkDA6ApDJCGr+5db8SiPo=G+p8EiOvnnGvEN80gA@mail.gmail.com/

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
RFC v1 -> RFC v2:
explain why execute bits are still convenient.

Kees, Andrew, please ack.

Masahiro-san, I have taken your feedback into account. Please pick this small
documentation update into your kbuild tree.

Ujjwal Kumar, a potential future mentee, will follow up with further fixes to
the build scripts.

 Documentation/kbuild/makefiles.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 58d513a0fa95..bd3e1baf58be 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -21,6 +21,7 @@ This document describes the Linux kernel Makefiles.
 	   --- 3.10 Special Rules
 	   --- 3.11 $(CC) support functions
 	   --- 3.12 $(LD) support functions
+	   --- 3.13 Script Invocation
 
 	=== 4 Host Program support
 	   --- 4.1 Simple Host Program
@@ -605,6 +606,25 @@ more details, with real examples.
 		#Makefile
 		LDFLAGS_vmlinux += $(call ld-option, -X)
 
+3.13 Script invocation
+----------------------
+
+	Make rules may invoke scripts to build the kernel. The rules shall
+	always provide the appropriate interpreter to execute the script. They
+	shall not rely on the execute bits being set, and shall not invoke the
+	script directly. For the convenience of manual script invocation, such
+	as invoking ./scripts/checkpatch.pl, it is recommended to set execute
+	bits on the scripts nonetheless.
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
