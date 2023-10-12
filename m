Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED19CDB483
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Oct 2023 10:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C245410A2;
	Thu, 12 Oct 2023 10:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C245410A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DGkwVesVRg-p; Thu, 12 Oct 2023 10:56:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 42D014150E;
	Thu, 12 Oct 2023 10:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42D014150E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20CC6C0039;
	Thu, 12 Oct 2023 10:56:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CCFAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 10:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 696E54150E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 10:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 696E54150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0RNgOSluh-a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 10:56:15 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D841410A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 10:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D841410A2
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c5c91bec75so6403315ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 03:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697108175; x=1697712975;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9Da9MBT9rB+lZA9zm7WjEfc17v4yeizFPCpeNj0xZ0=;
 b=IamIXEKieMhbiBx8JKb3mAMzAHgXpinrS/6jzpqalviG91SYL4zZINk4eXCyivuAmq
 zF58nqV/byLyjcB8OmSbP5KyLbMVTxRRrtOjbGYwhfuvXv+YYCSRv8HtErMVYamCp8mq
 OSyRX4xrD5YwYtg6c9F7SvVi0hA7aE4oBTgfLUOHmxh1ZW16SclqeOY5VC4oQq55zVs1
 9y8H7ANl8ZQUkXRA+70UB3PolCYDOaUwYw5T3Btr7e1Q8x5VImybf7E/1eWs8oVVPMrB
 SxFgBjA9XYI64cjW7YlSSVdsmgKSITNy551rbMTZB8uNro0Sjhme2yk0mVKn0x2L3EKR
 829w==
X-Gm-Message-State: AOJu0YxgKU8fyPRPRiuei/RTAp4/5MFb4UcrNkMhhvRjyrW1liHzGcXt
 jSz+cpR7TzdXhvSU5e5cdb+bDHNk5wPYHA==
X-Google-Smtp-Source: AGHT+IHrukWTPzhOjCyRsKwTW9N1rf4iR43yr7LemfnQgYdFKwX3fykZ3xDPkLmVgn5cqdkN8M/iSQ==
X-Received: by 2002:a17:902:fa8f:b0:1c9:d948:33d5 with SMTP id
 lc15-20020a170902fa8f00b001c9d94833d5mr2349432plb.64.1697108174615; 
 Thu, 12 Oct 2023 03:56:14 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a170902ecc700b001c3267ae31bsm1642297plh.301.2023.10.12.03.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:56:13 -0700 (PDT)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2023; t=1697108172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=W9Da9MBT9rB+lZA9zm7WjEfc17v4yeizFPCpeNj0xZ0=;
 b=p6mRBJRv15x2a8mugD54EELIKpHhGxE1HudINzkmlCUswZguuXtnlCIm/uEwKwVFGZVLJK
 nYWY3ofQoWfYLeWEKmB7VlsdpqXtvMSIsU6UcKac9GL54ENIO1eIdN7DJjkuzehSfniMDg
 qORCa7JwERprwg49vaR4XZH3DGZYcOA0iaWdlZhua/wejFBTrv0X29zVCWKoPHxCiZUyj+
 6m2N1mhjzLGzrd+M41gY1i3BLQ8YfOEO7gI4LQKNrAbrF/BAbWNzNcAJZ6yUKmJvj2rjU8
 m0xLBNvh1cZcYPP/CDUQ5IFVxGBe/Ql7NmfsVGUjkM9DsgHzdToaow1h361Ndg==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
To: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] docs: kbuild: add INSTALL_DTBS_PATH
Date: Thu, 12 Oct 2023 07:54:21 -0300
Message-ID: <20231012105420.16779-2-ricardo@marliere.net>
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
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

The documentation for kbuild and makefiles is missing an explanation of
a variable important for some architectures.

Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 Documentation/kbuild/kbuild.rst    | 6 ++++++
 Documentation/kbuild/makefiles.rst | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index bd906407e307..9c8d1d046ea5 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -243,6 +243,12 @@ The output directory is often set using "O=..." on the commandline.
 
 The value can be overridden in which case the default value is ignored.
 
+INSTALL_DTBS_PATH
+-----------------
+INSTALL_DTBS_PATH specifies where to install device tree blobs for
+relocations required by build roots.  This is not defined in the
+makefile but the argument can be passed to make if needed.
+
 KBUILD_ABS_SRCTREE
 --------------------------------------------------
 Kbuild uses a relative path to point to the tree when possible. For instance,
diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index e67eb261c9b0..d88d4f0f4f89 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -1623,6 +1623,13 @@ INSTALL_MOD_STRIP
   INSTALL_MOD_STRIP value will be used as the option(s) to the strip
   command.
 
+INSTALL_DTBS_PATH
+  This variable specifies a prefix for relocations required by build
+  roots. It defines a place for installing the device tree blobs. Like
+  INSTALL_MOD_PATH, it isn't defined in the Makefile, but can be passed
+  by the user if desired. Otherwise it defaults to the kernel install
+  path.
+
 Makefile language
 =================
 
-- 
2.42.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
