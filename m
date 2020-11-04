Return-Path: <SRS0=I1jd=EK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA359C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22A962222B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:47:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ce47NTPV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22A962222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9EE8987493;
	Wed,  4 Nov 2020 06:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BuIqr-RvkcX; Wed,  4 Nov 2020 06:47:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3000D8746C;
	Wed,  4 Nov 2020 06:47:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 274AEC088B;
	Wed,  4 Nov 2020 06:47:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4529EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2F35586978
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LLe05h9Ia6E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5049C869E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:47:33 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id u4so3930285pgr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IGCdR2zg93PxLfowoIUOGeqadZduI79Y1jQCNcPvnfw=;
 b=Ce47NTPV8niNPcpAYfYF2OEl7IvkfZ+6P937ZnFxssbhp64mXlNjGNiz95ujP+8EN/
 /SzZ6hKE78Ip6regihBDTo/GHyKcgiCX3OjPbPyUvKhjMN4woLcTXPSYymIKhu85RX62
 tptBy7wqqkFdBhIo4n6xArDqUpVuyuSwQ7gX1qFdt19ns4M3UDSlFK5g4/5y6Mv4UvY5
 IqcOSLDJRN84MNmN5CgBsHPmjV/PSLWJIbGqlkkE4yM6N29bvIVInwYcl/5XyGmb4zmU
 JiK+Bsi4qWzpPDXhMJJqpXoL/DSDYRyxsAQX9PQnV+4HM65NudqM9Xj/xipmCCpaRYnn
 kOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IGCdR2zg93PxLfowoIUOGeqadZduI79Y1jQCNcPvnfw=;
 b=bleXDXmUq7U5uA34PITW93VdEcwKTSH0Sg3q6Cfn9mpfRiMYp3qaJlkL0O7+Uuwr26
 /vV6zk/7OPsv/w7ZwT53FIMJ0oLUfIFYsM3BLDN+9gMOXkgTjlVvTiO8u+TUt6iu3Yls
 kipJzvYH2eQKmJAUa3XOO6Prd9ZOrnF15E7JbpijjEDDz623ImPNih8fHjEyJbteslQs
 n1Da1QRgsIrL2hX8fwjhlH+cFxkQuVsg60Fet6L3Qq/3+R12+fYv0374kUmxU5PHtnRD
 UcTC8Dj1XBd9Xfh7iXnenWymA24b0MlryUrMlPn23hTBsmAqlCYJrFv3hslALXUcEB7c
 Ue6g==
X-Gm-Message-State: AOAM533M6e06zoPmeXrRSjNfYkyXZ0Ox+DDQ7eyh5jirHSrENDmgj7vk
 3J3riSkUmqjWaro+6WWYvio=
X-Google-Smtp-Source: ABdhPJwHD78ybryi7ZO7u5PSZtfGLkLqwqQ6nfgHB3CPsSeV4quBSMb/+N7R9bIwgcw9R1hc1N5whQ==
X-Received: by 2002:a17:90a:5285:: with SMTP id
 w5mr3010576pjh.50.1604472452997; 
 Tue, 03 Nov 2020 22:47:32 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:47:32 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:16:49 +0530
Message-Id: <20201104064703.15123-2-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 01/15] usb: serial: ark3116: use
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
 drivers/usb/serial/ark3116.c | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/serial/ark3116.c b/drivers/usb/serial/ark3116.c
index 71a9206ea1e2..51302892c779 100644
--- a/drivers/usb/serial/ark3116.c
+++ b/drivers/usb/serial/ark3116.c
@@ -77,38 +77,17 @@ struct ark3116_private {
 static int ark3116_write_reg(struct usb_serial *serial,
 			     unsigned reg, __u8 val)
 {
-	int result;
 	 /* 0xfe 0x40 are magic values taken from original driver */
-	result = usb_control_msg(serial->dev,
-				 usb_sndctrlpipe(serial->dev, 0),
-				 0xfe, 0x40, val, reg,
-				 NULL, 0, ARK_TIMEOUT);
-	if (result)
-		return result;
-
-	return 0;
+	return usb_control_msg_send(serial->dev, 0, 0xfe, 0x40, val, reg, NULL, 0,
+				    ARK_TIMEOUT, GFP_KERNEL);
 }
 
 static int ark3116_read_reg(struct usb_serial *serial,
 			    unsigned reg, unsigned char *buf)
 {
-	int result;
 	/* 0xfe 0xc0 are magic values taken from original driver */
-	result = usb_control_msg(serial->dev,
-				 usb_rcvctrlpipe(serial->dev, 0),
-				 0xfe, 0xc0, 0, reg,
-				 buf, 1, ARK_TIMEOUT);
-	if (result < 1) {
-		dev_err(&serial->interface->dev,
-				"failed to read register %u: %d\n",
-				reg, result);
-		if (result >= 0)
-			result = -EIO;
-
-		return result;
-	}
-
-	return 0;
+	return usb_control_msg_recv(serial->dev, 0, 0xfe, 0xc0, 0, reg, buf, 1,
+				    ARK_TIMEOUT, GFP_KERNEL);
 }
 
 static inline int calc_divisor(int bps)
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
