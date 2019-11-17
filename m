Return-Path: <SRS0=54Ti=ZJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F80EC43141
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 17 Nov 2019 17:25:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 653E8206D9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 17 Nov 2019 17:25:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN1Mo5Um"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 653E8206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3D2DA85C5E;
	Sun, 17 Nov 2019 17:25:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8RhPpRfrfbEF; Sun, 17 Nov 2019 17:25:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DC4AB85722;
	Sun, 17 Nov 2019 17:25:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8621C0880;
	Sun, 17 Nov 2019 17:25:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1FF4C07AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 17:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E8AC787B81
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 17:25:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ir8Qwgg3lcyp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 17:25:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7D7FB87AF4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 17:25:31 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id s5so9147972pfh.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Nov 2019 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fS+44pmIjjlReJvbKvVLf0765f8adwUSGR73BlaFD/U=;
 b=gN1Mo5UmYrqC9LVg7cuxwT9kHbAX4e9U8sAkLsBuYdVSrFUFqw22QS1Z/B8wbneb7d
 dLQfmhuY5Crymhhqhb6vUeTI8BFIw1Wxa0rac8lgf5qTfdytIz3NK5k8BUW/77UIdyi5
 DPoKy5aUe9ugU6Agh65jSohH5pngDGQVlceKbTsf9WC1ppcqJAb3j2epOKqkWoDfcZSN
 DgK3GxfRnjO2JabyVnKwF/L7w60u1hXnm0pRxRRB4BR4UexWd5x80qfJ/bLCmmDrFfRR
 mmHO+S8JGg/SonGAnUVDMsnmzmzzkerj4TYxOZnvll8hoSfrQvC8qZigbXWhiq62zl5D
 JPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fS+44pmIjjlReJvbKvVLf0765f8adwUSGR73BlaFD/U=;
 b=MZRNsAG/3s+SXh543OuHKkJt4FyzLxGxMqbsp5benCThItu3VHCbTu9SFAQ6VLsRfx
 lpCec7zlmX26YpB6ShgV5aU1rkI8R/+4cTZt7T0JtrhruSFenQb+eIcaf9mvJMJTlqU2
 Ydr7+op7kne6Vr9t7/qMWlJ5XyGJiHWwmr/fPPna1kGCtu4BogV2cf7UBchJQQkFM3Et
 VgbDUw2pEP9XLlQKF4a+1hzVuGpllEwBPQsOr6n3x3yDaO47FpdkNckX8h/RjAfq+eDZ
 edkXG9aS5eNSEdjHpBonft8N2wO0wjQJ6ZQmHrVm5hjhn3xxpY9mHtNJSR5tw2HScveO
 8lGg==
X-Gm-Message-State: APjAAAXUpaWs9GCyPJX/VSPyU0PyPxcOWcMj0Xm2qidP+T+QLJ4xbbLY
 i2h+F0N8k+ueJcaVPgAmhxs=
X-Google-Smtp-Source: APXvYqyzrnexkyZ2/csroq2Iu4YbCPUaAAitUKHbQ2dotMRGlWPLNDiu39qgc2cFVDa9qI92h1npfQ==
X-Received: by 2002:a63:395:: with SMTP id 143mr7407475pgd.93.1574011530823;
 Sun, 17 Nov 2019 09:25:30 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:1662:ba74:f9a6:2aa3:8a9a:5581])
 by smtp.googlemail.com with ESMTPSA id x13sm18146302pfc.46.2019.11.17.09.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 09:25:30 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: corbet@lwn.net
Date: Sun, 17 Nov 2019 22:54:36 +0530
Message-Id: <20191117172436.8831-4-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117172436.8831-1-jaskaransingh7654321@gmail.com>
References: <20191117172436.8831-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: mszeredi@redhat.com, ebiggers@google.com, jaskaransingh7654321@gmail.com,
 linux-doc@vger.kernel.org, neilb@suse.com, linux-kernel@vger.kernel.org,
 tobin@kernel.org, stefanha@redhat.com, mchehab+samsung@kernel.org,
 akpm@linux-foundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 christian@brauner.io, raven@themaw.net
Subject: [Linux-kernel-mentees] [PATCH v2 3/3] docs: filesystems: Add mount
	map description in Content
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

The second paragraph of the content section does not properly
describe how mount points are determined by autofs.

Replace the lines detailing how the determination of these mount
points is "ad hoc" by a short description of the mount map syntax
used by autofs.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 Documentation/filesystems/autofs.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/autofs.rst b/Documentation/filesystems/autofs.rst
index 2f704e9c5dc0..c17f6bf0eb5d 100644
--- a/Documentation/filesystems/autofs.rst
+++ b/Documentation/filesystems/autofs.rst
@@ -49,9 +49,10 @@ extra properties as described in the next section.
 Objects can only be created by the automount daemon: symlinks are
 created with a regular `symlink` system call, while directories and
 mount traps are created with `mkdir`.  The determination of whether a
-directory should be a mount trap or not is quite ad hoc, largely for
-historical reasons, and is determined in part by the
-*direct*/*indirect*/*offset* mount options, and the *maxproto* mount option.
+directory should be a mount trap is based on a master map. This master
+map is consulted by autofs to determine which directories are mount
+points. Mount points can be *direct*/*indirect*/*offset*.
+On most systems, the default master map is located at */etc/auto.master*.
 
 If neither the *direct* or *offset* mount options are given (so the
 mount is considered to be *indirect*), then the root directory is
-- 
2.21.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
