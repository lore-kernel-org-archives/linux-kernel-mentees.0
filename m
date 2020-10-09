Return-Path: <SRS0=yWZE=DQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CB4C43457
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 16:17:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E52922281
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 16:17:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPgy8ppf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E52922281
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 515F0877A5;
	Fri,  9 Oct 2020 16:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2OLX374Y1Cw; Fri,  9 Oct 2020 16:17:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D47E6877A1;
	Fri,  9 Oct 2020 16:17:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC829C016F;
	Fri,  9 Oct 2020 16:17:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DA64C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 16:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 11C3F877A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 16:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-PoXjcv803A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 16:17:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E948E877A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 16:17:11 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id h2so4668985pll.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 09 Oct 2020 09:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bmx9gH8QKYILpVv8/AwBKiqUZ1W2aX/bT7meRLse05U=;
 b=cPgy8ppfUqoug6Hor5S2QVmhFZWHFrqJXMkkIlCfoLjsNgIXVupZCDSidSxzpRprlj
 rfjpDWTuGxujG0WGnuwCUd6DtrIqIe0Q4piEXyARszAGEaARe7MERlHX28vBE6rjBXwn
 wmM+lgmATC9rUzbL/+UIHkSlNXi/qBUfCT9r6Mi6QAD4XJCyy6XEmUsTKED84w+Y3gj3
 8j/Y8BiwF6GBByc7N15bCx8BOlnz2THm/VCh31ARuX6A4D//SleD+C8Zo0UXPmgVQdBI
 mMt4n+Q+5NQjk4XxRrSDeY/BaUvWQymMw6xAi760bKR2bgDfqkEBy2f7SpGyHP+Vad6P
 l0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bmx9gH8QKYILpVv8/AwBKiqUZ1W2aX/bT7meRLse05U=;
 b=Qdic9B4C7J50ZyeN+pGRXlbIZcBZI0qPPpSzg9v0KTRuMnPVIewK/3HXJwlZ1tei3v
 kO/vgixr7TzbWpCwMQVyIjCfW1KeLBwyypE7i2R12Wqwx9e/7PJqiv8Trfl6/xJNG2yG
 j1NY2pB2DhpB47xYHqUTF7DBbYbPmec+/N51YUC5W13uU6ykYQCx65WiNUYx26WFJ2PH
 Vpb6a0SbrAOg3kNpBOJdbpcPrl8tTk1DL/fqsFEjV2sEbWPElI4PYMgrPm1Uv/IV3xVi
 FKg2OtkY5DUP7P/1vG8Is6AOlsvMhgIv8YYT8M2caIT8ARwEMrKt0uKHrbZPemfkamCl
 /Obg==
X-Gm-Message-State: AOAM531Xz0nK5MagSKLvFTzgkNPUOQWkU2gcRoxqoMBqK2bJJd+rmD5r
 UKmx2/9HggnonNNpFQaDDkj8vu9VhMyszfw8RAg=
X-Google-Smtp-Source: ABdhPJxAPI/0Ac3xxOCN4zvAfkmbcnL5mU1jLjyIiq9aO2HXzi8cW2Uw5SZniELgmxOPso9AYka+6A==
X-Received: by 2002:a17:902:21:b029:d2:564a:5dc6 with SMTP id
 30-20020a1709020021b02900d2564a5dc6mr12808284pla.14.1602260230641; 
 Fri, 09 Oct 2020 09:17:10 -0700 (PDT)
Received: from localhost.localdomain ([49.207.205.113])
 by smtp.gmail.com with ESMTPSA id s6sm9367662pfd.157.2020.10.09.09.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 09:17:09 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Fri,  9 Oct 2020 21:46:44 +0530
Message-Id: <20201009161646.286286-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devel@driverdev.osuosl.org, Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 linux-kernel@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 Ian Abbott <abbotti@mev.co.uk>,
 syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] staging: comedi: check validity of
	wMaxPacketSize of usb endpoints found
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

While finding usb endpoints in vmk80xx_find_usb_endpoints(), check if 
wMaxPacketSize = 0 for the endpoints found.

Some devices have isochronous endpoints that have wMaxPacketSize = 0
(as required by the USB-2 spec).
However, since this doesn't apply here, wMaxPacketSize = 0 can be
considered to be invalid.

Reported-by: syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com
Tested-by: syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
The error (as detected by syzbot) is generated in 
vmk80xx_write_packet() (which is called in vmk80xx_reset_device()) when
it tries to assign devpriv->usb_tx_buf[0] = cmd.

This NULL pointer dereference issue arises because
size = usb_endpoint_maxp(devpriv->ep_tx) = 0.

This can be traced back to vmk80xx_find_usb_endpoints(), where the usb 
endpoints are found, and assigned accordingly.
(For some more insight, in vmk80xx_find_usb_endpoints(), 
if one of intf->cur_altsetting->iface_desc->endpoints' desc value = 0, 
and consequently this endpoint is assigned to devpriv->ep_tx,
this issue gets triggered.)

Checking if the wMaxPacketSize of an endpoint is invalid and returning
an error value accordingly, seems to fix the error.

We could also alternatively perform this checking (if the size is 0 or not) 
in vmk80xx_reset_device() itself, but it only seemed like covering up the issue
at that place, rather than fixing it, so I wasn't sure that was any better.

However, if I'm not wrong, this might end up causing the probe to fail, and I'm 
not sure if that's the right thing to do in cases like this, and if it isn't I'd
like some input on what exactly is the required course of action in cases like this.

 drivers/staging/comedi/drivers/vmk80xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/comedi/drivers/vmk80xx.c b/drivers/staging/comedi/drivers/vmk80xx.c
index 65dc6c51037e..cb0a965d3c37 100644
--- a/drivers/staging/comedi/drivers/vmk80xx.c
+++ b/drivers/staging/comedi/drivers/vmk80xx.c
@@ -667,6 +667,9 @@ static int vmk80xx_find_usb_endpoints(struct comedi_device *dev)
 	if (!devpriv->ep_rx || !devpriv->ep_tx)
 		return -ENODEV;
 
+	if(!usb_endpoint_maxp(devpriv->ep_rx) || !usb_endpoint_maxp(devpriv->ep_tx))
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
