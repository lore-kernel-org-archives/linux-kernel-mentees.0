Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EB9C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677022076A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P98yQ73Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 677022076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 487C2203D2;
	Sat,  1 Aug 2020 12:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aiOw1OD8WM18; Sat,  1 Aug 2020 12:24:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 95A0F203DF;
	Sat,  1 Aug 2020 12:24:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 811C6C0050;
	Sat,  1 Aug 2020 12:24:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A1CFC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9711E203D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K1ZN5gAP6LGa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by silver.osuosl.org (Postfix) with ESMTPS id AFC40203E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:34 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id f24so13530244ejx.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I8dAqn3oyLTlTqhf29Z52aIjqvD0eEwBI3IdJNmTAKE=;
 b=P98yQ73QpNAHyJH0DhgL+VteQsL8cJWvez4VBskT+6Zy0ViH186MuBu4nRvGYARUqd
 PDUMf38OLCl5PvGAT/41B7GiPvDcOBsaM4Y1R+BKMYY18/LuAuqv44mpAEG6r1fYWcfY
 QMKLZygpMvWntgZg8e/oF7zNlaPq9OSG4dNlG19C7ej6vNjo4PPJFjvpXAMHr399/xBl
 DpMbGY848f6RaiM4HfSP1a5QFTkzZ4mmVUxFUE7Gz2pAIE0+Lq9sZeuQW4ZeMeTnwEFo
 1ZSzd6yuE5ADI8ephhkCQ2Wubpv7kQZm+Cihm/tzF0n0DyDFoVPmGuUYNiBglsxS6GpR
 f1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I8dAqn3oyLTlTqhf29Z52aIjqvD0eEwBI3IdJNmTAKE=;
 b=J2ZagCPEcMPSh9OsDRNpvgYsAkmvZPF4uZOSTqLClO8SEFREe6+Z9URlt4KNEU8xoz
 c0+Pad6m4mS59WZ1isSwMhGcbjlx523L2xFw7pXbLB7W8Z3YTJmlcxskkTAnRVPdKsXK
 pLB6KhXBHkfVfcy9sEhBG9f8dCF2DdOOKpvcAsjJ64AP9+eL4wR55T4oGjzjo5Wqe3u0
 nFZVxDjWwuhk5zGgS5tkn8sOOHqePHl6qHmvKwNh0BjKfd0Xd2tln313OtWb2ochul7k
 HNnywr/WPtSHW2Pc9QwHd7y4PTEv1ZDVeORdKTXSSK4fkBcTqm567f+9v/iHL7j23TvD
 2SKQ==
X-Gm-Message-State: AOAM532IxpgnGiqbPH9TjAmwJHSrssLih+gbETzJ604kxCjoZuKpoaGJ
 6k7/N+i+3Q1bU1rF8wdIieU=
X-Google-Smtp-Source: ABdhPJyaQUgDgaB0qqpXNRYm/8ED4kbE0a2gf50gNexDXYKCzC2jeZw2r4pLhpg9owqfBDJdG1DmpA==
X-Received: by 2002:a17:906:6a5b:: with SMTP id
 n27mr8123629ejs.221.1596284673233; 
 Sat, 01 Aug 2020 05:24:33 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:32 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Moritz Fischer <mdf@kernel.org>
Date: Sat,  1 Aug 2020 13:24:36 +0200
Message-Id: <20200801112446.149549-8-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 07/17] fpga: altera-cvp: Drop
	uses of pci_read_config_*() return value
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

The return value of pci_read_config_*() may not indicate a device error.
However, the value read by these functions is more likely to indicate
this kind of error. This presents two overlapping ways of reporting
errors and complicates error checking.

It is possible to move to one single way of checking for error if the
dependency on the return value of these functions is removed, then it
can later be made to return void.

Remove all uses of the return value of pci_read_config_*().
Check the actual value read for ~0. In this case, ~0 is an invalid
value thus it indicates some kind of error.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/fpga/altera-cvp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/fpga/altera-cvp.c b/drivers/fpga/altera-cvp.c
index 4e0edb60bfba..99c6e0754f8b 100644
--- a/drivers/fpga/altera-cvp.c
+++ b/drivers/fpga/altera-cvp.c
@@ -96,15 +96,15 @@ struct cvp_priv {
 static int altera_read_config_byte(struct altera_cvp_conf *conf,
 				   int where, u8 *val)
 {
-	return pci_read_config_byte(conf->pci_dev, conf->vsec_offset + where,
-				    val);
+	pci_read_config_byte(conf->pci_dev, conf->vsec_offset + where, val);
+	return (val == (u8)~0) ? -ENODEV : 0;
 }
 
 static int altera_read_config_dword(struct altera_cvp_conf *conf,
 				    int where, u32 *val)
 {
-	return pci_read_config_dword(conf->pci_dev, conf->vsec_offset + where,
-				     val);
+	pci_read_config_dword(conf->pci_dev, conf->vsec_offset + where, val);
+	return (val == (u32)~0) ? -ENODEV : 0;
 }
 
 static int altera_write_config_dword(struct altera_cvp_conf *conf,
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
