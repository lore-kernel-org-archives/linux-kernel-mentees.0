Return-Path: <SRS0=nKGu=A4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1617DC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:36:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDEF82071A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/hVv9WX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDEF82071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9C41A87FE3;
	Fri, 17 Jul 2020 07:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n8+-tosnzXAX; Fri, 17 Jul 2020 07:36:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3498587FC1;
	Fri, 17 Jul 2020 07:36:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23D3BC0893;
	Fri, 17 Jul 2020 07:36:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF738C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A95B720416
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LS3ewrXGP0R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id F24A62046A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:08 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id l6so5091555plt.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 00:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zkwfq5Uv+GY1uwPYszvR2jSGTXRIJ42mdhpNQh9+c3E=;
 b=D/hVv9WX7fGnjTnF2TtlxKi9Bdv2r5Yn5MpmXaqQWPwk0Bo77NAho3BfGjVUWXXK8A
 WRaB5KCjbZxQDG4AAJt0SgsgSAlsdkzhWRa34HOhCjzqDcZZ3T9E1jjCsAvmGTNzTujF
 Tp9YH1m1vY6WvnzkxxzXfCKF0TfNxt2GPF1Qd6TPIqmtxwykQrx8jvL7gqcy0noBmYm+
 CvphtLW3S+Z6PxUIa8vv81Q+8nXuYmqNBlvHdLKMyG5ERv4p6qFmS7UH2+d12erO2tnN
 sHcQelcUWEj4IQOxZzuSIu8FRyATnAokIIBKDWO7ZKct9POBXTqDUYSMH0yJzmCimdqP
 XW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zkwfq5Uv+GY1uwPYszvR2jSGTXRIJ42mdhpNQh9+c3E=;
 b=aL443XIardlGEhpaKsueKTiS8W9/T4JAARzc5EcCkZiV7B6HRnzWyBhlYTjUwn29lu
 mQjpkkHF2RMqNHKhktF5WlAjhEwv20mcF7BFPf7TC65PHvn+fQc9iKoSKYTa4fJhy02f
 JwO10/nDs219dD26ITIT0maur6+nBGK4Z7d5PwahqLKQBvzVLkbtVKoIQCf0AL3SlmQa
 gku5oUX5ZQX5DFPUxvAdoZOkglCfRfY11nCNSUAEzcvMvXtwM1/41zdkkS92o47ViZ/8
 hu0jmpSk0GTFDdK6GDa5SESPjBXhp7uzx63yxivLZbDJIjP885WY63N03r2hnMf6p+X9
 gf9A==
X-Gm-Message-State: AOAM532LDPXTCZ5byMY+b2mjbdGnMt4wcYgBCo4xh9JOnIPc/bVzxBsc
 EdwdC3JNpOSGzAqovHGKrzE=
X-Google-Smtp-Source: ABdhPJy0xCmVamzmwrOZ/O76sKzkqD/pUvypW+uITtcfZz1jLPRMSXMKmbiaordscXX7klkOaMe1SQ==
X-Received: by 2002:a17:902:525:: with SMTP id 34mr6945679plf.80.1594971368500; 
 Fri, 17 Jul 2020 00:36:08 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id z25sm6794704pfg.140.2020.07.17.00.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 00:36:08 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 17 Jul 2020 13:04:32 +0530
Message-Id: <20200717073436.249623-3-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
References: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3 2/6] cx23885: use generic power
	management
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
Still, their power management structure follows the legacy framework. To
bring it under the generic framework, simply remove the binding of
callbacks from struct "pci_driver".

Compile-tested only.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/media/pci/cx23885/cx23885-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index 7e0b0b7cc2a3..4b0c53f61fb7 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -2235,9 +2235,6 @@ static struct pci_driver cx23885_pci_driver = {
 	.id_table = cx23885_pci_tbl,
 	.probe    = cx23885_initdev,
 	.remove   = cx23885_finidev,
-	/* TODO */
-	.suspend  = NULL,
-	.resume   = NULL,
 };
 
 static int __init cx23885_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
