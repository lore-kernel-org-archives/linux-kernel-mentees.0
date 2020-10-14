Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CC9C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 16:32:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37EB222247
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 16:32:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u+lHNhA0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37EB222247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6367F2E2AC;
	Wed, 14 Oct 2020 16:32:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QdYZ6pRRDnlK; Wed, 14 Oct 2020 16:32:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8CE6D2E2B0;
	Wed, 14 Oct 2020 16:32:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A58CC0052;
	Wed, 14 Oct 2020 16:32:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2EF1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 16:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 63CB420476
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 16:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TlxEdIUghC9Z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 16:32:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 61CDB2E2B4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 16:31:18 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c20so104276pfr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+yEsILmCKm0hRP0CDuXEGc8J5t+QTwZ1G0jbK/IVGEU=;
 b=u+lHNhA0jCyKVpHsRJQylUByW/6d565Up3FzoLS2DeENWbTwd6NINIGV5+Xo802SGR
 3SI4cVLxQchfO1lAfgu7+m7Q/CJPgEXKarVxmxDZlzpCINW/GVsuh4sB1ymgLTRS1WoX
 8WMUcMNkoMVjTo2oQn8RfwMthBAouoiKsz75r0ybPqEaoeGNtjZl0EaNRvdsStBAo3bG
 diCANTLBvEhDYIWMiqhjN3iFLugrMRSlfZxVNXutkqp95IjgInL5A39QU3qyvQThDu/y
 PUd/HlAiDnnqDXH4mj4o8Bxn+zkyNSwVCsSVS9RnkfPhRBXi9LxHsMgVAxYWPng/xpDX
 m3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+yEsILmCKm0hRP0CDuXEGc8J5t+QTwZ1G0jbK/IVGEU=;
 b=djOesxYcRWhqzexH9fsmiwfvFANBwmxvdKV8IU13dZKEJ5S78cUpZLybb1NXL9zh2X
 T8J1oqi+ovVYgzM/qeL2Zi2dNcw7/GuS3rA8SLTt+umBpi67UAsNnFm+irwppLa/fjIP
 wMXFcmddhe9fql4rf4ZLaikchthxX+wXFjX4xBRCPiSb4pOdv8ni5Bp9FDgSFsYysoYO
 JTIyLCoOJ/vOU7rOO/EMVoRFFtvGJ9EcFVJYvLhjvQWAO7TaNOR7eFiOqdP+4pWphkCA
 Z3e51Pwg+z5QuDKZi/vWlmscHDjOkNx6NniiPf9xCAsuRorpisZfseRzgcvDO3j6KtfR
 YWhA==
X-Gm-Message-State: AOAM531eAPF9FsMTs0wIhlTl3cNkyYbvrK0wLd/vKtwuiD3XApPHUJG3
 g/8sQiiUSeii7lu75BNG9bI=
X-Google-Smtp-Source: ABdhPJwyQXihDVRWBXi0WjOtJZqEDftaWw5l/BGfz0TLHIP67jMv4+mMDOtseTATUXKS47KyOWSEgA==
X-Received: by 2002:a63:d257:: with SMTP id t23mr4664803pgi.212.1602693077702; 
 Wed, 14 Oct 2020 09:31:17 -0700 (PDT)
Received: from localhost.localdomain ([49.207.205.44])
 by smtp.gmail.com with ESMTPSA id i9sm10919pgc.71.2020.10.14.09.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 09:31:16 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: anprice@redhat.com,
	agruenba@redhat.com,
	rpeterso@redhat.com
Date: Wed, 14 Oct 2020 22:01:09 +0530
Message-Id: <20201014163109.98739-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: anant.thazhemadam@gmail.com,
 syzbot+af90d47a37376844e731@syzkaller.appspotmail.com, foxhlchen@gmail.com,
 linux-kernel@vger.kernel.org,
 syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com,
 cluster-devel@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] fs: gfs2: add validation checks
	for size of superblock
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

In gfs2_check_sb(), no validation checks are performed with regards to
the size of the superblock.
syzkaller detected a slab-out-of-bounds bug that was primarily caused
because the block size for a superblock was set to zero.
A valid size for a superblock is a power of 2 between 512 and PAGE_SIZE.
Performing validation checks and ensuring that the size of the superblock
is valid fixes this bug.

Reported-by: syzbot+af90d47a37376844e731@syzkaller.appspotmail.com
Tested-by: syzbot+af90d47a37376844e731@syzkaller.appspotmail.com
Suggested-by: Andrew Price <anprice@redhat.com>
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---

Changes in v2:

	* Completely dropped the changes proposed in v1. Instead,
	  validity checks for superblock size have been introduced. 
	  (Suggested by Andrew Price<anprice@redhat.com>)

	* Addded a "Suggested-by" tag accrediting the patch idea to
	  Andrew. If there's any issue with that, please let me know.

	* Changed the commit header and commit message appropriately.

	* Updated "Reported-by" and "Tested-by" tags to the same instance
	  of the bug that was detected earlier (non consequential change).


 fs/gfs2/ops_fstype.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 6d18d2c91add..f0605fae2c4c 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -169,6 +169,13 @@ static int gfs2_check_sb(struct gfs2_sbd *sdp, int silent)
 		return -EINVAL;
 	}
 
+	/* Check if the size of the block is valid - a power of 2 between 512 and  PAGE_SIZE */
+	if (sb->sb_bsize < 512 || sb->sb_bsize > PAGE_SIZE || (sb->sb_bsize & (sb->sb_bsize - 1))) {
+		if (!silent)
+			pr_warn("Invalid superblock size\n");
+		return -EINVAL;
+	}
+
 	/*  If format numbers match exactly, we're done.  */
 
 	if (sb->sb_fs_format == GFS2_FORMAT_FS &&
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
