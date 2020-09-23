Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87008C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 09:06:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC3F120838
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 09:06:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MN7prrBh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC3F120838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67FB0860D1;
	Wed, 23 Sep 2020 09:06:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JW8qdnS2dZCS; Wed, 23 Sep 2020 09:06:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 091558607A;
	Wed, 23 Sep 2020 09:06:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E708BC0889;
	Wed, 23 Sep 2020 09:06:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11B46C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F0CE5228E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X+Lj6RoGbeTx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 1B9D7203F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:36 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s19so769777plp.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 02:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4hMw1RpDG2ueDcMztQfcOaK5AOnLojLAqwfMF9XGROw=;
 b=MN7prrBhdAPs9exEUsWKusuKzl+zDaoVHcta4SOezeQVnnRK5JTMfxKgvIRUrfqlX1
 JxxNYW8aKO7LGB3q24iqWgnrCuatOU5YRcc6Q2jSee48qbDjTJiJ0o5sngLHOyXQJC1H
 Cbqo9NTVpBOOmOmJHvCR4b1bxBYGTHFHET3VyrHj29oOVO+6sHKRCAdlZfzbFHByduhq
 VFBgRY7th3zbBn/cbsRKwvjQDkcpHC3814F2BQ6Zi9ET8dx8ImzcO7qykgSJqJQ2E6X4
 XyvCPI1SxjoPQggMxxlUh+a462MlD8gFNWEpwb7U1TXPENOcWl40BPj7GEIZYSJ+6cc6
 Rseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4hMw1RpDG2ueDcMztQfcOaK5AOnLojLAqwfMF9XGROw=;
 b=DVh2LRUQOczwYUyz+YLe3LZhNQdSa4a8x4EwMAuYPOKyNiaNjVTzt0GGqrD9oaNXBQ
 E6RGnqrqTO+bTnjhry+5psxo/0ig1tlZLDkf9mt3RzK+rXDIfv8QvN0uYdp/OZJK4mAy
 NigEZF8+3gYpjlLkV3rhmZS+Ys/Cnpn4xK+VaI20XE6BQrXgvwp7lLhe0My5CN1u9UGr
 6kJVEiyt1fm9QvjuH8a2sVVbkE9o45+hwUEswrSgWT7q2dLPnn1Vk9fGNWSb868bkkPB
 UBfBwg/d5vj4LU+TKFFrh0qsfiIbdsNfh0UM5cteNuIhUF5AfkFQXVZIsGqsVrbNnrGb
 nFMA==
X-Gm-Message-State: AOAM533b7SamI2GF0D2Ka1x/ANmRwEJQUvW5epU9L6SzCrAyZvYdX+Qx
 IiKVfJv/bcTt0idyBhpGSVY=
X-Google-Smtp-Source: ABdhPJzxcZopb1qURZ4Ezng98Hm8eG9OwKY8RKzypvJ2LdSnc67p6QCdccsb2i+2hqermlODln9MnQ==
X-Received: by 2002:a17:902:ab87:b029:d2:1ceb:34 with SMTP id
 f7-20020a170902ab87b02900d21ceb0034mr8728665plr.12.1600851995638; 
 Wed, 23 Sep 2020 02:06:35 -0700 (PDT)
Received: from localhost.localdomain ([2405:205:c8e3:4b96:985a:95b9:e0cd:1d5e])
 by smtp.gmail.com with ESMTPSA id a13sm16496226pgq.41.2020.09.23.02.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 02:06:35 -0700 (PDT)
From: Himadri Pandya <himadrispandya@gmail.com>
To: davem@davemloft.net, kuba@kernel.org, oneukum@suse.com,
 pankaj.laxminarayan.bharadiya@intel.com, keescook@chromium.org,
 yuehaibing@huawei.com, petkan@nucleusys.com, ogiannou@gmail.com
Date: Wed, 23 Sep 2020 14:35:17 +0530
Message-Id: <20200923090519.361-3-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923090519.361-1-himadrispandya@gmail.com>
References: <20200923090519.361-1-himadrispandya@gmail.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/4] net: sierra_net: use
	usb_control_msg_recv()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The new usb api function usb_control_msg_recv() nicely wrapps
usb_control_msg() with proper error check. Hence use it instead of
directly calling usb_control_msg().

Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
---
 drivers/net/usb/sierra_net.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/net/usb/sierra_net.c b/drivers/net/usb/sierra_net.c
index 0abd257b634c..f3a5f83cb256 100644
--- a/drivers/net/usb/sierra_net.c
+++ b/drivers/net/usb/sierra_net.c
@@ -478,16 +478,13 @@ static void sierra_net_kevent(struct work_struct *work)
 			return;
 
 		ifnum = priv->ifnum;
-		len = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
-				USB_CDC_GET_ENCAPSULATED_RESPONSE,
-				USB_DIR_IN|USB_TYPE_CLASS|USB_RECIP_INTERFACE,
-				0, ifnum, buf, SIERRA_NET_USBCTL_BUF_LEN,
-				USB_CTRL_SET_TIMEOUT);
-
-		if (len < 0) {
-			netdev_err(dev->net,
-				"usb_control_msg failed, status %d\n", len);
-		} else {
+		len = usb_control_msg_recv(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
+					   USB_CDC_GET_ENCAPSULATED_RESPONSE,
+					   USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
+					   0, ifnum, buf, SIERRA_NET_USBCTL_BUF_LEN,
+					   USB_CTRL_SET_TIMEOUT);
+
+		if (len) {
 			struct hip_hdr	hh;
 
 			dev_dbg(&dev->udev->dev, "%s: Received status message,"
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
