Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF24EC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 15:27:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F37324923
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 15:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFGW2HPc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F37324923
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 95B7B2E124;
	Tue, 13 Oct 2020 15:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqvQfH68XoZd; Tue, 13 Oct 2020 15:26:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 951FE203F8;
	Tue, 13 Oct 2020 15:26:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84F38C0052;
	Tue, 13 Oct 2020 15:26:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C263C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 15:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5B00E87933
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 15:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qWPo0zmxjfbv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 15:26:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7F8A286D58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 15:26:57 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id w21so8150plq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=59HsEt/qRATYcWGWkuFwFGhFUgu5MJlwW4EIEwWX704=;
 b=XFGW2HPcF0bwYa4rREkERsaYSG9qW8MjsUxPPxWUdIuswX1vrlj9/BcvWU161hj2Kw
 UUwiCVMXAfk1Vo2cdkrBJeR7xxf3eG2Q5wCzjMu6Z20azV6h9P9OVxA/7v/wb0ecBynM
 2nQ7aMxsW1kiNYg1oFTfUg3RSZVVrGlSCaUjeicNO4TNd6PJ6Qmw1o+StpDcGH3i3cC9
 6np4gaGiIa71OfUJUlXkFXfHwYP5cbnf7SoTR2AkaZdAjtPAMysG7zXrtrAT39eT6MAm
 +ZcB+/kpgaO9qDL1deE2njmPQEm0cfYEVq+5L2hhzdnbhmWUN92RGNgDIRQ1cOuSTVpN
 JEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=59HsEt/qRATYcWGWkuFwFGhFUgu5MJlwW4EIEwWX704=;
 b=iBejWwUN1D8809qrQBbzUAluVqh+TWJzQsoC4WB5HubSZFrJm0GDsmAZF2D+kk4tu+
 q+7AK9eCbv456q2Mw5GpflE9mA+d3ADOAiXAdw1IfpTS3FxfeFLm5ExtLFuLj2hMuJq5
 fYvqGCQeuSACCzGpQ5h+p0fFciarPC0lQQkGtTH5UDancU3alo1r7b8I+AKbbv+yIBY9
 SqhWvLbxJCHFrKr8j8bisgauX7+Mr5iuCtX3AoPT1PBqcX8jJohfdT2LsMrXlli+ABd5
 MlzwBN2dUbNY7I6oCxDXUoizSZxovajXYZTH2W1nEPNykmYiGC0VJhVvuKCJsFZkH+Rm
 YYyA==
X-Gm-Message-State: AOAM531i2SLLKwG1KNTQ/Au1qQLRRj/+wyuknjbBFm0jfYgIB6j3/IFU
 UsXxGKuBpxWEJBKT8RRgvb4=
X-Google-Smtp-Source: ABdhPJxxkc2XNHdUqAyT+6mTSLMdWeQ+/wMyG2H1zQOiyaZ972G084d2ZeNANQpUZBGYnk25yE4X5g==
X-Received: by 2002:a17:902:8c8b:b029:d2:42fe:370a with SMTP id
 t11-20020a1709028c8bb02900d242fe370amr20231plo.83.1602602816797; 
 Tue, 13 Oct 2020 08:26:56 -0700 (PDT)
Received: from localhost.localdomain ([49.207.205.44])
 by smtp.gmail.com with ESMTPSA id 78sm23768794pfz.211.2020.10.13.08.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 08:26:56 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: rpeterso@redhat.com,
	agruenba@redhat.com
Date: Tue, 13 Oct 2020 20:56:48 +0530
Message-Id: <20201013152648.438887-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: cluster-devel@redhat.com, anant.thazhemadam@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com
Subject: [Linux-kernel-mentees] [PATCH] fs: gfs2: prevent OOB access in
	gfs2_read_sb()
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

In gfs2_read_sb(), if the condition
	(d != sdp->sd_heightsize[x - 1] || m)
isn't satisfied (in the first 11 iterations), the loop continues,
and begins to perform out-of-bounds access.
Fix this out-of-bounds access by introducing a condition in the for loop
that ensures that no more than GFS2_MAX_META_HEIGHT + 1 elements are
accessed.

In addition to this, if the above condition is satisfied when
x = GFS2_MAX_META_HEIGHT (which = 10), and the flow of control breaks
out of the loop, then an out-of-bounds access is performed again while
assigning sdp->sd_heightsize[x] = ~0 (since x would be 11 now.), and
also the assertion that spd->sd_max_height <= GFS2_MAX_META_HEIGHT would
fail.
Fix this out-of-bounds access and ensure that the assertion doesn't fail
by introducing another variable "index", which keeps track of the last
valid value of x (pre-increment) that can be used.

Reported-by: syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com
Tested-by: syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---

I have one question here (potentially a place where I suspect this
patch could have a fatal flaw and might need some rework).

	sdp->sd_max_height = x;
	sdp->sd_heightsize[x] = ~0;

Were these lines written with the logic that the value of x would be
equal to (sdp->sd_heightsize[]'s last index filled in by the loop) + 1?
Or, is the expected value of x at these lines equal to 
(sdp->sd_heightsize[]'s last index as filled in by the loop)?
I would appreciate it if someone could clarify for me, how this would 
hold against the second potential out-of-bounds access I mentioned in my
commit message.

An additional comment (which I feel is of some significance) on this.
Reproducing the crash locally, I could infer that sdp->sd_fsb2bb_shift
sdp->sd_sb.sb_bsize, sdp->sd_sb.sb_bsize_shift, and sdp->sd_inptrs
were all 0.
This by extension also means that in gfs2_read_sb(), all the attributes
whose values were determined by performing some sort of calculation 
involving any one of these variables all resulted in either 0 or a 
negative value.
Simply doing the math will also show how this was also the primary reason
this OOB access occured in the first place. 
However, I still feel that gfs2_read_sb() could do with this bit of checking, 
since it fundamentally prevents OOB accesses from occuring in gfs2_read_sb()
in all scenarios.
Anyways, coming back to my initial point. Can having values like that be 
considered unacceptable and as something that needs to be handled (at 
gfs2_fill_super() maybe?) or is this non-anomalous behaviour and okay?

 fs/gfs2/ops_fstype.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 6d18d2c91add..66ee8fb06ab9 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -281,7 +281,7 @@ static int gfs2_read_sb(struct gfs2_sbd *sdp, int silent)
 {
 	u32 hash_blocks, ind_blocks, leaf_blocks;
 	u32 tmp_blocks;
-	unsigned int x;
+	unsigned int x, index;
 	int error;
 
 	error = gfs2_read_super(sdp, GFS2_SB_ADDR >> sdp->sd_fsb2bb_shift, silent);
@@ -329,20 +329,21 @@ static int gfs2_read_sb(struct gfs2_sbd *sdp, int silent)
 	sdp->sd_heightsize[0] = sdp->sd_sb.sb_bsize -
 				sizeof(struct gfs2_dinode);
 	sdp->sd_heightsize[1] = sdp->sd_sb.sb_bsize * sdp->sd_diptrs;
-	for (x = 2;; x++) {
+	for (x = 2; x <= GFS2_MAX_META_HEIGHT; x++) {
 		u64 space, d;
 		u32 m;
 
-		space = sdp->sd_heightsize[x - 1] * sdp->sd_inptrs;
+		index = x;
+		space = sdp->sd_heightsize[index - 1] * sdp->sd_inptrs;
 		d = space;
 		m = do_div(d, sdp->sd_inptrs);
 
-		if (d != sdp->sd_heightsize[x - 1] || m)
+		if (d != sdp->sd_heightsize[index - 1] || m)
 			break;
-		sdp->sd_heightsize[x] = space;
+		sdp->sd_heightsize[index] = space;
 	}
-	sdp->sd_max_height = x;
-	sdp->sd_heightsize[x] = ~0;
+	sdp->sd_max_height = index;
+	sdp->sd_heightsize[index] = ~0;
 	gfs2_assert(sdp, sdp->sd_max_height <= GFS2_MAX_META_HEIGHT);
 
 	sdp->sd_max_dents_per_leaf = (sdp->sd_sb.sb_bsize -
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
