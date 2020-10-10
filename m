Return-Path: <SRS0=QZ3P=DR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F5BC43457
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 08:29:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79266207CD
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 10 Oct 2020 08:29:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEQ4o52s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79266207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 58A1887837;
	Sat, 10 Oct 2020 08:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rUtZ+ctmKX6L; Sat, 10 Oct 2020 08:29:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E5B5987835;
	Sat, 10 Oct 2020 08:29:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D14F9C07FF;
	Sat, 10 Oct 2020 08:29:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41150C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 08:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 279A087012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 08:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9byqxUZwkLoY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 08:29:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 759968693D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 08:29:43 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id w21so8914230pfc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 10 Oct 2020 01:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ujl0XMo+P2qPzI898K3phXYWEBycnuuMtmf0dkiRFm4=;
 b=hEQ4o52s/F1ZVoAggS29VtGDMZDIdG6bVDIOeyJS6dOmt1JlEwrS39DBQl1HR85b1t
 XWtgMhHfwiUum/ivKsrgwpGWqkRFcBKQAkZdGsG910kGaxF3cYOWs3wYwUsHDGxGmptE
 mWcwOWi/RVH4x/aHn+a5PlsSSx7Et1tRI+ItP4JsJUSn9CZd5Ln52SFSMicOJl0Df+lM
 glb58Msd5Ow+M93wFye0MCgkdJKJIsDIFM0aIUXdoKQhhvBToEF/bbe8TmLaNm8aA0aM
 mappevSsOGzb70suuoiIe38J/rZukwVqojWS0YULTkGsjInzm/wHWS7W8iuZBxu/ORMt
 ggYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ujl0XMo+P2qPzI898K3phXYWEBycnuuMtmf0dkiRFm4=;
 b=qul06P7mo2Va7ScM3upe6xr/MCHi0syGafwYFPjIUDS/0/Jra+rdccGwVJQ5TV6Iu3
 kqweEwP+AqgXsTAqayoBty56MCWjNbockVp6ZgjipFoLsJ6joS0/p/2dJNXzKpRmSBgo
 4BLMclm12vC0NoMeW9SvfMhUKejxBQfqMV4k2Kt96TXinhFMrTPuDGBMk8rqhEThUpIl
 MC/lXL7491mR3HUmRVxWCxxko/mWbir8pQLeKYBplzRMC5R1hGTPh/eeZYYtrcgFkwyF
 1h7uaKszGaRYgiBEpafbRbwKgYLx816DqKYHAhlVyrfFcdV8j4PYhDiOkfWSPfz1Visc
 C9sA==
X-Gm-Message-State: AOAM531XsIOr+oX9PhDDPMcg2Gb1TtQabAwrOrzwtLlJ1/OmOscwplY2
 tau3pvCRjniRfMMKVELAFwNq9xkFjhHU+H1s3J4=
X-Google-Smtp-Source: ABdhPJzFAobmdRLZl/VDshqghj1XOTtQifHi3qfxvI/4/S3GKV3QBrbxn36Te3/przQmxHOrcCU1Vg==
X-Received: by 2002:a62:1851:0:b029:154:8ed7:bf5d with SMTP id
 78-20020a6218510000b02901548ed7bf5dmr15563861pfy.66.1602318582487; 
 Sat, 10 Oct 2020 01:29:42 -0700 (PDT)
Received: from localhost.localdomain ([49.207.200.2])
 by smtp.gmail.com with ESMTPSA id g13sm12991877pgd.82.2020.10.10.01.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 01:29:41 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Sat, 10 Oct 2020 13:59:32 +0530
Message-Id: <20201010082933.5417-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devel@driverdev.osuosl.org, Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 linux-kernel@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>,
 Ian Abbott <abbotti@mev.co.uk>,
 syzbot+009f546aa1370056b1c2@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3] staging: comedi: check validity
	of wMaxPacketSize of usb endpoints found
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
Changes in v3:
	* Correctly list version information

Changes in v2:
	* Fix coding style issue

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
 
+	if (!usb_endpoint_maxp(devpriv->ep_rx) || !usb_endpoint_maxp(devpriv->ep_tx))
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
