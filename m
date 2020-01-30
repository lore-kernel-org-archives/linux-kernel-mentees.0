Return-Path: <SRS0=9uDz=3T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDF2C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 10:11:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94D4C206D5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 10:11:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXCgN/GZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94D4C206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5D60D8571C;
	Thu, 30 Jan 2020 10:11:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x8wQk7VWtNKY; Thu, 30 Jan 2020 10:11:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DF129881E2;
	Thu, 30 Jan 2020 10:11:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF1C2C0178;
	Thu, 30 Jan 2020 10:11:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 148ECC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 10:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 110B7876CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 10:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ttRsPaiLxe-F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 10:11:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7F26D87688
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 10:11:47 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y5so1229805pfb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 02:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2PBKaHNbZPQSw/6pq7aba6IKrrBLpWG1Rl96OfumKs0=;
 b=EXCgN/GZcpZR8poY0LxdVM2/AuJlaC6csMBBu+fX6wHHTn0AhRPoa301cUn7AGRMMh
 +CJSBjmNDacLRQi9qNt5W5xkUhYjaEAJ/vOQfCJoBgS1PQzV3hCr7F0NmnLfA5mDLZ0G
 LeP00up7ZlMjU+4MjawxQI4aEh0DeKFYfFagfLU9ApBiaSG6gIXPSfG4xtLqlerVW1HA
 QVAJhI2IblCdCnMu1RNtk2cFPISH+S54iAO4JG6+2JelFHPTU5jcxLUHc/yQHKhU4kHr
 9ylERID5tt+O8ZyQCj3nhBu8uh6SezhQ4pBXuLjag6sREAL/4zCK3w0K7mHopLlj4pWB
 +wSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2PBKaHNbZPQSw/6pq7aba6IKrrBLpWG1Rl96OfumKs0=;
 b=Df9sRfLSQ119vBctNaTi/DPW2/jn6TV1r5kw/UB3IULqxrkRY1swH161K1HesnB1YY
 s9a1sP8CWOfF0qf14N9ROxM45RiwlwMW5hLmWUY90Vdj46is3BfF3/5+b3KfEplrgOs2
 wODftyd6Oag1xepSPLs0ym8jdhwMRsm2lWWw5FHX7WZV9Ic18Fbodk8h0+1Zu0ij2P4A
 j6jKRDq0F+WnchsRTbQsrm3hY5/2XVPBsarm3ivIcqrgjC5WFXGTp4em5G1KThMd/5Gv
 kiCYDlROWmpKC1JaeBnc2sWRHJnrhsgdcde2nJHqhVsgFtVBuywXV21T++fKx0zt4yPY
 KBWA==
X-Gm-Message-State: APjAAAXfQGmVe4buupqIOb4kUfdQ5ml86lRI0vIXStpKSwP3c0OJK3xZ
 evlOE4+WZhlghwZy65UBgfc=
X-Google-Smtp-Source: APXvYqzN9Et5YzVy6Vg3CItCuYZGt3G1cnM8Z+1QndaFnBbyD1nf8jIGfvN2GF27lVmKUHKgxv+unA==
X-Received: by 2002:a62:1c95:: with SMTP id c143mr4092880pfc.219.1580379106512; 
 Thu, 30 Jan 2020 02:11:46 -0800 (PST)
Received: from localhost.localdomain ([2405:204:848d:d4b5:49ce:a9e3:28b5:cf94])
 by smtp.gmail.com with ESMTPSA id k21sm6239683pfa.63.2020.01.30.02.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 02:11:45 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: valdis.kletnieks@vt.edu,
	gregkh@linuxfoundation.org
Date: Thu, 30 Jan 2020 15:41:17 +0530
Message-Id: <20200130101118.15936-2-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200130101118.15936-1-pragat.pandya@gmail.com>
References: <20200130101118.15936-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/2] staging: exfat: Remove unused
	struct 'part_info_t'
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

Remove global declaration of unused struct "part_info_t".
Structure "part_info_t" is defined in exfat.h and not referenced in any
other file.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index 51c665a924b7..b29e2f5154ee 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -231,11 +231,6 @@ struct date_time_t {
 	u16      MilliSecond;
 };
 
-struct part_info_t {
-	u32      Offset;    /* start sector number of the partition */
-	u32      Size;      /* in sectors */
-};
-
 struct dev_info_t {
 	u32      SecSize;    /* sector size in bytes */
 	u32      DevSize;    /* block device size in sectors */
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
