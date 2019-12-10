Return-Path: <SRS0=7tRB=2A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628A0C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Dec 2019 05:47:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36633206D5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Dec 2019 05:47:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5ge2jCJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36633206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 07C8485FBA;
	Tue, 10 Dec 2019 05:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNd668s8uzcs; Tue, 10 Dec 2019 05:47:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A489585FA6;
	Tue, 10 Dec 2019 05:47:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C613C1D7D;
	Tue, 10 Dec 2019 05:47:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFF55C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Dec 2019 05:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B834F878AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Dec 2019 05:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1pNof52qqkV4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Dec 2019 05:47:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 515EB878B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Dec 2019 05:47:11 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id s35so6922092pjb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Dec 2019 21:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4PpU18WVGfu8W1dzcx6BhI1zCSeD4MNelLQRqcNILww=;
 b=h5ge2jCJXFDHTh1fWNcu/9O+pouL8MOCQbEZhpeRILATJTIZodskMGyfBI0trwPGi9
 RZaUTiMU+QaERHsiq82S1P5zomu67JjhrxMvp7pmJIUN+c3X53bU7H9m++MkmmE7f1DM
 mUU5gP1MAfR0M1GnsQQy5AgMzTvwcIkNKALNGg/X0P4KEtvx2GyaeR/fB9T4n+TGmjnv
 tq3q54IYY9Aug9l8RDTHBAcWSCVh6wjC2cfAchZwxgNlP5i5DsaiBtjjlvY9YSZUL/WE
 NuuOx0uIGb29R7dROxL2LwG8o+5YM8KrBpP1i8/DlHG7gdgT2mom/aB7MmFbAeIvQW3d
 FpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4PpU18WVGfu8W1dzcx6BhI1zCSeD4MNelLQRqcNILww=;
 b=tFcRgqmzL5lKzAXc/NoRujs/EU1Ta3yifaCVknv+JurVbrIvJV7EQHRj68bkY8r3X+
 eb8nRWWmug6ec/TB4J/ynr+UW8rIb9RSxEzpk2Sm6kg/VVatnGHbLj4vKpajkYtjTpVQ
 tuOd9mvhbIZUb1Vnx6ggZs81G8cC/+8AajihLhfIIoy/J4d8kRqEXXg8C6mIHWP+SzcA
 rc3gDAFdI8pdxLhC2KxkXCXVFuLW1givUbgplEW5J3sHuCgcZWIhveP5V0bZzUIbCxmh
 lre283Y1VsW7b5Q3dHM8Yn83fgY6ySv6eLafLrAJF7CfVP5Bts9OBK6vP79FvGE9ceZ2
 BiLA==
X-Gm-Message-State: APjAAAXV6mYeWk9sf9KfNEybimWDl6HuHNFUu3J6Xv/I6Q6RUDwGmONM
 GpR2ABTYEy1zapbzme4tm1c=
X-Google-Smtp-Source: APXvYqxXXcF/D0VDW40F8ndwD793QLu7WN4Wy9SPAeh1eHSRmWB3nlsOnuscllQ1evZKi4Vqv4acSg==
X-Received: by 2002:a17:902:8649:: with SMTP id
 y9mr33737643plt.67.1575956830540; 
 Mon, 09 Dec 2019 21:47:10 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:13a2:ed96:d06d:42a7:9b38:e89c])
 by smtp.gmail.com with ESMTPSA id s2sm1433072pfb.109.2019.12.09.21.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 21:47:10 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: trond.myklebust@hammerspace.com, anna.schumaker@netapp.com,
 paulmck@kernel.org, joel@joelfernandes.org
Date: Tue, 10 Dec 2019 11:16:39 +0530
Message-Id: <20191210054639.30003-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: rcu@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] fs: nfs: dir.c: Fix sparse error
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

This patch fixes the following sparse error:
fs/nfs/dir.c:2353:14: error: incompatible types in comparison expression (different address spaces):
fs/nfs/dir.c:2353:14:    struct list_head [noderef] <asn:4> *
fs/nfs/dir.c:2353:14:    struct list_head *

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 fs/nfs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index e180033e35cf..b69370b6d317 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -2350,7 +2350,7 @@ static int nfs_access_get_cached_rcu(struct inode *inode, const struct cred *cre
 	rcu_read_lock();
 	if (nfsi->cache_validity & NFS_INO_INVALID_ACCESS)
 		goto out;
-	lh = rcu_dereference(nfsi->access_cache_entry_lru.prev);
+	lh = rcu_dereference(list_tail_rcu(&nfsi->access_cache_entry_lru));
 	cache = list_entry(lh, struct nfs_access_entry, lru);
 	if (lh == &nfsi->access_cache_entry_lru ||
 	    cred != cache->cred)
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
