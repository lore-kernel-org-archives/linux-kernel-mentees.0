Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69441E743E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 Sep 2023 05:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFF0B40914;
	Fri, 29 Sep 2023 05:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFF0B40914
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailo.com header.i=@mailo.com header.a=rsa-sha256 header.s=mailo header.b=do/G6q9r
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2QkXvlo0S7CC; Fri, 29 Sep 2023 05:14:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 84F094060B;
	Fri, 29 Sep 2023 05:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84F094060B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58073C0039;
	Fri, 29 Sep 2023 05:14:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52C9CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 05:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 199CB40914
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 05:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 199CB40914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5m1rIqRrWU9C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 05:14:39 +0000 (UTC)
X-Greylist: delayed 39991 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 29 Sep 2023 05:14:39 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F4264060B
Received: from mailo.com (msg-4.mailo.com [213.182.54.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F4264060B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 05:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1695964460; bh=5TrBxRkf8axAboRq5eJan1h4q+4K8csemq/WK/VP9ZA=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=do/G6q9r/tlorBmTdac9FvUvIjtHyBXdJqg2ExEi6A3UgQ2kL1IuO8CIXkKPo4iVv
 0Ih7El6ezPjRTCOtJ5bZol3iNCoIpDlBsXxUhxqGuqjI79z3y1UB08uD8TRI0/fOOW
 UCai0Mi8pDHABqMbn1jj8VaW/OBcdNEVXteTkniQ=
Received: by b221-5.in.mailobj.net [192.168.90.25] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Fri, 29 Sep 2023 07:14:20 +0200 (CEST)
X-EA-Auth: tVqjOmq4lkR80hgPN1Q6rvpztdtUdTqm+kt5z3NoCdz7P1X7GYld++tOOVSzXEg4yFVPF8nuORj/+y7BiDt+O1Bd4GglWdfR
Date: Fri, 29 Sep 2023 10:44:16 +0530
From: Deepak R Varma <drv@mailo.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gfs2: No need to be "extern" at the time of definition
Message-ID: <ZRZdKAmDjrpCQLwE@runicha.com>
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

No need to for the extern keyword at the time of function definition.
Remove it to silence the following Smatch warnings:
fs/gfs2/super.c:1579:13: warning: function 'free_local_statfs_inodes' with external linkage has definition
fs/gfs2/super.c:1594:21: warning: function 'find_local_statfs_inode' with external linkage has definition

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 fs/gfs2/super.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 02d93da21b2b..fad36ed89853 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1576,7 +1576,7 @@ static void gfs2_free_inode(struct inode *inode)
 	kmem_cache_free(gfs2_inode_cachep, GFS2_I(inode));
 }

-extern void free_local_statfs_inodes(struct gfs2_sbd *sdp)
+void free_local_statfs_inodes(struct gfs2_sbd *sdp)
 {
 	struct local_statfs_inode *lsi, *safe;

@@ -1591,8 +1591,7 @@ extern void free_local_statfs_inodes(struct gfs2_sbd *sdp)
 	}
 }

-extern struct inode *find_local_statfs_inode(struct gfs2_sbd *sdp,
-					     unsigned int index)
+struct inode *find_local_statfs_inode(struct gfs2_sbd *sdp, unsigned int index)
 {
 	struct local_statfs_inode *lsi;

--
2.39.2



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
