Return-Path: <SRS0=42ho=PP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8763FC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Oct 2021 17:38:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F70F60E74
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Oct 2021 17:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F70F60E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E48380D18;
	Wed, 27 Oct 2021 17:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qEXYR6__utOr; Wed, 27 Oct 2021 17:38:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AC5AC80D12;
	Wed, 27 Oct 2021 17:38:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B87AC0012;
	Wed, 27 Oct 2021 17:38:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6D54C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Oct 2021 17:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5DB880D18
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Oct 2021 17:38:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vckJZ7UCFgii
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Oct 2021 17:38:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76B1C80D12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Oct 2021 17:38:45 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so2617362pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Oct 2021 10:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PkqSITbCIjnK7FZ/jf9UFsH0245UP24SRvOg2xF2AJ4=;
 b=GkmIV3DcqQ+aCfRl4Y6y/2a5fIZC9mpAbKRbs9z1Y7tiYi1i831uFjOhbzAAWGysAO
 3UPZVx7r2tGbZBrXZhSnVyBzvN8L5vH+M7r+clmkeUrb1++7B2uSf4d/xWTqoRQJiYmB
 BRkNi6VDh2mDqTwvNIDfhbpe5lNHV2FwX3UpdN7vMHPuVbeU2LdqwW2qqKWVFdDq4HR4
 L6DMIPQ0jXAzAzEsggn5zP3GSaXqurL/rmZD2GGlgq4wqCpDfVR+yEfQA4mpKZOgom+W
 3vnDBumIMm3j6q0uONWzDJ2g0qMojsO3F++5E71NIMEJShqDX2Lhtsx/nPPHYLGUrIhX
 K7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PkqSITbCIjnK7FZ/jf9UFsH0245UP24SRvOg2xF2AJ4=;
 b=rEHehVm4aA1ZyityXOBQKtYt0NSvqpq0wLekC7rhpYHOXXWvJgJX97yBm5b5pkJym4
 8RyE8sRMGF96cI43mRR6vfTuIZy5nKqijLJBgKCrQdH2Lf6LFBDSaoyaZN6nhZLcBapN
 XJiEp5HlUjFMjWSpkvq66UFVFmMUwBYZccvVM1l0Vh5U2b+N+lP9HZLVzhVAHjlfn1Nc
 AEwAS9ckNq7FJv+vKLZmg3SVG0xM85VMcsRju/mZNSv0RZNKcjfqDe0JIQti3ydUi8zV
 Msqa955YvXvszfFMcmAtKt7w+1oEfcCQ9nb/QWg268r1kFLBKtm1JYf058Pgn4t13IBZ
 LY6A==
X-Gm-Message-State: AOAM531OltOCrugrXdij8G1JGer2O7fIS+M/KjZPPsC3UeXn4yeUfMxU
 GylBVdeVBCKUi1eUZE4uunU=
X-Google-Smtp-Source: ABdhPJxoHmywfRhLDYW7fzdNA0OKcl8KNKkB9+wieDqHTRiuQZd0w6YEh53/dC7aoVnN0xV0rLPI9Q==
X-Received: by 2002:a17:90b:1e0b:: with SMTP id
 pg11mr7277222pjb.230.1635356324894; 
 Wed, 27 Oct 2021 10:38:44 -0700 (PDT)
Received: from localhost.localdomain (bb42-60-144-185.singnet.com.sg.
 [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id b6sm572719pfv.171.2021.10.27.10.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 10:38:44 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: johannes@sipsolutions.net,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH v2] net:wireless: call cfg80211_stop_ap when switch from
 P2P_GO type
Date: Thu, 28 Oct 2021 01:37:22 +0800
Message-Id: <20211027173722.777287-1-phind.uet@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+bbf402b783eeb6d908db@syzkaller.appspotmail.com
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

If the userspace tools switch from NL80211_IFTYPE_P2P_GO to
NL80211_IFTYPE_ADHOC via send_msg(NL80211_CMD_SET_INTERFACE), it
does not call the cleanup cfg80211_stop_ap(), this leads to the
initialization of in-use data. For example, this path re-init the
sdata->assigned_chanctx_list while it is still an element of 
assigned_vifs list, and makes that linked list corrupt.

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
Reported-by: syzbot+bbf402b783eeb6d908db@syzkaller.appspotmail.com
---
V2:
	- Fix wrong email address.
 net/wireless/util.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/wireless/util.c b/net/wireless/util.c
index 18dba3d7c638..4fdf0877092d 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -1044,6 +1044,7 @@ int cfg80211_change_iface(struct cfg80211_registered_device *rdev,
 
 		switch (otype) {
 		case NL80211_IFTYPE_AP:
+		case NL80211_IFTYPE_P2P_GO:
 			cfg80211_stop_ap(rdev, dev, true);
 			break;
 		case NL80211_IFTYPE_ADHOC:
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
