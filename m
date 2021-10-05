Return-Path: <SRS0=dZTT=OZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3599DC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Oct 2021 17:20:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED82561506
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Oct 2021 17:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED82561506
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D007E808B0;
	Tue,  5 Oct 2021 17:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4fP5DNsPckZz; Tue,  5 Oct 2021 17:20:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0DF7780FFE;
	Tue,  5 Oct 2021 17:20:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2879C000F;
	Tue,  5 Oct 2021 17:20:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34980C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17AA6404DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QNl6ehrcM_OQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:20:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B0AE404CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Oct 2021 17:20:19 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so2527683pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Oct 2021 10:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WgoZ9+KpQrZR7tDkQXfhNUVljLBFuOfZzG3U49+7PlA=;
 b=P+WtH3IMZqtUvBm5H9fMw9DkmxTpj9xDSJjyGL7A64Uyef7vOxtT1+71U5DwpJz9BF
 tFNkTjq14XrRxR35pQ2LG8xelzcnyqJOZeCllFYuLfBuYSQrS2XM5vb+amlwWQYvXML+
 bMoFMOoM+fQocWCzlMqISl30VSZGX7i4dvK2GZRUEVWmdwsjVZz9QkBz1ndtcGtG0QVm
 YqclJ9Y4OH1rQdMR2h4DfHgPPebH6E5VXsAg7UtWi17GKtsxNGIN3pu3NWgtOXbyMl8d
 Nqf8reqqrkiaDwGYfIyNTSfJ8gZcGkMYY6WUcBdrDnt62jpRuPfzrn7MrifNHc4tfwtx
 8O+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WgoZ9+KpQrZR7tDkQXfhNUVljLBFuOfZzG3U49+7PlA=;
 b=YaUmW61u6KyDNrh6XW+8DmO/nSncISMtpT+/OJHHheGj4lUFrasoNXsi3SsFm63f9d
 +jVDpSW8aXcARl5QqWufqHDUJa4LbehuJfg6wiOkd2OdoFVWHhou30mLaUi3rbXlCh1E
 Lnf8lsKr421XQTyJ9cql/X6qTG8IvqSi89/oHGYNlhZkS68esBkA6cVEdDAJn2Fa/1wO
 ANNb4BrqEENF50F/zfyvJEQMwaLIkmgbCm/YhNfHuAYAJSw7RIYg24umjUBzuW/3i7A0
 narQnfV4RDrF6wnxdSPmd7VGMZVUIB5jligZamNSh8SmBt0U9RQz+rV7O+8OFZVy0BoF
 OW8g==
X-Gm-Message-State: AOAM533oTyGlXmmuygy18StFbd5598YgnbmekUfJZxsG+RsHDsALNYKC
 PKUaWiHDIObn4g7qlZFM8W+UfSrDwzUlRcFsTpQ=
X-Google-Smtp-Source: ABdhPJzxqc2t34kz5KgXjU7wEFsOAyUW6poe2t4eqVtMHyzkzQNDJDQfNcauVu19XLiaFPM/+9zQJw==
X-Received: by 2002:a17:902:b7c9:b0:13e:e094:e24c with SMTP id
 v9-20020a170902b7c900b0013ee094e24cmr5196351plz.3.1633454419116; 
 Tue, 05 Oct 2021 10:20:19 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:f69:1127:b4ce:ef67:b718])
 by smtp.gmail.com with ESMTPSA id
 f25sm18476722pge.7.2021.10.05.10.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 10:20:18 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v4 4/8] PCI/DPC: Use pci_aer_clear_status() in
 dpc_process_error()
Date: Tue,  5 Oct 2021 22:48:11 +0530
Message-Id: <f0d301cb1245a8e2fd9565426b87c22a97aa6de7.1633453452.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633453452.git.naveennaidu479@gmail.com>
References: <cover.1633453452.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
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

dpc_process_error() clears both AER fatal and non fatal status
registers. Instead of clearing each status registers via a different
function call use pci_aer_clear_status().

This helps clean up the code a bit.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/dpc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index df3f3a10f8bc..faf4a1e77fab 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -288,8 +288,7 @@ void dpc_process_error(struct pci_dev *pdev)
 		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
 		 aer_get_device_error_info(pdev, &info)) {
 		aer_print_error(pdev, &info);
-		pci_aer_clear_nonfatal_status(pdev);
-		pci_aer_clear_fatal_status(pdev);
+		pci_aer_clear_status(pdev);
 	}
 }
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
