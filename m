Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A677C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 04:24:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDA662073A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 04:24:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVFLCVrJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDA662073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8574E87372;
	Mon, 12 Oct 2020 04:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6ZtWK0q7rM4; Mon, 12 Oct 2020 04:24:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 11A478737F;
	Mon, 12 Oct 2020 04:24:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8EA8C0052;
	Mon, 12 Oct 2020 04:24:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61973C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 04:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5D4068691A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 04:24:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id igBaJlfkNJTq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 04:24:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B49188690F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 04:24:23 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w21so12361600pfc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 21:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tGGjPH4vRcWgaIyBvIwbuR8WDhMxPW1JkVrUAJH4wsw=;
 b=HVFLCVrJ9e/R18ofzZLeou3umzwT5fdPgRN+4LEas2eE+jBqseaUGv3FhBZk+khqI+
 5mZoEdAKnTgukkl0I4m5od9383+CT8FO/EW/+8PrsIx7gScnYEWOi7VM11l5TpIfHXYW
 viON4q9nrl+25CgwiOMJPUxxnb0fI8/LN+UQNLiclRpHfAjNZtm3b1/ssZd4l4VkRfSd
 6BQ1gpvAUfsndFgH+cFETq+OsAPplgexzPWrgEcv8vgke+38nK7Q7Db65iSFnYIP0ZpZ
 hcTynQ4e4vIH0HvGOKjR4A/ddjHJJDM+n5GiP23JNcACLzMQS9/3N+RuyHCH3TpSd+Wy
 5Lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tGGjPH4vRcWgaIyBvIwbuR8WDhMxPW1JkVrUAJH4wsw=;
 b=kPf+ZY5fSj4RwhNcgkMcBd5EovtuJkQ2wwh739zHVtVUWNl5lUHz+0X+45KpLCe2Vw
 Ph97Y90L9NQyGnU6xP5bJF3cFmlF/Vmo7/DiN2+OX9UKvBO5PfoVEquEvaBTMRFEsk7S
 MprEHnFgpk/3zizisDI1JkQDNwklULA6wKfIZLMMtnMhmN8JBYTcYe283hlNGo8vT76E
 +25WjzU9JXb4nr/EHrZCV6/aeOdYzCeUXOXGl6BaGtTlfZUQpBivEOzjPy08wX7zQo0d
 nOd6Bdf/FHuCsNRD5QjA/sNiOEFZavJzSVOyol3iANyqP8ofV+x01gH/F8ju/Nrnrte2
 d29A==
X-Gm-Message-State: AOAM532JPhRmXc5uqWbCbqvG3PDuMPdpDp2qbNHSVfua2TiGbAeoyVrb
 T9lsz28cEApC1idvCGjMdkA=
X-Google-Smtp-Source: ABdhPJzZRPX105i1KB5YPC6MVCCPOxq7CKb10XSNAcjI+7RWRlEQZdWUkpBRYMRarueOXCGcZlpXdQ==
X-Received: by 2002:a65:6858:: with SMTP id q24mr11849299pgt.10.1602476663055; 
 Sun, 11 Oct 2020 21:24:23 -0700 (PDT)
Received: from localhost.localdomain ([49.207.200.2])
 by smtp.gmail.com with ESMTPSA id ck21sm21348723pjb.56.2020.10.11.21.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 21:24:22 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: ericvh@gmail.com, lucho@ionkov.net, asmadeus@codewreck.org,
 davem@davemloft.net, kuba@kernel.org
Date: Mon, 12 Oct 2020 09:54:04 +0530
Message-Id: <20201012042404.2508-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 syzbot+75d51fe5bf4ebe988518@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH net] net: 9p: initialize
	sun_server.sun_path to have addr's value only when addr is valid
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

In p9_fd_create_unix, checking is performed to see if the addr (passed
as an argument) is NULL or not.
However, no check is performed to see if addr is a valid address, i.e.,
it doesn't entirely consist of only 0's.
The initialization of sun_server.sun_path to be equal to this faulty
addr value leads to an uninitialized variable, as detected by KMSAN.
Checking for this (faulty addr) and returning a negative error number
appropriately, resolves this issue.

Reported-by: syzbot+75d51fe5bf4ebe988518@syzkaller.appspotmail.com
Tested-by: syzbot+75d51fe5bf4ebe988518@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 net/9p/trans_fd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/9p/trans_fd.c b/net/9p/trans_fd.c
index c0762a302162..8f528e783a6c 100644
--- a/net/9p/trans_fd.c
+++ b/net/9p/trans_fd.c
@@ -1023,7 +1023,7 @@ p9_fd_create_unix(struct p9_client *client, const char *addr, char *args)
 
 	csocket = NULL;
 
-	if (addr == NULL)
+	if (!addr || !strlen(addr))
 		return -EINVAL;
 
 	if (strlen(addr) >= UNIX_PATH_MAX) {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
