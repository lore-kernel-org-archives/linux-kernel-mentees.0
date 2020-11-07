Return-Path: <SRS0=FEGG=EN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B070EC55179
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 19:18:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B2020723
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 19:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKqOu8+1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45B2020723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D98F28698E;
	Sat,  7 Nov 2020 19:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Au7RXuLdHjSh; Sat,  7 Nov 2020 19:18:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C1B988697B;
	Sat,  7 Nov 2020 19:18:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD453C0893;
	Sat,  7 Nov 2020 19:18:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28299C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 19:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0A16686A3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 19:18:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMxB94xqtjEM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 19:18:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 34AB386A37
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 19:18:47 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id h4so1097309pjk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Nov 2020 11:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=afHTW824kBEGWvvhUfZ3PFiZzmUwUob7a4RTUq6L29M=;
 b=cKqOu8+1Y6K1ZqQHZbaNG0Qf/imNxwYLHrCnaYPfjtg1bFR6iCxQqvYVFeJnGgvSDF
 SHD1/uk84RbB6/LX2Cp8eq56uVvybq5CatnwZBYF+iFaZv3o8SRlFQPxPEHKAbiZqWx+
 dgoirOtOQWnq2zloVYRHazX8VP2L3m/5ZoSmzBa1/hOF5+6DFWFPx3k+avt1wRph9uRP
 bSr4vtdlQmz+I7eQvPVIJhEBjnnzlVYVHXP+iJ0lksy3QfZG80VlXQP/RaIKjc+TlOTG
 9Ude7XIsBHDrslUOirvX74P/H+YH9but/0OeYzCR1vqo717iHcxiQ/BydfRmQBMCg+GC
 c/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=afHTW824kBEGWvvhUfZ3PFiZzmUwUob7a4RTUq6L29M=;
 b=dTmaJTsmTuujPoHmhGjB1SKTdxzgABcUR4DqiFmvDG4sBYkzj+CP47fhOAgiX552yI
 YmuSugbJT1a6rfbi3Q+zJ/kVcHGwthQ2GEm4frGpxFXa3V81br1IpCY13pAdlumDQHJ/
 CsQVgZZ2zUJOioV8Dtg5jF5B9m4JehYeyjqOx6gWvfYL05S62LHaq44bK1UTXJ/FWvA8
 hGvnAOSZLP6fJh2eZtaX0Lo64+8zsjCvyQH7a9vAm2lefuRpKtp94rPPOwfqGyK16v21
 gxk7ZsiS+OfSPwdhAOXqNXFUD/dhFihpfkG3YzEuS+oCMOmnR/3h/1aJFIn3jHNej8R/
 Sw/Q==
X-Gm-Message-State: AOAM5323FKq79XIn9w15mr3/D11IaFt0Mm97H9v2AA4Sew/113hh5g6t
 0PbsqhgJzXeJEB2nIjGIrZE=
X-Google-Smtp-Source: ABdhPJxE68wnEzKKNjlOd4hxH6MSJRj+kJGJIHeajqj0N/aJbNYxh1I6FbCqx4nkEvjGbHzPcNRg2A==
X-Received: by 2002:a17:90a:aa89:: with SMTP id l9mr5272232pjq.0.1604776726703; 
 Sat, 07 Nov 2020 11:18:46 -0800 (PST)
Received: from localhost.localdomain ([45.118.167.194])
 by smtp.googlemail.com with ESMTPSA id r73sm6692020pfc.20.2020.11.07.11.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 11:18:45 -0800 (PST)
From: Anmol Karn <anmol.karan123@gmail.com>
To: ralf@linux-mips.org,
	davem@davemloft.net,
	kuba@kernel.org
Date: Sun,  8 Nov 2020 00:48:35 +0530
Message-Id: <20201107191835.5541-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201107082041.GA2675@Thinkpad>
References: <20201107082041.GA2675@Thinkpad>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org,
 syzbot+a1c743815982d9496393@syzkaller.appspotmail.com, saeed@kernel.org,
 linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 net] rose: Fix Null pointer
	dereference in rose_send_frame()
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

rose_send_frame() dereferences `neigh->dev` when called from
rose_transmit_clear_request(), and the first occurrence of the
`neigh` is in rose_loopback_timer() as `rose_loopback_neigh`,
and it is initialized in rose_add_loopback_neigh() as NULL.
i.e when `rose_loopback_neigh` used in rose_loopback_timer()
its `->dev` was still NULL and rose_loopback_timer() was calling
rose_rx_call_request() without checking for NULL.

- net/rose/rose_link.c
This bug seems to get triggered in this line:

rose_call = (ax25_address *)neigh->dev->dev_addr;

Fix it by adding NULL checking for `rose_loopback_neigh->dev`
in rose_loopback_timer().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
Tested-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
Changes in v3:
        - Corrected checkpatch warnings and errors (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
	- Added "Fixes:" tag (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
Changes in v2:
	- Added NULL check in rose_loopback_timer() (Suggested-by: Greg KH <gregkh@linuxfoundation.org>)

 net/rose/rose_loopback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 7b094275ea8b..2c51756ed7bf 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -96,7 +96,8 @@ static void rose_loopback_timer(struct timer_list *unused)
 		}

 		if (frametype == ROSE_CALL_REQUEST) {
-			if ((dev = rose_dev_get(dest)) != NULL) {
+			dev = rose_dev_get(dest);
+			if (rose_loopback_neigh->dev && dev) {
 				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
 					kfree_skb(skb);
 			} else {
-
2.29.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
