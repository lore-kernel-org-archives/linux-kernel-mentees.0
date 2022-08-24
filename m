Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1B2C04AA5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Aug 2022 20:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B7B182D14;
	Wed, 24 Aug 2022 20:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B7B182D14
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DJ726nuB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FZlbyZoGnZr; Wed, 24 Aug 2022 20:31:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 179BC82CAC;
	Wed, 24 Aug 2022 20:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 179BC82CAC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB5AAC0033;
	Wed, 24 Aug 2022 20:31:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8C3EC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 20:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C44294059D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 20:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C44294059D
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DJ726nuB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id anXeahbDlu5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 20:31:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 958BD401C2
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 958BD401C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 20:31:17 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id x26so352355pfo.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 13:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=JS396VO3RjIxv2EdN1gwXH0IVteoC89fKy018NJlSI4=;
 b=DJ726nuBhrKxCRN9Vl4h7nD8MJ9khauabketOtwG96ztSRmma9M2LL737/A973Xm9/
 A1HkXBFymyUePR2E65G300Nu0vcvXoSh7vP9CmNxstGOJjC3LuPq5bjRN/MqD29p11Cu
 e9+zoPU/vd+hzx4fofmm420f8lNB6OU4ddogOkU/FYfvo2ylDNeAVULRKnHLtkMRpFkE
 BI+OsrRnTz/MLZo4RhPEXOPRggF7kJYn0o3TKB5iNo33Zs+z5dlAuY4/T2YOD40VRtW8
 bBBEFN+hg0pj3Q1FhcWVDQLA0ObqaGwnvNRgA6BDYen8z7S6f7Na6J5aB5BX8lgRU3M+
 7vTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JS396VO3RjIxv2EdN1gwXH0IVteoC89fKy018NJlSI4=;
 b=JH91V6Tv5I6n3ko4OWcpFQIZPy9rZoCWXAa3/bBH6D1tXtHfINqde4OeteUuWK3TFR
 ErGuvfg5Bci4EFd2XL7tcP/9A8OsDxXFPtjvv2pcf6wgPtCuINkPGapkizu7+9BvprRE
 eMqSJvXLOLDqFsVN6f1CfxoitR7zMZTrNIAx0C43MHek59VPEKBo4ENyO2VWR8eP6Q0X
 ynLH5LRu3CYtmifcMzlYlVb/40HSmX7oZFUXO9jvYHEihVCDNNStc5lxvnTFJFRKKEJh
 gllv0bCnXXPr/2s1vZ0ImYkEU4WcQv978nz1lghmjT0WJmOKRuqozvKgkZ04fhGVLdYf
 ZoRQ==
X-Gm-Message-State: ACgBeo3m6F4r2Gj9vwv/AWWxHj5SWVNydKYvKrkmZOtqMmasvH46u7yn
 31mk7vKqRkGzNOfNpHERRso=
X-Google-Smtp-Source: AA6agR7J3xx58TIIiBDRjMFIdMcuBK4hAzDg9M0xKet4Ornl9P/KbcddihwBWRKszlRF1Uk8iDebDw==
X-Received: by 2002:aa7:88d0:0:b0:536:e993:730d with SMTP id
 k16-20020aa788d0000000b00536e993730dmr813054pff.81.1661373077014; 
 Wed, 24 Aug 2022 13:31:17 -0700 (PDT)
Received: from fedora.. ([103.159.189.138]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902dacc00b0017269cc60d7sm13065714plx.214.2022.08.24.13.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 13:31:16 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] usb: host: Initiate urb ep with udev ep0
Date: Thu, 25 Aug 2022 02:31:07 +0600
Message-Id: <20220824203107.14908-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, Arnd Bergmann <arnd@arndb.de>,
 linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Kaehlcke <mka@chromium.org>, Weitao Wang <WeitaoWang-oc@zhaoxin.com>
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

Currently we look up for endpoint in a table and initate urb endpoint
with it. This is unnecessary because the lookup will always result in
endpoint 0.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
Changes since v1:
 - Remove endpoint lookup and NULL check
 - Remove unnecessary variable *ep
 - Initiate urb ep with udev ep0
 - Update commit message
 - v1 Link: https://lore.kernel.org/lkml/20220824130702.10912-1-khalid.masum.92@gmail.com/ 

 drivers/usb/core/hcd.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 94b305bbd621..05f30ae5570b 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2158,21 +2158,14 @@ static struct urb *request_single_step_set_feature_urb(
 {
 	struct urb *urb;
 	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
-	struct usb_host_endpoint *ep;
 
 	urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (!urb)
 		return NULL;
 
 	urb->pipe = usb_rcvctrlpipe(udev, 0);
-	ep = (usb_pipein(urb->pipe) ? udev->ep_in : udev->ep_out)
-				[usb_pipeendpoint(urb->pipe)];
-	if (!ep) {
-		usb_free_urb(urb);
-		return NULL;
-	}
 
-	urb->ep = ep;
+	urb->ep = &udev->ep0;
 	urb->dev = udev;
 	urb->setup_packet = (void *)dr;
 	urb->transfer_buffer = buf;
-- 
2.37.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
