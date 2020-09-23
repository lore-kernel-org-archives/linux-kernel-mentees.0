Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7B1C4727D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 09:06:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C43F21924
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 09:06:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgLNdF2R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C43F21924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BBA6386741;
	Wed, 23 Sep 2020 09:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-meoOBNZxMe; Wed, 23 Sep 2020 09:06:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2788A86004;
	Wed, 23 Sep 2020 09:06:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23245C0889;
	Wed, 23 Sep 2020 09:06:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4193CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 340BB22D10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4KsLgI9ld429
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 7FBF1203F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 09:06:55 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 7so13984041pgm.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 02:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nCiWWFhPZHev6oEz8DjlpYK4lz9H8pn9x46uJm2Olsw=;
 b=MgLNdF2RgGy0Y7v89R1UC4S84n8EAycuEswaYSu7ys11XIGLnCTwJkdYnef+/EWOhd
 /+GVeEf22uDINRfdERiHGMYB1K9cob+LGc7P5L2mQ3vHYhBjGvxdCraFqL3QsVgaEX5Y
 GjM/RB9A/3VKzbT5O6Sk9mzQq7dRUggoiR+xaoNEtnSjftBJT7pJno+pzW6U5jQ5zSK3
 ufXxacUn3fLp7LtuiCdsO4MgpKX9DUXdwRgWf5UNwYs61XY+vmV5fmOlLWRoTTV/oHkQ
 pquXNlQstKZrAOQDbrDmbPtHBf7nU2JeM0cPG30QxBNWIOnK5MkXq7lqHQ8WB/V9ajc1
 wpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nCiWWFhPZHev6oEz8DjlpYK4lz9H8pn9x46uJm2Olsw=;
 b=cq0U0ZwliRceQmjqpqpt/Dxesac/lIWBBqoneVD5vvF0KV/21jEuNTKJkqUCTkZ3vu
 c3b3P8JiiW+KOzPNeKQnI8eKPaCmnFY670w6C7Mr5/y/VDZz1b2UPIFFV7FOR1hpAVDf
 DMGH5aeGjG5JFcHDPH3HJj+v+FzPdDYA76H6J4Ht1cSVH+0TIMHz/pGTVyttFsSE7Q6R
 WL8ldSHW9R4u7KavW3dx83ws/qpvgwTsOSR2rE6VgXghoPTCMuCFoizdqxjRr11jorSL
 mBH0qVDq4+j/kf40N1Ex6ttQrgUNhgRPX8eycTkLHZ6cDSemBKkl96ugVyLYCChRw3rF
 k1zQ==
X-Gm-Message-State: AOAM530RQY45NqtCOuTdJn7xU4Nh8N5eW+WTLoNgQgFPw2bCBrG1OMev
 9YdiAxwayp9OQr/6qScLy7o=
X-Google-Smtp-Source: ABdhPJyhgq8hJykGKP8WPG3DhPxvF42QE1aH6zDRXCfxkxSWkDChBSkLj4Om8/Pg4+SRnSpW7WE1CQ==
X-Received: by 2002:a62:e90b:0:b029:13e:b622:3241 with SMTP id
 j11-20020a62e90b0000b029013eb6223241mr7946741pfh.12.1600852014989; 
 Wed, 23 Sep 2020 02:06:54 -0700 (PDT)
Received: from localhost.localdomain ([2405:205:c8e3:4b96:985a:95b9:e0cd:1d5e])
 by smtp.gmail.com with ESMTPSA id a13sm16496226pgq.41.2020.09.23.02.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 02:06:54 -0700 (PDT)
From: Himadri Pandya <himadrispandya@gmail.com>
To: davem@davemloft.net, kuba@kernel.org, oneukum@suse.com,
 pankaj.laxminarayan.bharadiya@intel.com, keescook@chromium.org,
 yuehaibing@huawei.com, petkan@nucleusys.com, ogiannou@gmail.com
Date: Wed, 23 Sep 2020 14:35:19 +0530
Message-Id: <20200923090519.361-5-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923090519.361-1-himadrispandya@gmail.com>
References: <20200923090519.361-1-himadrispandya@gmail.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 4/4] net: rndis_host: use
	usb_control_msg_recv() and usb_control_msg_send()
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

The new usb_control_msg_recv() and usb_control_msg_send() nicely wraps
usb_control_msg() with proper error check. Hence use the wrappers
instead of calling usb_control_msg() directly.

Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
---
 drivers/net/usb/rndis_host.c | 44 ++++++++++++++----------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/net/usb/rndis_host.c b/drivers/net/usb/rndis_host.c
index 6fa7a009a24a..30fc4a7183d3 100644
--- a/drivers/net/usb/rndis_host.c
+++ b/drivers/net/usb/rndis_host.c
@@ -113,14 +113,13 @@ int rndis_command(struct usbnet *dev, struct rndis_msg_hdr *buf, int buflen)
 		buf->request_id = (__force __le32) xid;
 	}
 	master_ifnum = info->control->cur_altsetting->desc.bInterfaceNumber;
-	retval = usb_control_msg(dev->udev,
-		usb_sndctrlpipe(dev->udev, 0),
-		USB_CDC_SEND_ENCAPSULATED_COMMAND,
-		USB_TYPE_CLASS | USB_RECIP_INTERFACE,
-		0, master_ifnum,
-		buf, le32_to_cpu(buf->msg_len),
-		RNDIS_CONTROL_TIMEOUT_MS);
-	if (unlikely(retval < 0 || xid == 0))
+	retval = usb_control_msg_send(dev->udev, 0,
+				      USB_CDC_SEND_ENCAPSULATED_COMMAND,
+				      USB_TYPE_CLASS | USB_RECIP_INTERFACE,
+				      0, master_ifnum, buf,
+				      le32_to_cpu(buf->msg_len),
+				      RNDIS_CONTROL_TIMEOUT_MS);
+	if (unlikely(xid == 0))
 		return retval;
 
 	/* Some devices don't respond on the control channel until
@@ -139,14 +138,11 @@ int rndis_command(struct usbnet *dev, struct rndis_msg_hdr *buf, int buflen)
 	/* Poll the control channel; the request probably completed immediately */
 	rsp = le32_to_cpu(buf->msg_type) | RNDIS_MSG_COMPLETION;
 	for (count = 0; count < 10; count++) {
-		memset(buf, 0, CONTROL_BUFFER_SIZE);
-		retval = usb_control_msg(dev->udev,
-			usb_rcvctrlpipe(dev->udev, 0),
-			USB_CDC_GET_ENCAPSULATED_RESPONSE,
-			USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
-			0, master_ifnum,
-			buf, buflen,
-			RNDIS_CONTROL_TIMEOUT_MS);
+		retval = usb_control_msg_recv(dev->udev, 0,
+					      USB_CDC_GET_ENCAPSULATED_RESPONSE,
+					      USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
+					      0, master_ifnum, buf, buflen,
+					      RNDIS_CONTROL_TIMEOUT_MS);
 		if (likely(retval >= 8)) {
 			msg_type = le32_to_cpu(buf->msg_type);
 			msg_len = le32_to_cpu(buf->msg_len);
@@ -178,17 +174,11 @@ int rndis_command(struct usbnet *dev, struct rndis_msg_hdr *buf, int buflen)
 				msg->msg_type = cpu_to_le32(RNDIS_MSG_KEEPALIVE_C);
 				msg->msg_len = cpu_to_le32(sizeof *msg);
 				msg->status = cpu_to_le32(RNDIS_STATUS_SUCCESS);
-				retval = usb_control_msg(dev->udev,
-					usb_sndctrlpipe(dev->udev, 0),
-					USB_CDC_SEND_ENCAPSULATED_COMMAND,
-					USB_TYPE_CLASS | USB_RECIP_INTERFACE,
-					0, master_ifnum,
-					msg, sizeof *msg,
-					RNDIS_CONTROL_TIMEOUT_MS);
-				if (unlikely(retval < 0))
-					dev_dbg(&info->control->dev,
-						"rndis keepalive err %d\n",
-						retval);
+				retval = usb_control_msg_send(dev->udev, 0,
+							      USB_CDC_SEND_ENCAPSULATED_COMMAND,
+							      USB_TYPE_CLASS | USB_RECIP_INTERFACE,
+							      0, master_ifnum, msg, sizeof(*msg),
+							      RNDIS_CONTROL_TIMEOUT_MS);
 				}
 				break;
 			default:
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
