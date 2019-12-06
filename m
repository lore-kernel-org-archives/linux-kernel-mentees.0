Return-Path: <SRS0=164v=Z4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA75AC2BBE2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 15:16:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B8A924680
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Dec 2019 15:16:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVlSO2YV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B8A924680
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 563312045A;
	Fri,  6 Dec 2019 15:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AX3JysGFBimc; Fri,  6 Dec 2019 15:16:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CE82320436;
	Fri,  6 Dec 2019 15:16:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C35AEC18DD;
	Fri,  6 Dec 2019 15:16:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB0BCC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 15:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E7D8B20436
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 15:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PU9tHfB0vJzX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 15:16:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 7D8B62045A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Dec 2019 15:16:55 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x8so3453509pgk.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Dec 2019 07:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6GWdj6y1nIV1eqL/pgj2JGP5rsvKIeTR5YWuhE4vOTY=;
 b=PVlSO2YVN3FeJTHTFmDpe1abRzd3fIG/Wb/SlhKPEvqxWzPRmvzhmwRWJ2DroUirAe
 R68I9pxVWm0rDrRh3snMBO/mf3UKsVQ7YbfY38rS1+BUogpEjp49LFzgc0p3dB1sGIkp
 oL3oZpD48wqhyfh+gIvqhPUJ3BKi03PwX/BQRZLGt2K6o1UxgUfPKNJhx/yPHa6zF7Dw
 xf6W1sQazT+ip4sj92f+SOnfPFsEy0VL2FApQVupSSrB8RREvhBpEWBtxj8Xaktef4qA
 iwCeHBVsofPrSR64f4sg698v5gs8DmlY+41jQs9YubNvqfRjiLtqUgb7sNcBH9Gtju0e
 IeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6GWdj6y1nIV1eqL/pgj2JGP5rsvKIeTR5YWuhE4vOTY=;
 b=G0YDXtIDCy4wLWqWkm6qKDgVls+x49B0Z6uMTJb18ai5Q96IEwQ0ni9qgn4yzU1aWZ
 vphe7WqgmJ1hd73lKyS2V2COKopKRXX/GOpPTlN33WpR08tPYZaXPh1S3/v7RCnqIyg0
 efUcLpqm6+/aehDAu64qOdZBOD4XeO7ayQ5U59WvXL5chBvM6R9SU7GHZ+EyeWUDjdzE
 i11V4RicgetP+1OKPeRfFRUbThBPq2Q+eey8+jvpeVUANkZKEH6FvimaTHvvwFKsUc9z
 njVdUUdxNy3Ejrn9QjgvEK0NMWhHJXuQ8Fn9khuzflvvHCiKYYh9L+I/GQIyVX1ykh8C
 tDOw==
X-Gm-Message-State: APjAAAX7ztMO2KRC0wjdXfnTWaVP81myahcQWst35q/M+LUt1CC3TF/w
 cwdXV7Z2babuzj6bmU8GvAQ=
X-Google-Smtp-Source: APXvYqzZ9KMg19p5ONeiAHEBTca+aoW7E5AL7NEeTSr5C0MAtK8IEDbyN5RDrBKtODwXj+GbqhyXUQ==
X-Received: by 2002:a65:49ca:: with SMTP id t10mr4109186pgs.37.1575645414671; 
 Fri, 06 Dec 2019 07:16:54 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:13a2:f129:b905:c312:4008:2416])
 by smtp.gmail.com with ESMTPSA id o19sm5859347pjr.2.2019.12.06.07.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 07:16:54 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: trond.myklebust@hammerspace.com, anna.schumaker@netapp.com,
 joel@joelfernandes.org
Date: Fri,  6 Dec 2019 20:46:40 +0530
Message-Id: <20191206151640.10966-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: rcu@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] fs: nfs: dir.c: Fix sparse error
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

This patch fixes the following errors:
fs/nfs/dir.c:2353:14: error: incompatible types in comparison expression (different address spaces):
fs/nfs/dir.c:2353:14:    struct list_head [noderef] <asn:4> *
fs/nfs/dir.c:2353:14:    struct list_head *

caused due to directly accessing the prev pointer of
a RCU protected list.
Accessing the pointer using the macro list_prev_rcu() fixes this error.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 fs/nfs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index e180033e35cf..2035254cc283 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -2350,7 +2350,7 @@ static int nfs_access_get_cached_rcu(struct inode *inode, const struct cred *cre
 	rcu_read_lock();
 	if (nfsi->cache_validity & NFS_INO_INVALID_ACCESS)
 		goto out;
-	lh = rcu_dereference(nfsi->access_cache_entry_lru.prev);
+	lh = rcu_dereference(list_prev_rcu(&nfsi->access_cache_entry_lru));
 	cache = list_entry(lh, struct nfs_access_entry, lru);
 	if (lh == &nfsi->access_cache_entry_lru ||
 	    cred != cache->cred)
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
