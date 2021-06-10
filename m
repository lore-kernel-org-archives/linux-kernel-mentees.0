Return-Path: <SRS0=bMK4=LE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BD5C47094
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 16:19:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D98B613E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 16:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D98B613E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A7C460AA2;
	Thu, 10 Jun 2021 16:19:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a53lgAKjnSNo; Thu, 10 Jun 2021 16:19:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 68B9C60A69;
	Thu, 10 Jun 2021 16:19:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42FB6C000E;
	Thu, 10 Jun 2021 16:19:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDC5FC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 16:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFCCE83D99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 16:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JySALZNf4F5O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 16:19:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 123AE83D73
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 16:19:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1623341975; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=coZG9heMNMaVtmLhvzg39WQj9ttAHjAVR4Xin5Tl++EWjGNVjHgc6AeSB+Vk1smMrxq5KpkFXzOKp/Em7YDDMc7mglty70BFURFtxlQWlsY76wyMP4j8MIrciVkVy1rLqIKLkYN6XoE+Uy4x149sALB9uRbG6WeWyKlkGoX7PGA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1623341975;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=HAKm0vB87VfcW2UTN+pnBdBfKxvZ/KF9QbxznGuDeHk=; 
 b=YJNMlInwHU9N8ys4lH9xuXLkGPlV7lqA1FhRB9HDJBeHmR0q5UAa3qNV2UFdpX6iRTxkIjBK8L03kVnbvAVWFmSpUATF6aBnkmZRnzAXkpYa8rHD97MT6ukk/A2cwsdA1R7LV1xqatg+e3xEju/BvEnGC3EfsreBzO20gs5PC5k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623341975; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 bh=HAKm0vB87VfcW2UTN+pnBdBfKxvZ/KF9QbxznGuDeHk=;
 b=BA8qi6XYZGlPo9t9larjyIpSYdNf/1i1q1n064Y/76Q8WS1IPvtnMV7JBTz+EN4v
 REcxm2tTb2BXvkiP5tjgYm7OLxbD25WFMjFMhXjhdPzAkmaUJDiVVT7zJM9vrB9LeP6
 Da7A1TLPNKuLHyOjwsiIHR1WweIArmmdFx8Eys3k=
Received: from localhost.localdomain (106.51.105.43 [106.51.105.43]) by
 mx.zohomail.com with SMTPS id 1623341973610765.8442819280449;
 Thu, 10 Jun 2021 09:19:33 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Johannes Berg <johannes@sipsolutions.net>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH] mac80211_hwsim: correctly handle zero length frames
Date: Thu, 10 Jun 2021 21:49:16 +0530
Message-Id: <20210610161916.9307-1-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+b2645b5bf1512b81fa22@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

syzbot, using KMSAN, has reported an uninit-value access in
hwsim_cloned_frame_received_nl(). This is happening because frame_data_len
is 0. The code doesn't detect this case and blindly tries to read the
frame's header.

Fix this by bailing out in case frame_data_len is 0.

Reported-by: syzbot+b2645b5bf1512b81fa22@syzkaller.appspotmail.com
Tested-by: syzbot+b2645b5bf1512b81fa22@syzkaller.appspotmail.com
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---
 drivers/net/wireless/mac80211_hwsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mac80211_hwsim.c b/drivers/net/wireless/mac80211_hwsim.c
index 51ce767eaf88..ccfe40313109 100644
--- a/drivers/net/wireless/mac80211_hwsim.c
+++ b/drivers/net/wireless/mac80211_hwsim.c
@@ -3649,7 +3649,7 @@ static int hwsim_cloned_frame_received_nl(struct sk_buff *skb_2,
 	if (skb == NULL)
 		goto err;
 
-	if (frame_data_len > IEEE80211_MAX_DATA_LEN)
+	if (frame_data_len == 0 || frame_data_len > IEEE80211_MAX_DATA_LEN)
 		goto err;
 
 	/* Copy the data */
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
