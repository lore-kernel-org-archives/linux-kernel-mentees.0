Return-Path: <SRS0=42ho=PP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE46EC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Oct 2021 17:29:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A53B860E74
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Oct 2021 17:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A53B860E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CBCE4040C;
	Wed, 27 Oct 2021 17:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeLGCYAhkuPm; Wed, 27 Oct 2021 17:29:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6B2E740139;
	Wed, 27 Oct 2021 17:29:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47982C0012;
	Wed, 27 Oct 2021 17:29:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38CC5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Oct 2021 17:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26E0F401B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Oct 2021 17:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MHDqIJYKgPeo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Oct 2021 17:29:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9131C401A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Oct 2021 17:29:38 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id o133so3357491pfg.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Oct 2021 10:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j40i/oCuZ+1rQnHaCzvorYVDYCLy6jFivrWqUoKPoe0=;
 b=L7IJFqH3yGUH1nGbQuvDjSN/Ogpu1tl1ga5eSHW+9H9QlhT0ClptqzgGWh/XU/Ked6
 WlO07/L+cIP8rN9L+lgT6E7/HdNUropHrGkGCKumo5EJlOJILnnYOQKYROWjE6nM37Yx
 qZGTVUrewB3pvu1L//BjbwS5RjCQ8/ZPRfR3fvSLWrwJPVPuPnf2coqPWk29X+l54eD4
 KiGbHGNh604Gic7iu41s+HihkESkjpGx6gi166PH/0zwjn2PF5bCFu3eQQSIu75y7x9T
 UqvGRB9WPqpiGVo61G8wp/9LLbzrWKGMR+hFmsjKkAM2OaeO10nfrkeqect5SzT5bWJ8
 JmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j40i/oCuZ+1rQnHaCzvorYVDYCLy6jFivrWqUoKPoe0=;
 b=O2lwmshUjKcb85ps6lnnY0BtMkPk7YK2Z+rY1+8e+/XNYMIM+l0MsQF+e2dQItFezF
 zeQnWmL4xDynEy0pbHnjCv+RKMz/EDmQhNIfJPXjrv9oIuBGr1/UfHBUuL+Mu6yLgkA4
 9c/aVqR7rzYofBqAQBlE+FNR1Uk4UaLd2Vslc1w6lIATO4fZ6d7aBMFyZM0c2n8Zgln+
 gd1M7erH9TRZGbDXiWUA+Nnt3F49nq8Pn/VKEnaVRPTa30LJR0ACFYBgdy+bMwuqzDb5
 jNtePaZvKiedd6pMubCXW/pfSZH3HVYzu0VeQrw9RmyTOJq/4EtR+pE9WNsqlKhyXsoW
 IRgw==
X-Gm-Message-State: AOAM530vws6TE+jM0xuLQ9iW1S2dumsnA7uboba7QG3C27c4Fe87dGB5
 Zn4RpIPgkz1jqhirbuzlnYg=
X-Google-Smtp-Source: ABdhPJynHJ1xIpnL8GLuMHoKCw5ZV77knl+cmxDorg8QA3litHg5RAzLEN8PX3TKcU/cw4gTKtX4+Q==
X-Received: by 2002:a65:6a0f:: with SMTP id m15mr25290047pgu.298.1635355778018; 
 Wed, 27 Oct 2021 10:29:38 -0700 (PDT)
Received: from localhost.localdomain (bb42-60-144-185.singnet.com.sg.
 [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id oc12sm341362pjb.17.2021.10.27.10.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 10:29:37 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: johannes@sipsolutions.ne,
	davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH] net:wireless: call cfg80211_stop_ap when switch from P2P_GO
 type
Date: Thu, 28 Oct 2021 01:29:32 +0800
Message-Id: <20211027172932.774040-1-phind.uet@gmail.com>
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
