Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172BCC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 07:26:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B92F2080C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 07:26:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNAVYHr5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B92F2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8F8086FEC;
	Wed,  9 Sep 2020 07:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0tEyULPiN8tD; Wed,  9 Sep 2020 07:26:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C6D4886E65;
	Wed,  9 Sep 2020 07:26:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE5D7C0859;
	Wed,  9 Sep 2020 07:26:34 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72D9AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 07:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 60A6586FEC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 07:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPFl5ccmCR+W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 07:26:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B900F86E65
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 07:26:32 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z19so1375895pfn.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Sep 2020 00:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NB8HBUKnl+eWfZNHIQZWAbfkL9C5IcAO+9Z1lg426u8=;
 b=hNAVYHr5uxDesz7m8yBEg9nTrnbnzLgkuYvjloOejB/N6d8aae8dTdQu2xhhan0Vtl
 viJO7ZNo030PGxkXyTbUWpTLuecLUIQqkBS8LH3U7RamoG+oAkaDuHOi1A+4PZjSmPqi
 EoBVK7TpvxlDjdnHPXyH3Yt8wyrKOK8XGgzfYVPpmIKGXeE12M8psa9BW0zZQJ/aHR+4
 KF/ZtkQjl2s+FQdRkBIGBmzK0/R0Z4NYX3mb0hIpGiLpkbIV26/G31SgEorcqReRRZiM
 ikR/C5UVkQ4ft+STBWWOMXlnHbrPVrbPt6HloxfdmkPRVFO2/z1j6cGnR0nhUwxzeynF
 JkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NB8HBUKnl+eWfZNHIQZWAbfkL9C5IcAO+9Z1lg426u8=;
 b=op8xSUUs/yYmk+ySyMDiMnqZT8KSVmZDj1fsiVd3KaLS7VU8ipq4YUXdYsuzLy3k0w
 SENiotc4ovwmYuSYvhrSrhDpVouIjVXWH0RisOO+LGSHJvr7PGfDUC0M0DN6YkAICLl1
 oqwh5ImDFrcq/vv0TiIrFDHoqylrr9RJpGOrPKO/97bx257Wsjrexmrp1VggjHYaNnw5
 YRfPZgapvC3YhBAx6DXnA+zb8RjZo0rYSuGFKjGN+YEmMxNcr5KnC6n2lezx8kF7Fld3
 WpVxdmSsiiz/0se2Y0EtEgGc/LwIxM0PbijPmrw5qr5QoJ/SSp/OwGQpN1fjD3m4YS14
 nwdQ==
X-Gm-Message-State: AOAM533jkmUjuAhuOasuU24EEO/HdQLRolsxhlmvwP9bAfspr3Q2G7hN
 JP1chAXBllFTnTvcGxj64Q==
X-Google-Smtp-Source: ABdhPJxgN58H3LqRJckQL6qJXd2ZuTLY65XPV2ud3K7OCYkyiqQA+x1vw7hC5sQIXpCuHOBgInDgkQ==
X-Received: by 2002:a17:902:c38a:: with SMTP id
 g10mr2551819plg.23.1599636392271; 
 Wed, 09 Sep 2020 00:26:32 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id r10sm1129570pjp.49.2020.09.09.00.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 00:26:31 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>
Date: Wed,  9 Sep 2020 03:25:51 -0400
Message-Id: <20200909072551.1101031-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200908200635.1099360-1-yepeilin.cs@gmail.com>
References: <20200908200635.1099360-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Miao-chen Chou <mcchou@chromium.org>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-bluetooth@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2] Bluetooth: Fix memory leak in
	read_adv_mon_features()
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

read_adv_mon_features() is leaking memory. Free `rp` before returning.

Fixes: e5e1e7fd470c ("Bluetooth: Add handler of MGMT_OP_READ_ADV_MONITOR_FEATURES")
Reported-and-tested-by: syzbot+f7f6e564f4202d8601c6@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=f7f6e564f4202d8601c6
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
I forgot the "Link:" tag yesterday. Sorry about that.

Change in v2:
    - add a proper "Link:" tag.

 net/bluetooth/mgmt.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 5bbe71002fb9..f96251f818fc 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -4157,7 +4157,7 @@ static int read_adv_mon_features(struct sock *sk, struct hci_dev *hdev,
 {
 	struct adv_monitor *monitor = NULL;
 	struct mgmt_rp_read_adv_monitor_features *rp = NULL;
-	int handle;
+	int handle, err;
 	size_t rp_size = 0;
 	__u32 supported = 0;
 	__u16 num_handles = 0;
@@ -4192,9 +4192,13 @@ static int read_adv_mon_features(struct sock *sk, struct hci_dev *hdev,
 	if (num_handles)
 		memcpy(&rp->handles, &handles, (num_handles * sizeof(u16)));
 
-	return mgmt_cmd_complete(sk, hdev->id,
-				 MGMT_OP_READ_ADV_MONITOR_FEATURES,
-				 MGMT_STATUS_SUCCESS, rp, rp_size);
+	err = mgmt_cmd_complete(sk, hdev->id,
+				MGMT_OP_READ_ADV_MONITOR_FEATURES,
+				MGMT_STATUS_SUCCESS, rp, rp_size);
+
+	kfree(rp);
+
+	return err;
 }
 
 static int add_adv_patterns_monitor(struct sock *sk, struct hci_dev *hdev,
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
