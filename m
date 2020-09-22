Return-Path: <SRS0=ws9g=C7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BB9C2D0E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 15:46:12 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86D2A20739
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 15:46:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jhw9NoPh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86D2A20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 19CC08563A;
	Tue, 22 Sep 2020 15:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S_OB8l5kVrCj; Tue, 22 Sep 2020 15:46:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 21CF8852FE;
	Tue, 22 Sep 2020 15:46:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F12A1C0859;
	Tue, 22 Sep 2020 15:46:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94914C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 15:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7AB1486224
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 15:46:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4fdYiB4twg6c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 15:46:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DDE6E8620F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 15:46:07 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id g29so12298709pgl.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 08:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9AQrDvOJ4B882Sq7uQ4Kp3Mhc6ZZV9HLHcMLFE6TOhI=;
 b=Jhw9NoPhISjFnb2iyTpxw6h+RYVNiIfyIRhkX8YbMIZ9JUlIwbdADjHuei8PTMc8/4
 o7qJ2esrUt0uK60odGA6j87/5evujlQU3jLhrLXuT3LMK8CV6VbFHzMYr3K3PEq5LNkU
 vQhDg4EXVsK9vbUG4dZfwGp/Yn3qZjjaENRAHyXuKY/cDDLfXbMoYLPpA0G8jXoUEF8N
 l3kuOQ/RmOAWo59vgRpHHhwDUWAWCeuxesm3e/f09wCj6rBfeG0MHJmLhwxdy+7AO48R
 e8PUWOJEmTjqHOFJGWB5+7qCKHJE77bDIhNPWKChZbspvdayn6C03yz07pA7CjoGqaHQ
 SOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9AQrDvOJ4B882Sq7uQ4Kp3Mhc6ZZV9HLHcMLFE6TOhI=;
 b=ZDAMekjLSXq3x3/J7xYlLFowTAPvg3zhLgju9mZUlqWYXqsqWCdMOgObIS+/oun25v
 +vHkG+OJ5/stnVJXisRgU7MlyY1qZJxiaDNTrFFV1Z4XTY81nSdjurrKIGlV2MC/6STu
 CM+Hz6g6je2474N17VycclZH/avVUCvB8KnZpjdXX3veMkpbxvUGCAqEphJOlYHCHSk0
 q+q5S0UWiXM3ze0OYigASBKMVLk3884M1N/WNPprQ54iHW0Yb9rzRAHUnLtlNcjRyY0Z
 6MzEBS2Hosqj2avItrUSCkL3VDvU+oh0X/RSOVl0P3Omfvdc98fJCDDqQLTDnON3DGJ8
 /pJw==
X-Gm-Message-State: AOAM533diuPotHNsnwYCYW9mWB7Kv2wuta3USoRX2dxAtIYt3YMbrPH/
 cQSUJ8AwHfCX/AR9yqfWWA==
X-Google-Smtp-Source: ABdhPJypkqDqkgeFFBXubtAf7952MvxcTfvzT0LhQl5JNUIgU2hJ7zgsdZIPQXmZ5GbuiVCSjyvMew==
X-Received: by 2002:a63:2ca:: with SMTP id 193mr3929260pgc.336.1600789567483; 
 Tue, 22 Sep 2020 08:46:07 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id f10sm15731901pfk.195.2020.09.22.08.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 08:46:06 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jan Kara <jack@suse.com>
Date: Tue, 22 Sep 2020 11:45:31 -0400
Message-Id: <20200922154531.153922-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <0000000000004c1f4d05afcff2f4@google.com>
References: <0000000000004c1f4d05afcff2f4@google.com>
MIME-Version: 1.0
Cc: syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] udf: Fix memory leak in
	udf_process_sequence()
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

udf_process_sequence() is leaking memory. Free `data.part_descs_loc`
before returning.

Cc: stable@vger.kernel.org
Fixes: 7b78fd02fb19 ("udf: Fix handling of Partition Descriptors")
Reported-and-tested-by: syzbot+128f4dd6e796c98b3760@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=c5ec4e6f5d818f3c4afd4d59342468eec08a38da
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 fs/udf/super.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/fs/udf/super.c b/fs/udf/super.c
index 1c42f544096d..b0d862ab3024 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -1698,7 +1698,8 @@ static noinline int udf_process_sequence(
 					"Pointers (max %u supported)\n",
 					UDF_MAX_TD_NESTING);
 				brelse(bh);
-				return -EIO;
+				ret = -EIO;
+				goto out;
 			}
 
 			vdp = (struct volDescPtr *)bh->b_data;
@@ -1718,7 +1719,8 @@ static noinline int udf_process_sequence(
 			curr = get_volume_descriptor_record(ident, bh, &data);
 			if (IS_ERR(curr)) {
 				brelse(bh);
-				return PTR_ERR(curr);
+				ret = PTR_ERR(curr);
+				goto out;
 			}
 			/* Descriptor we don't care about? */
 			if (!curr)
@@ -1740,28 +1742,32 @@ static noinline int udf_process_sequence(
 	 */
 	if (!data.vds[VDS_POS_PRIMARY_VOL_DESC].block) {
 		udf_err(sb, "Primary Volume Descriptor not found!\n");
-		return -EAGAIN;
+		ret = -EAGAIN;
+		goto out;
 	}
 	ret = udf_load_pvoldesc(sb, data.vds[VDS_POS_PRIMARY_VOL_DESC].block);
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	if (data.vds[VDS_POS_LOGICAL_VOL_DESC].block) {
 		ret = udf_load_logicalvol(sb,
 				data.vds[VDS_POS_LOGICAL_VOL_DESC].block,
 				fileset);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	/* Now handle prevailing Partition Descriptors */
 	for (i = 0; i < data.num_part_descs; i++) {
 		ret = udf_load_partdesc(sb, data.part_descs_loc[i].rec.block);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
-	return 0;
+	ret = 0;
+out:
+	kfree(data.part_descs_loc);
+	return ret;
 }
 
 /*
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
