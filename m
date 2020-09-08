Return-Path: <SRS0=zeZA=CR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C86BC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 20:07:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1A4E207DE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 20:07:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CrmexfeQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1A4E207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E45C86D54;
	Tue,  8 Sep 2020 20:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cdJzAr8F1zGN; Tue,  8 Sep 2020 20:07:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B8B1586EB5;
	Tue,  8 Sep 2020 20:07:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FE3CC0859;
	Tue,  8 Sep 2020 20:07:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41B3EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 20:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2F1DB86EBB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 20:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1U2GGdIubJiL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 20:07:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 87DF386D54
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 20:07:14 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z19so70213pfn.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 13:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J2k9xpa9l+tbRJ/+vvItQDXmC64/jEuH8zJsr0tf6oA=;
 b=CrmexfeQlkBwXK5cG+ePO2sdpsUPZnONXxWr/hg8KJjUjcaV7j/aXOa2NIQiuCONLC
 90PGOGuGJhs+tn/dOaOybPQI3hkDS9/DYthQ4whqkws8ZDBOxHCqgZ9XQE/r1QO1SGHt
 X3nIm8ttt4u91GG04u4UY4Bz9DZFr8zMg4JqV2Hd+WSMRI7t2FqSQW3pqmmHs0NvrUia
 zwRwSHSpIbU9SQm2gT3tA6M+scVRa1erkkve0Ylf9GJqUJJOxh5ecCoK+RqswTulVpFI
 bKRF/HqLkmb2i/japcvxpqX7E6ulyFgq1VRhJcXTzZ77FJH0PuByZFK1tQlTpc1PoKty
 IXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J2k9xpa9l+tbRJ/+vvItQDXmC64/jEuH8zJsr0tf6oA=;
 b=mClIsKZFdVDfUC57LPzc+yI+vX1XyWvesdOSsZ2oKyrTkRAPGtk2Wg8QWy2IZcEdk3
 5sYhWfy+Eu2wOP38JbZQZ01Zh/WuROU4T3fSgVLSXMX8VR3UFDN7V2vNHRz2ugsS+BUo
 ZC2VktOS7ufLjE41tVMGMfk5ksTQ8xeQVZH4E1tSXX819BPbuMKjf1ku5fVjPWYFlc6c
 15uFU0y0MsrRYBWCmje7EPE5Zf4RHeSYquGJhT2zVJDT4CjuyqAmvfxy5HUMUaVOH8UP
 bz/3UtkSHHLXo5V4dlD1HNH4mHBetfVj9uTHPEplNKVRTBB0TYDa7uHORHncHLEC1VWX
 djCw==
X-Gm-Message-State: AOAM532I6c+85hK9a6Z+1ijsCVl5vA6/iKu7XXYTazLVKjbQW59FiFGB
 tiUi3GQUhc8guaAnK01hrg==
X-Google-Smtp-Source: ABdhPJxwCwMDHBJXt83pjdnBKyh00EzfcLx4+iauDRFDYP1OihfBxFjkVtwmkrQFVz2ZgIbAEjY48w==
X-Received: by 2002:a63:fd01:: with SMTP id d1mr319176pgh.350.1599595634182;
 Tue, 08 Sep 2020 13:07:14 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id y24sm237023pfn.161.2020.09.08.13.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 13:07:13 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>
Date: Tue,  8 Sep 2020 16:06:35 -0400
Message-Id: <20200908200635.1099360-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <00000000000033913705acedbd6b@google.com>
References: <00000000000033913705acedbd6b@google.com>
MIME-Version: 1.0
Cc: Miao-chen Chou <mcchou@chromium.org>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-bluetooth@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] Bluetooth: Fix memory leak in
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
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
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
