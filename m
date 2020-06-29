Return-Path: <SRS0=91P4=AK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5981EC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:37:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 287E023142
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Jun 2020 07:37:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoWk5+P4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 287E023142
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0786088558;
	Mon, 29 Jun 2020 07:37:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id euESe+VGYZDT; Mon, 29 Jun 2020 07:37:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A94148853B;
	Mon, 29 Jun 2020 07:37:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98743C07FF;
	Mon, 29 Jun 2020 07:37:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFD7EC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AF69A86AB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrwsM5aMcMPw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5FAF385F49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 07:37:34 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q17so7531009pfu.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jun 2020 00:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M1eWlmJknPlaq4iBEb26E6JSPq8jyG2XC9mR0Df08JE=;
 b=ZoWk5+P4rjcM0P7NJzK7080uXsU6qIIS3avQ6XYyaJJKtaWZpbT29DeSJXZg5qoR7M
 7CBFX08H84xXbjEGQVj6g57MZ8Cv8uyNbXonrVuHNLgqF46jAdpvi8ocxy8GjNWjC4C3
 +3LmIIy6TrhWf7m4KllNP6crK/ELeX+2vuDlJ6p25HiG2GP1/1jN7IIqnxQNMeQJmdT4
 rK6u/59MNeUV7ciVPBV5i83zSsn3/dv35xyVBBysuH/83LhOfG9qZjpZbpoAw28Gd9c4
 dIvKeEOEaOcc3dE7y8kaqkdzAAFVsqgbX4fAUTWcXu5rX3K4YkPkqmFwx9x8iA+yXOD4
 uvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M1eWlmJknPlaq4iBEb26E6JSPq8jyG2XC9mR0Df08JE=;
 b=dst1Nz/SzCo5KEDjLE7TAH9sDUApct8R8hI7uamQvsY0caZYXmgn9Y2DHTV6ZAPgK7
 RdyT0q6jzRD+JpFnPis86os28KQZag2MRxCC/Wm2FaI82MrRO97UIyUT1T5BGWoLNMVN
 fSly9lQwbYE+SLVTFfS6AAqzdf2M13EKfIcW4ywvMQSVVbIUduJRaFRakhcv2k3Ax9LO
 WDMvFU3Q6Q69+2ioUO5vCITqWPKj+LYexqM6sqmm2q7eWJ7SIeFUNvrd2qHZA4sRCpTw
 1gfgQqlMykPfPxuKn+44AR2aNOJwh1Mp8A871yv18ddWY2wLViJTDqBbr+X8jfsplbNI
 rzfg==
X-Gm-Message-State: AOAM530LebxcI4kpEFmUnfZlhCQP96r+KyUoB58UbPe/1wXauQZtPXJp
 ZOUSEFFvE/g/48AN6iaAh1s=
X-Google-Smtp-Source: ABdhPJydYwb6IghBaB9/JJLG0sM0hcusmh3mXrqhfkRKFx43w7QdBeZoPsQYEN6Kw++x7HYyl1rBYw==
X-Received: by 2002:a63:5c55:: with SMTP id n21mr8836754pgm.27.1593416253909; 
 Mon, 29 Jun 2020 00:37:33 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.57])
 by smtp.gmail.com with ESMTPSA id q10sm34673004pfk.86.2020.06.29.00.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 00:37:33 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Mon, 29 Jun 2020 13:06:01 +0530
Message-Id: <20200629073604.205478-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
References: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1 3/6] [media] cx25821: use generic
	power management
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

The .suspend() and .resume() callbacks are not defined for this driver.
Still, their power managemgement stucture can be easily upgraded to
gemeric, without affecting its normal behaviour.

Hence, define them NULL and use struct dev_pm_ops type to bind them.

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/cx25821/cx25821-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
index 41be22ce66f3..59501939d741 100644
--- a/drivers/media/pci/cx25821/cx25821-core.c
+++ b/drivers/media/pci/cx25821/cx25821-core.c
@@ -1369,14 +1369,18 @@ static const struct pci_device_id cx25821_pci_tbl[] = {
 
 MODULE_DEVICE_TABLE(pci, cx25821_pci_tbl);
 
+#define cx25821_suspend NULL
+#define cx25821_resume NULL
+
+static SIMPLE_DEV_PM_OPS(cx25821_pm_ops, cx25821_suspend, cx25821_resume);
+
 static struct pci_driver cx25821_pci_driver = {
 	.name = "cx25821",
 	.id_table = cx25821_pci_tbl,
 	.probe = cx25821_initdev,
 	.remove = cx25821_finidev,
 	/* TODO */
-	.suspend = NULL,
-	.resume = NULL,
+	.driver.pm = &cx25821_pm_ops,
 };
 
 static int __init cx25821_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
