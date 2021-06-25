Return-Path: <SRS0=pv0Q=LT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73E4C48BC2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Jun 2021 10:24:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9026D61439
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Jun 2021 10:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9026D61439
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C43C404B6;
	Fri, 25 Jun 2021 10:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sdU215-gjjaH; Fri, 25 Jun 2021 10:24:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1ACE5400EC;
	Fri, 25 Jun 2021 10:24:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5A31C0010;
	Fri, 25 Jun 2021 10:24:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4FDCC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 10:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C6CE60707
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 10:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udHP3QRFI9z2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 10:24:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4405606F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 10:24:00 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id i13so15465780lfc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Jun 2021 03:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mA4MK7Qr8XHELuEKqiootlu+LOQg/7ijOx7HOstIiJ4=;
 b=FLY+8QuEnlw0aXi+0Z/K7u5MBSA0emdjGCxiSFOOVOx2UVbkAHwOaSlJXeSRa+QfEQ
 HSCg/CclfLPIw2ldxVHDTHF+mmp7fm9xP9f1jULV6hPMYnVMa8uWjSfnv+dNilsMlJ/l
 f6yBKMPBH0PSiDgAP6Y3fdUVJDeh175EJZJ/HGkpLbZaN2oW1ZoDbBqnMKUny2npK9Xj
 6oIJx/lWCgXvpP1/359x7/HCQ6OzrNYMm77NUbglvFLSNW7Y3FF5cWLUc9F3q6tz100H
 H1XLmoFbFcETuGCKB9yrkak+vK9oESwEcU9OhJoTjzFL7tH8uxbs9M32wdRgJnuYkbSn
 M7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mA4MK7Qr8XHELuEKqiootlu+LOQg/7ijOx7HOstIiJ4=;
 b=l/YGkPhqXx14TBp25pDsT4cyebARFIR1mj3bHC0Y0L2TNjm4WhblgVStVMjcteJ0QP
 OSR6XrowqunL2sDObe1Ny7uwppMgMbwpATpWx3ljTazDMMM+R3mvspHpkMVn33+KLQe0
 PIqTLYtD7rHVHc+f4AZzqXG/kJnMqXA1T6C16VlJwVH6x3WcFnXtT72eisv6++NWXnVA
 qbVaIHGDzXM11wtZwE6l/SWdp908A9H8wnptxCkkKiDj3TjVN6Nm4gobd0a9VBMvkAoB
 f2rU9ciKSaN24U00G7seNV+Ok6fHZbUav/FnDT0xYCl7Yl8z65XxKxtmFBg5UEzA+KJB
 BCFg==
X-Gm-Message-State: AOAM532RuwoOpiUKawZZ17WCKN0S8GciGcsk61FceDnwinByR8voC8cR
 XaxwoTAX7Z7G7KL4Mx+EiYo=
X-Google-Smtp-Source: ABdhPJzP8BIojsyjcuITH5Yh5F7FsZh5MrEOdEg7PEgv+7lhTdVafj4BjC5luipLHqpCvczgohsedw==
X-Received: by 2002:a19:650f:: with SMTP id z15mr7471186lfb.511.1624616638682; 
 Fri, 25 Jun 2021 03:23:58 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
 by smtp.gmail.com with ESMTPSA id f13sm474904lfc.157.2021.06.25.03.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 03:23:58 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, 0x7f454c46@gmail.com
Subject: [PATCH] net: xfrm: fix memory leak in xfrm_user_rcv_msg
Date: Fri, 25 Jun 2021 13:23:54 +0300
Message-Id: <20210625102354.18266-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 syzbot+fb347cf82c73a90efcca@syzkaller.appspotmail.com
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

Syzbot reported memory leak in xfrm_user_rcv_msg(). The
problem was is non-freed skb's frag_list.

In skb_release_all() skb_release_data() will be called only
in case of skb->head != NULL, but netlink_skb_destructor()
sets head to NULL. So, allocated frag_list skb should be
freed manualy, since consume_skb() won't take care of it

Fixes: 5106f4a8acff ("xfrm/compat: Add 32=>64-bit messages translator")
Reported-and-tested-by: syzbot+fb347cf82c73a90efcca@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

One thing I'm not sure about is did I choose the rigth
place to free this skb, maybe we can move this clean up
a little bit deeper, like in xfrm_alloc_userspi()?

---
 net/xfrm/xfrm_user.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index f0aecee4d539..ff60ff804074 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -2811,6 +2811,16 @@ static int xfrm_user_rcv_msg(struct sk_buff *skb, struct nlmsghdr *nlh,
 
 	err = link->doit(skb, nlh, attrs);
 
+	/* We need to free skb allocated in xfrm_alloc_compat() before
+	 * returning from this function, because consume_skb() won't take
+	 * care of frag_list since netlink destructor sets
+	 * sbk->head to NULL. (see netlink_skb_destructor())
+	 */
+	if (skb_has_frag_list(skb)) {
+		kfree_skb(skb_shinfo(skb)->frag_list);
+		skb_shinfo(skb)->frag_list = NULL;
+	}
+
 err:
 	kvfree(nlh64);
 	return err;
-- 
2.32.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
