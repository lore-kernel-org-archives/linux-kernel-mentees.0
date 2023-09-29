Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4FBE743EC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 Sep 2023 06:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF13A41DBB;
	Fri, 29 Sep 2023 06:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF13A41DBB
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailo.com header.i=@mailo.com header.a=rsa-sha256 header.s=mailo header.b=BT5FFlQp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNFqx2NS9hoX; Fri, 29 Sep 2023 06:15:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 11A7841A60;
	Fri, 29 Sep 2023 06:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11A7841A60
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5671C0071;
	Fri, 29 Sep 2023 06:15:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9104C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 06:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8852581F90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 06:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8852581F90
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=mailo.com header.i=@mailo.com
 header.a=rsa-sha256 header.s=mailo header.b=BT5FFlQp
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gq7uBFDbKcJ9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 06:15:06 +0000 (UTC)
Received: from mailo.com (msg-1.mailo.com [213.182.54.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 044A781F72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 06:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 044A781F72
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1695968086; bh=sUtnhl+BN0pAXgvT1VA9dfcxtXJrnbj9wF0wciOqpdA=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=BT5FFlQpPpYYiLWCg0obrQwHB6L2jyl1IDQj4NY5PfCuvzM71FERDYaVd2NdJ48Pq
 Cchkcw4ji4i6zgQbnC7a3yMpUUgBsHN/bIIiBwonfYk/btOo0uizwSWjwhn7wzkPOl
 G7fnpFFwQLvucAEwRU5T1RZn/pRHsU9gHvLyAhiw=
Received: by b221-3.in.mailobj.net [192.168.90.23] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Fri, 29 Sep 2023 08:14:46 +0200 (CEST)
X-EA-Auth: mJrxcB5o/rp3CdNHoV+lGMylfQKBbaAvaC4JHT2Uwm3geFEykZ96si8l7FTXLh3ZxpTAt34dRlCrz8K4QFKtJ4AC9NHhu1Tb
Date: Fri, 29 Sep 2023 11:44:40 +0530
From: Deepak R Varma <drv@mailo.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gfs2: Set error on error path
Message-ID: <ZRZrUMzweaJeEJuD@runicha.com>
MIME-Version: 1.0
Content-Disposition: inline
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <error27@gmail.com>
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

Set the error variable inside the error path on failure. Saves
unnecessary variable assignment during normal execution.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 fs/gfs2/bmap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index ef7017fb6951..93bd8ea34444 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -162,9 +162,10 @@ int gfs2_unstuff_dinode(struct gfs2_inode *ip)
 
 	down_write(&ip->i_rw_mutex);
 	page = grab_cache_page(inode->i_mapping, 0);
-	error = -ENOMEM;
-	if (!page)
+	if (!page) {
+		error = -ENOMEM;
 		goto out;
+	}
 	error = __gfs2_unstuff_inode(ip, page);
 	unlock_page(page);
 	put_page(page);
-- 
2.39.2



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
