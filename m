Return-Path: <SRS0=IxsT=CZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBCFC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 05:07:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9FB620936
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Sep 2020 05:07:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVC2T637"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9FB620936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 31A438698B;
	Wed, 16 Sep 2020 05:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t-PKkN5ajdri; Wed, 16 Sep 2020 05:07:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A90868697C;
	Wed, 16 Sep 2020 05:07:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F542C0859;
	Wed, 16 Sep 2020 05:07:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDC42C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 05:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C577E8734A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 05:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bs-xxX8Kg2QH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 05:07:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0A6EF87349
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Sep 2020 05:07:17 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id o16so950978pjr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 22:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRRVZQATJVxdmxym9cYS4r8KR3RWYxM+eecLHTbYKPE=;
 b=aVC2T637dzhAw/XBS0mqij3Sm2gNdKH71qrUuBjRZC4Xc2udN+J6iTb+mtgJeGDfzX
 1iu9AFzMGkFfU0GRVYO5vVDboPQs8etP9zBvfmulOczq9JdFP0x9UKBnpzo8S0FCx/Vy
 TcfffegkK3cRDB+1LS7J0dl1/CADD3Zld/eWTsXXYrtuky2GwRm/5/8ZnJukNHSjr2zl
 AeeUPEGh5+QicmNMzFWuBL86RyUX0qDUb1WjlyqKIBfNjSYImx3Aixn1HMD0Y3BuI/Pb
 zkZQKpurvYn2vNPo4v8UfqjZrwKbm5kWHqgIIUEQvprgL+LaQSZMi3jMSAOb0BMDt2xL
 gwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRRVZQATJVxdmxym9cYS4r8KR3RWYxM+eecLHTbYKPE=;
 b=q2RsUl5xGXkNq1BUeBpGjvcxAfuVaXasWSH2lWkY2GqX1qjPcJNYCuGvb9bYn+yHdr
 ytDoFAf28o1ORsHmPl6gPitfihi5rTHGltQgUKD1JDNUNwk7f3OK+wBumwhzMmAS1j3U
 tD5VAJclL/1gqg4KkAzym+plqcuqnNmik+x2IXYrphekLY99TcUAnvAr8VTb5hAHOrUh
 +u133lOCHTxmuF1fdVTLAAZ0pPmhaSjEHfbfvxh2xeSAEHZza6w8k5rjOCijMKmzFqPj
 pt8rHWE4BmX11uO3tb4VRT99dACzmGBjCvZRb8eRx67m1bgwSjK4HgaIJEustj1ekoWQ
 nvFA==
X-Gm-Message-State: AOAM5322/j6861x2egwy9QhRndlgxR2ZGs18TBBR7ROvCYMZmpSwoMYP
 Dq3pfr4mhxtpfm3O6FPviCs9CVwEdbL3LIRU+aY=
X-Google-Smtp-Source: ABdhPJyJ+cNX0PC6p643Vv5Ufb4fI56gTf58TjK5qVI6yEX/Z6q7hcMqJYTTdXwOCzLJs8JTaoE69Q==
X-Received: by 2002:a17:902:b185:b029:d1:e5e7:bdd1 with SMTP id
 s5-20020a170902b185b02900d1e5e7bdd1mr4953338plr.49.1600232836024; 
 Tue, 15 Sep 2020 22:07:16 -0700 (PDT)
Received: from localhost.localdomain ([49.207.198.18])
 by smtp.gmail.com with ESMTPSA id i20sm13108051pgk.77.2020.09.15.22.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 22:07:15 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Wed, 16 Sep 2020 10:35:40 +0530
Message-Id: <20200916050540.15290-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Petko Manolov <petkan@nucleusys.com>,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH] rtl8150: set memory to all 0xFFs on
	failed register reads
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

get_registers() copies whatever memory is written by the
usb_control_msg() call even if the underlying urb call ends up failing.

If get_registers() fails, or ends up reading 0 bytes, meaningless and 
junk register values would end up being copied over (and eventually read 
by the driver), and since most of the callers of get_registers() don't 
check the return values of get_registers() either, this would go unnoticed.

It might be a better idea to try and mirror the PCI master abort
termination and set memory to 0xFFs instead in such cases.

Fixes: https://syzkaller.appspot.com/bug?extid=abbc768b560c84d92fd3
Reported-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
Tested-by: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 drivers/net/usb/rtl8150.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 733f120c852b..04fca7bfcbcb 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -162,8 +162,13 @@ static int get_registers(rtl8150_t * dev, u16 indx, u16 size, void *data)
 	ret = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
 			      RTL8150_REQ_GET_REGS, RTL8150_REQT_READ,
 			      indx, 0, buf, size, 500);
-	if (ret > 0 && ret <= size)
+
+	if (ret < 0)
+		memset(data, 0xff, size);
+
+	else
 		memcpy(data, buf, ret);
+
 	kfree(buf);
 	return ret;
 }
@@ -276,7 +281,7 @@ static int write_mii_word(rtl8150_t * dev, u8 phy, __u8 indx, u16 reg)
 
 static inline void set_ethernet_addr(rtl8150_t * dev)
 {
-	u8 node_id[6];
+	u8 node_id[6] = {0};
 
 	get_registers(dev, IDR, sizeof(node_id), node_id);
 	memcpy(dev->netdev->dev_addr, node_id, sizeof(node_id));
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
