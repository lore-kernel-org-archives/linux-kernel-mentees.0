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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEF0C433EC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:36:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CB432071A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jul 2020 07:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBGOosQ4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CB432071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D2C787FD4;
	Fri, 17 Jul 2020 07:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0UfTx3JxUyfU; Fri, 17 Jul 2020 07:36:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 631CC87FDD;
	Fri, 17 Jul 2020 07:36:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 527EFC0893;
	Fri, 17 Jul 2020 07:36:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF0ECC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BAE7687FC8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZANrXf4Gvqub
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6E01387FC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 07:36:20 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w2so6276668pgg.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jul 2020 00:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uoIcD6K+jqu+zRT0DyWA5LlYkttEC1REY3iS6fetokg=;
 b=BBGOosQ4rdLrE+BvisBUEjDWy3yz8138qDCHb1T8Ez7G4qhwkV+RHgJNp58TK0pNzw
 fbIT0slrgz6NFbzyz1xXWjcIeN6JT2QyH/ZoqdMJ1nsGh+dVkeCYDaO2FY3u7CYla5du
 6bQIIocz5RXLEUlF0Y2gajFtsKLscXOjXs8zypqlSe3S7DxWtInE7ywqvJas2Y75hTXB
 SCJZ6jKEo9gmZL+zWTVmbC+PYNLIJ2bJfrvtjW5WWIGsGfiixA+zfB/X13qSY+ltR+mR
 MI6VHRRvNzZgWyrns4aMJw8Rv9vXbAcaBkUoknzjMKdbEXBZpeDpdSkPq8TnxBYh9kYu
 /ddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uoIcD6K+jqu+zRT0DyWA5LlYkttEC1REY3iS6fetokg=;
 b=MPid27Rtfb+hBo1XTs00zTALWdWH6geWWUePasfwutNgqUAQ/euXTETAlH6lR9pz9s
 o/muqo2JT4jEgOd+t6dSbP4lheMtT46TsXEwSNpVKxvqt6Kz9mbbGVYgTdC7IXW5ehoW
 GsEOofDbKXOFIDbJxh2U2UHxi6LrI396Q+HKhJwKXiALA/M/jOVnRns4K9R3agh2aL/O
 wJfZ1NqZG7BMoFdTv4LZRfJC25ZNxQEoc7So7Un70DPO87oHZuyqTA3lhr4TzL/+9Z5Y
 OewHg/cidaihJZ3WUQd5YMKxrV9euSxlgRClIFVsUiKmwCIujY3MOQ/dCO8T7ylEhwse
 gEjw==
X-Gm-Message-State: AOAM531fa85MLejB0tewVQrJpNYwg2avhfEmW+BU+uudrnjWBOEJxP9j
 9XwM6mfpT8rN16hqv8tlWVI=
X-Google-Smtp-Source: ABdhPJwM9UKVyIimMdi4A6iMT2sP9070+N1XiTDKxpM+WZVs0VqrZLQ0Tf9GRsq00RxqKoLnd/i7sA==
X-Received: by 2002:a63:745:: with SMTP id 66mr7868463pgh.316.1594971380040;
 Fri, 17 Jul 2020 00:36:20 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.153.67])
 by smtp.gmail.com with ESMTPSA id z25sm6794704pfg.140.2020.07.17.00.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 00:36:19 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 17 Jul 2020 13:04:33 +0530
Message-Id: <20200717073436.249623-4-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
References: <20200717073436.249623-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Cc: linux-media@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3 3/6] cx25821: use generic power
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
 drivers/media/pci/cx25821/cx25821-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/pci/cx25821/cx25821-core.c b/drivers/media/pci/cx25821/cx25821-core.c
index 41be22ce66f3..55018d9e439f 100644
--- a/drivers/media/pci/cx25821/cx25821-core.c
+++ b/drivers/media/pci/cx25821/cx25821-core.c
@@ -1374,9 +1374,6 @@ static struct pci_driver cx25821_pci_driver = {
 	.id_table = cx25821_pci_tbl,
 	.probe = cx25821_initdev,
 	.remove = cx25821_finidev,
-	/* TODO */
-	.suspend = NULL,
-	.resume = NULL,
 };
 
 static int __init cx25821_init(void)
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
