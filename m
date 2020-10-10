Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127B2C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 06:45:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FC7E207C4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 06:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2fd0Idi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FC7E207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 08C712044D;
	Sat, 10 Oct 2020 06:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jnVPi1+wTKv3; Sat, 10 Oct 2020 06:45:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C573020444;
	Sat, 10 Oct 2020 06:45:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF3C1C07FF;
	Sat, 10 Oct 2020 06:45:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03D5FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 06:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E6C2986F51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 06:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0NxQfQxscqB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 06:45:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 72F2E86F4D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 06:45:14 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 132so2169932pfz.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 09 Oct 2020 23:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfSdIY+23CT3/wQXlBcdzzU4V4XTk+/nKDZH0PbiNHM=;
 b=q2fd0Idi2WuzJrVO09Ukmf7rseVtkmEVEgXkG/5RZYMvMUdy9XwUbZVI7rjVYaxQQ5
 u8Oy4QNnInXLUfNGlez7eCt2NuZUqDnnIXj26uYUNfEKmdaOLOQJHNPyIkjwSpwM/+yg
 vVXkTWeABrrr6AGcYZJ6KE4/oZhkHp5akR1EkM6QpMW6dWvQzx84xAlTvs7oi+cectqI
 fXU691erxXgiZ6dIeM8fTqagH5hlZDLyX3V+WWGgl2f0pNB4S08fXbLVbxUoWjWAZyJx
 tI6PN7UYd1Cr3ttmuxlMPg3eaFrpBPyzUEKKn2LWILPBAN/YqEGUQ1yG2DECQ4yJfUJp
 +F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfSdIY+23CT3/wQXlBcdzzU4V4XTk+/nKDZH0PbiNHM=;
 b=m8uiDTLWxoYFf1vFdRc1jtw7GEb7uLIPwToNNkCuyAFF8QEdGXQq43ghkbCQGXJIVL
 iZTiDMF2n/l2008DMRLVL/vWsxp6CP679YGJht2TYtkSAiUuEnxhsxbI5Zm7/kjgidx3
 GuSdI+QTaegoFhYDnbsrTblTZT/kAwY0jd5Au+PQlhlX9k59jYrKjYtTbqHJm4j33LCW
 RQDOMxSVox83Rkp+kMNA2EjjjKEyHpOY5xU00jD30ncqZTZz3z4OnOnFu0GHgF900gM5
 HZMHl11RjDudlukOC5kqxMD3gmJvU0UT7F+5oiADsdH1lxmW2CeRMUaACYio6mncGxki
 0NKw==
X-Gm-Message-State: AOAM531jBZFDzLoopN3HwlaeNm8eA9HzXmUwhxR1pltl93MTeg0eBfGT
 HwsthCv1FTgi4IBmt1lnqLpb3IurRrmODnZjTFc=
X-Google-Smtp-Source: ABdhPJxQ9ckge6Dkw/bNv402x14aKWItjXVRRQ/zAhILTY8a8R+FJKqwAPERSOX/98H89BtWIK6UpA==
X-Received: by 2002:a62:105:0:b029:155:c7c0:3a81 with SMTP id
 5-20020a6201050000b0290155c7c03a81mr634597pfb.34.1602312313405; 
 Fri, 09 Oct 2020 23:45:13 -0700 (PDT)
Received: from localhost.localdomain ([49.207.200.2])
 by smtp.gmail.com with ESMTPSA id e2sm14219800pjw.13.2020.10.09.23.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 23:45:12 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Sat, 10 Oct 2020 12:14:59 +0530
Message-Id: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Petko Manolov <petkan@nucleusys.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH] net: usb: rtl8150: don't incorrectly
	assign random MAC addresses
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

get_registers() directly returns the return value of
usb_control_msg_recv() - 0 if successful, and negative error number 
otherwise.
However, in set_ethernet_addr(), this return value is incorrectly 
checked.

Since this return value will never be equal to sizeof(node_id), a 
random MAC address will always be generated and assigned to the 
device; even in cases when get_registers() is successful.

Correctly modifying the condition that checks if get_registers() was 
successful or not fixes this problem, and copies the ethernet address
appropriately.

Fixes: f45a4248ea4c ("set random MAC address when set_ethernet_addr() fails")
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 drivers/net/usb/rtl8150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index f020401adf04..bf8a60533f3e 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -261,7 +261,7 @@ static void set_ethernet_addr(rtl8150_t *dev)
 
 	ret = get_registers(dev, IDR, sizeof(node_id), node_id);
 
-	if (ret == sizeof(node_id)) {
+	if (!ret) {
 		ether_addr_copy(dev->netdev->dev_addr, node_id);
 	} else {
 		eth_hw_addr_random(dev->netdev);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
