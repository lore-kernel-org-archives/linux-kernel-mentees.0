Return-Path: <SRS0=/i4J=Z2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC85C2D0B1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 20:19:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F63021823
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 20:19:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZ4USlEM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F63021823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 31C2E86EFD;
	Wed,  4 Dec 2019 20:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvKuOY71E4wL; Wed,  4 Dec 2019 20:19:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CF79686EC7;
	Wed,  4 Dec 2019 20:19:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC3F6C1DD6;
	Wed,  4 Dec 2019 20:19:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7181CC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 20:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5E12B232D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 20:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJ4rQL9Jb0ys
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 20:19:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id B6E792036E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 20:19:17 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x13so181838plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Dec 2019 12:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=IdpmGu8iGR4pu9wN40g1Va4Rxg/xN1WVWM43oFtOZuc=;
 b=GZ4USlEMGXv34THmiUPdaunV9mU1mXLwjquzOhYT1UTMPxHQXdwfl8TSoecTFZNaLm
 4gM1RC87AWfGad075jZwJvO8b9Yfm2KDvrnt5mqrmxh4cziVMfaEQBKEZ/0AybZ/xXoz
 YS2Mfgigc4PcZCQvBCgFFDbxnIj2X2wAh/xCfEH1gdYUlsK+LB1CCoofz+d/jHqQJapf
 PSpmyHGUncjfB2tcWDiMGG4OP0iI818+PbMGW2MxVg4MIOnTEdaTSctO7ri2XtS2L3JH
 CHxnyvqr5Q67K1kOmvFRw4AFYG4Y8KSa7KzryXc0iaO7CoEPJC06vXsOsV6+cF/Vys/6
 0HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IdpmGu8iGR4pu9wN40g1Va4Rxg/xN1WVWM43oFtOZuc=;
 b=nJ8yd/ikGh1q+uA/vCQU8ORL9wAxaDvZ8OKwUkHxeDBf25cQqn60z0eS7LYkNhc3up
 HHqk76XjNj12q16lQOfFN+uOp5VJww/2omzpttjKS0I/zhaRH5Xsf1ZZOfTBjbT102le
 zWj8ecyCgNrlX1FYrym3koPyOOBJdm2S23yg+9AiBVZ2uQb8ggldMseCfddjnWx/+ePI
 8a25UqERzcff/Mltq7Lx2tzIblM5aeFL6vbAPCbYbCnc6p8TiUklqsLyCyvr7S3eoQya
 FoAR1awpkVf959PxNfYWGaUKX2wIHcXZ0Wbrh6hbYpTGAYDWvj5wXQUkaaReLoUNf9HW
 LXfQ==
X-Gm-Message-State: APjAAAUS//nSKWm+g7cFwiAY/nByVXa9SrWE6dXR6+5LTbMZDwbtWfop
 +1bZPB3NC5UILyRjUGeQnOE=
X-Google-Smtp-Source: APXvYqyym3aLJWp4bkO/UDgkjJGP80l8ErW34GumqKw5caVpvJNp1FIFrFHrA4GfR/q8GtM7lsaqFg==
X-Received: by 2002:a17:90a:200d:: with SMTP id
 n13mr5388240pjc.16.1575490756959; 
 Wed, 04 Dec 2019 12:19:16 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:cdb:9473:3984:ab1:9b44:803])
 by smtp.gmail.com with ESMTPSA id
 c2sm8882170pfn.55.2019.12.04.12.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 12:19:16 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: clm@fb.com, josef@toxicpanda.com, paulmck@kernel.org,
 joel@joelfernandes.org
Date: Thu,  5 Dec 2019 01:49:01 +0530
Message-Id: <20191204201901.22466-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: rcu@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] fs: btrfs: volumes.h: Annotate
	rcu_string with __rcu
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

From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

This patch fixes the following sparse errors in
fs/btrfs/super.c in function btrfs_show_devname()

fs/btrfs/super.c: error: incompatible types in comparison expression (different address spaces):
fs/btrfs/super.c:    struct rcu_string [noderef] <asn:4> *
fs/btrfs/super.c:    struct rcu_string *

The error was because of the following line in function btrfs_show_devname():

if (first_dev)
       seq_escape(m, rcu_str_deref(first_dev->name), " \t\n\\");

rcu_str_deref is defined in fs/btrfs/rcu-string.h

And first_dev is of type struct btrfs_device.

struct btrfs_device is defined in fs/btrfs/volumes.h

Annotating the member  "struct rcu_string *name "  of struct btrfs_device
with __rcu fixes the sparse error.

Acked-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 fs/btrfs/volumes.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/volumes.h b/fs/btrfs/volumes.h
index a7da1f3e3627..de7131ee604d 100644
--- a/fs/btrfs/volumes.h
+++ b/fs/btrfs/volumes.h
@@ -64,7 +64,7 @@ struct btrfs_device {
 	struct btrfs_fs_devices *fs_devices;
 	struct btrfs_fs_info *fs_info;
 
-	struct rcu_string *name;
+	struct rcu_string __rcu *name;
 
 	u64 generation;
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
