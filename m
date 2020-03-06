Return-Path: <SRS0=axgb=4X=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB57C3F2D5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Mar 2020 06:53:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93F3C20848
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Mar 2020 06:53:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cI9wU8hP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93F3C20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C2DA8011C;
	Fri,  6 Mar 2020 06:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8pM2LhSksVsU; Fri,  6 Mar 2020 06:53:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A4B5A86E68;
	Fri,  6 Mar 2020 06:53:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 912DEC18DA;
	Fri,  6 Mar 2020 06:53:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 011D1C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 06:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DD52486745
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 06:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cy0p0m5JbUxt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 06:53:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7A1A48671E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 06:53:28 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 2so618069pfg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Mar 2020 22:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=k8lKr+jkEueNL9fiDMUF+wF+sa4NlM0pOjvW8vJZPto=;
 b=cI9wU8hPNsjkX13N5xuTNuhILzY8O37rL4z49B2r3Sl2m+mTrOpiijZrJ+s1hZy9JF
 Ffh37HbRNWMdQSWID4UP9DwYCCUZvqlesBGTlCZUNcaLW+nAAXYat0ZZRPLh1vjWXOK2
 EmOuLRn0bARfNXVKwuH5TT1eSKzAvkiDVhoOXYZMnXqsKrNnw08CGnaycDboR2/D2xNa
 V1KsrJmo+2XUu6C66+gD0PLVG4IR5WviMRkJc3cv5BaERJLRT5BW+bi1Bk07knJ5dZa5
 94Co+hy/mTXKtWefGbrGYv1tk19yg/lYfDkKaY+7obsLDdCb22T/aG5LSxqOdB0nidwr
 5OWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=k8lKr+jkEueNL9fiDMUF+wF+sa4NlM0pOjvW8vJZPto=;
 b=WVqBECHILKIzDBXweCE+jCREXM9GCUMXQmJfOC9Rv747fIlwofZwuDSjtfONVk8WVj
 0v27Y1XqDN45A305Y/E4zNLt28pBaW7wf0DMqPgnyicpU7nyzDAFjB12QJWpUDVuUxbO
 SBRlkivtihfcvcMscnwqMxSu4+FaxzRGykroKpdzlcw5Jbjg1HEigYFNiifMR0DTapES
 Uii0QcKF6GZV5qVmhCI8mnsW+KraA7C8j8DldJI2uMdDQbyQ/n7l6/k7FruqYMXU79ng
 v7+XjY59tmtV2ed/f9fxJ4TknmLiWeend6Y6IHc7y2nPLH+m1zZiAAU/WMi0fC0MbrpA
 NKhA==
X-Gm-Message-State: ANhLgQ1QWakg8yu5ozUk6qlTfkPYSqQcWh3IIVuct6yApXcUG9K9vP0F
 4BdxaS67KFeLCROG9heGjg==
X-Google-Smtp-Source: ADFU+vvgZDVNdDty/pVQK/EdyGZRM6m0eDOduutl9e91mTg0oLWSDt9J1tBnaAKE5BZ2ypVbyfltiQ==
X-Received: by 2002:a63:4a19:: with SMTP id x25mr1943435pga.167.1583477607968; 
 Thu, 05 Mar 2020 22:53:27 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee2:ecde:d483:e483:cccb:2577])
 by smtp.gmail.com with ESMTPSA id x2sm32683411pge.2.2020.03.05.22.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 22:53:27 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: clm@fb.com,
	josef@toxicpanda.com,
	dsterba@suse.com
Date: Fri,  6 Mar 2020 12:22:43 +0530
Message-Id: <20200306065243.11699-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, linux@roeck-us.net,
 joel@joelfernandes.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-btrfs@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] fs: btrfs: block-group.c: Fix
	suspicious RCU usage warning
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

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

The space_info list is rcu protected.
Hence, it should be traversed with rcu_read_lock held.

Warning:
[   29.104591] =============================
[   29.104756] WARNING: suspicious RCU usage
[   29.105046] 5.6.0-rc4-next-20200305 #1 Not tainted
[   29.105231] -----------------------------
[   29.105401] fs/btrfs/block-group.c:2011 RCU-list traversed in non-reader section!!

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 fs/btrfs/block-group.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/block-group.c b/fs/btrfs/block-group.c
index 404e050ce8ee..9cabeef66f5b 100644
--- a/fs/btrfs/block-group.c
+++ b/fs/btrfs/block-group.c
@@ -1987,6 +1987,7 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
 		btrfs_release_path(path);
 	}
 
+	rcu_read_lock();
 	list_for_each_entry_rcu(space_info, &info->space_info, list) {
 		if (!(btrfs_get_alloc_profile(info, space_info->flags) &
 		      (BTRFS_BLOCK_GROUP_RAID10 |
@@ -2007,7 +2008,8 @@ int btrfs_read_block_groups(struct btrfs_fs_info *info)
 				list)
 			inc_block_group_ro(cache, 1);
 	}
-
+	rcu_read_unlock();
+		
 	btrfs_init_global_block_rsv(info);
 	ret = check_chunk_block_group_mappings(info);
 error:
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
