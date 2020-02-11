Return-Path: <SRS0=w6iK=37=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88933C352A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ABB3206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:41:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEvSzwwn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ABB3206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A74A86EA3;
	Tue, 11 Feb 2020 12:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dXHoeTRtWj9V; Tue, 11 Feb 2020 12:41:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C90138733F;
	Tue, 11 Feb 2020 12:41:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B88EBC1D88;
	Tue, 11 Feb 2020 12:41:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5ABFC07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C4BD2204C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ShJkO0nRu9nd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 3705E2033E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:41:37 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 6so5693820pgk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TdXzoooEIwf4ECqrrOyZqFRyKlMHXHMskvPfQQwPS7E=;
 b=IEvSzwwneqbrWvn0yZfOQ8OI5Gx2Xqj+HuJBwWaGc9IlERBIIVUTOIYLrzYBxSUQLe
 c6Koy9B/KXvnB7TNRK8ww8kRgz1j0RlADFiOnCRBZp0ID0pW48kbCCvncDs/HkmzT9P4
 sMc6wmN1JoHpUG7Nt50vzVGXyPYMUcWrBUp+tTsJUh0RhGM6oginC4bV0SZeEm/PlE1D
 ojQguIwFKb+yCcXvAWZQVI8fDFHlObqhomH7haIcTwKsZuTI3ObYeXpFkFTox6ZmDwJf
 9P4smkcakc4O5yxjZP0Z5dEg5vlOHSwIkokl66LVrK3PU7VJD3N9SuqhaH5sTEYa3lX0
 ea0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=TdXzoooEIwf4ECqrrOyZqFRyKlMHXHMskvPfQQwPS7E=;
 b=VyH0WAFSwTXsFUSCn+HVkAvNimcjAHV+yK+TutlaqAW3/cfUK0/yu1s8UCL/fYkGIj
 Xpvx65LyYmdnq6LE4cnpbuo8cM1i/AtrzngnndiB/FDKnU7FBB+lBKUuef5Ep4mgFm6X
 EMoCGE4mEkTQWEUEOaEPiTrm5ytFsi87+fahkHPKRJjoc2UKz+s5+bnU6fSY/BRcup2f
 8P4I3DOmHA21iBAPUKsVC1DGZ8aE9f/65LPVPOFjPVsiErKTB2KJ5Txd8tm+518uqMIW
 4fpnA+d6x1Zj72nGbnmieZXe633JbHddoIWgUj5zyKPX8YUhoSAmIT5l4UPwUnFvIq0G
 wAnw==
X-Gm-Message-State: APjAAAVBOep+cr3FgUDpKZ/3rw0vV6AfE2pNqB35NN5Xbje/+2ZqGcUH
 6S0E8fNeZ7ypfnThJFBjyVY=
X-Google-Smtp-Source: APXvYqwW3SeV5oqKeTuPUMR1CRE3AykgBtR8wfS55TL6bOFQFHYfM0bSw39qTBYoUArq3lqwkpolDw==
X-Received: by 2002:a63:8b44:: with SMTP id j65mr6569696pge.272.1581424896843; 
 Tue, 11 Feb 2020 04:41:36 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:41:36 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:55 +0530
Message-Id: <20200211123859.10429-15-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211123859.10429-1-pragat.pandya@gmail.com>
References: <20200211123859.10429-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 14/18] staging: exfat: Rename
	function "ffsWriteStat" to "ffs_write_stat"
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

Fix checkpatch warning: Avoid CamelCase
Change all occurrences of function "ffsWriteStat" to "ffs_write_stat" in
source.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat_super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 6d21c0161419..5fb084941c3b 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -1565,7 +1565,7 @@ static int ffs_read_stat(struct inode *inode, struct dir_entry_t *info)
 	return ret;
 }
 
-static int ffsWriteStat(struct inode *inode, struct dir_entry_t *info)
+static int ffs_write_stat(struct inode *inode, struct dir_entry_t *info)
 {
 	int ret = 0;
 	struct timestamp_t tm;
@@ -3263,7 +3263,7 @@ static int exfat_write_inode(struct inode *inode, struct writeback_control *wbc)
 	exfat_time_unix2fat(&inode->i_ctime, &info.CreateTimestamp);
 	exfat_time_unix2fat(&inode->i_atime, &info.AccessTimestamp);
 
-	ffsWriteStat(inode, &info);
+	ffs_write_stat(inode, &info);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
