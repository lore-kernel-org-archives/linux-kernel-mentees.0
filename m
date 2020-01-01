Return-Path: <SRS0=0ztn=2W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51ECCC32764
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 240C2206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBTDe8pp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 240C2206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0C0DA204DF;
	Wed,  1 Jan 2020 22:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZ5mt4doNVtL; Wed,  1 Jan 2020 22:26:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 78F2A1FF59;
	Wed,  1 Jan 2020 22:26:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75ED3C18DC;
	Wed,  1 Jan 2020 22:26:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D152EC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C0D7D87216
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lwxXgzp1evUC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 275DC87158
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:32 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id a6so16389150plm.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jan 2020 14:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=snbkD8gIui2ODoVtFZ3ZclnMOMYPIMsUQlwjXFjRHYQ=;
 b=eBTDe8pp2rNywyNFGle2C7u8CBH4ftWl4VYuR554lcM2xZRdEXvVirnzI4GRE2nBCN
 V5bhKtGLx5QKBeNfrW1d6pGClUc3cpAyfj5UiyZmFZJhghgQH3YXFqei25w/X6B59AcP
 Bu/utuuwZOxS6zQtu6giD8dN48dd9+f9kl8bmj9+bwPmRk8wbcfMlF2x2Mp9B+PNnKx6
 /g0fHtFn6hz1Y86mNK+sGTkrkfFQRsjiNEAIslz8OizEDN9V4CiJCCx+wYTcfI8NYOSi
 lSCWna39oyjak1uw6Eo0cCc9eCJ7fDS6Fijj/IrQ5gNHSIgQwWJ0qapvV9XzsJuhuX/N
 27pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=snbkD8gIui2ODoVtFZ3ZclnMOMYPIMsUQlwjXFjRHYQ=;
 b=i0u/k9sUDDDr3gUwga+PWqxOsML3+6rpf2qUgRkAs6OnJIIbHdGRX0cA/RW7hKgw5Q
 Zd62mP3TmhHF9uWJ3oI0CXyj510AjqdnqZmXDQlsKYk+1UVvdDaZklRT4CG9Dq8SYQ/0
 H3KuJg3oHp28m9QCY7LU2unxzaOc6t7hz44KFo1WaUDe5aOWhpBI4Drh8CZDCkCxeI7t
 PtinWKRY4s+Btu4tTXdhl5wpv99cKX1UcOhAcJ/lN7Ji99F/Oh00IzLkKLPpg5bAN/RU
 JFKeZi5qvExcBhS/KXCAr4B/9p8vR/rIr1QKieNx0/NjZpkXndHFnuJVxm8j/wlu6i3f
 EUUw==
X-Gm-Message-State: APjAAAXUTqMQVYxHO9Gq342rpx1A+b+jYkWTN5GliUUaPpYWAABDEz+h
 ExleFlQYwa0tRXSmaO6Yn/8=
X-Google-Smtp-Source: APXvYqy8jwYypGRbQcwyGcw+xWP3k4SZYRrnlf45+ctDz2g5G6VcuouZ+F7L3ssZ6KdtWm9qtpgvpg==
X-Received: by 2002:a17:902:7b8c:: with SMTP id
 w12mr75669626pll.30.1577917591740; 
 Wed, 01 Jan 2020 14:26:31 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id o2sm8601008pjo.26.2020.01.01.14.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 14:26:31 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Wed,  1 Jan 2020 19:26:09 -0300
Message-Id: <83802f7451f8ce78c989a0983e6876d8dd0576aa.1577917076.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577917076.git.dwlsalmeida@gmail.com>
References: <cover.1577917076.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3 2/8] Documentation: nfsroot.rst:
	COSMETIC: refill a paragraph
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Refill a paragraph to eliminate long lines.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/admin-guide/nfs/nfsroot.rst | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/nfs/nfsroot.rst b/Documentation/admin-guide/nfs/nfsroot.rst
index cdbfa0c67186..657309759f6e 100644
--- a/Documentation/admin-guide/nfs/nfsroot.rst
+++ b/Documentation/admin-guide/nfs/nfsroot.rst
@@ -15,13 +15,14 @@ Mounting the root filesystem via NFS (nfsroot)
 
 
 
-In order to use a diskless system, such as an X-terminal or printer server
-for example, it is necessary for the root filesystem to be present on a
-non-disk device. This may be an initramfs (see Documentation/filesystems/ramfs-rootfs-initramfs.txt),
-a ramdisk (see Documentation/admin-guide/initrd.rst) or a
-filesystem mounted via NFS. The following text describes on how to use NFS
-for the root filesystem. For the rest of this text 'client' means the
-diskless system, and 'server' means the NFS server.
+In order to use a diskless system, such as an X-terminal or printer server for
+example, it is necessary for the root filesystem to be present on a non-disk
+device. This may be an initramfs (see
+Documentation/filesystems/ramfs-rootfs-initramfs.txt), a ramdisk (see
+Documentation/admin-guide/initrd.rst) or a filesystem mounted via NFS. The
+following text describes on how to use NFS for the root filesystem. For the rest
+of this text 'client' means the diskless system, and 'server' means the NFS
+server.
 
 
 
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
