Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22410C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 13:53:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C051B61184
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 13:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C051B61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92BA0405E7;
	Mon,  4 Oct 2021 13:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ujTfXc_EP8R; Mon,  4 Oct 2021 13:53:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 73C9C405EA;
	Mon,  4 Oct 2021 13:53:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F2A0C0011;
	Mon,  4 Oct 2021 13:53:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9277C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D96E340423
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWklco-KXU0J
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB719402EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 13:53:29 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id 75so16610673pga.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 06:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pG3mj4bKDd7l8ZFqHwjB1MgvpFgzE+2HiTROeiz4Dcw=;
 b=Ek2T9nV9gQ8EWW8JDLZtRMeCCS4iAzWtRhmGo7yHHo6WzIsUsiRDuBFkc0ZL2A5JwW
 wqYVIeN9ulfTvKJ5+EwL6nPlknmGh4JtbLi6Ql6q0xXPRK8kx1YgBD9LxXlEFQdVRtGC
 mUqtbcO01o3VDHKhrV323LAhW1CTqF81ywr28vwBzxElPYywwVh2i5n8LVlx4EwggwuC
 Qs2khDcDwteSaxo+vdGhUTks5JzBz3Y66YemKDinonJC6aTl6GHzaz0IRMYBAvt5G/6h
 lcf5R8jJSc9rB4cmZdV53j6lHJaYjFDcjzfiI2OOzsrNW20KlPVXTVaa1/KH7AoiJamr
 aScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pG3mj4bKDd7l8ZFqHwjB1MgvpFgzE+2HiTROeiz4Dcw=;
 b=fc75ohSm4iONBAU9s+ml+7EUdBSyNSIPruHN2/NzKoEBnMBMvr8mV+xl7xnEhHxLZ6
 hBsbF4eU+2vNbNpxiIs+fdkJm4tTFEil1jmw3Tw60CoGt1ivcA2MSAdCxvEvnCDqoiA3
 CgM+tZS/iElCKDt2aBEb5GYiZEjuzmEZ6B+ymL2J981cHPJ3Ydh7ae/en3SBKaqEgZmF
 NOy7m90wXGd+FvU1c06i9Jayuj/ShaTClaJXjUYi2ys2n/I/Vn69FIsb8L7ewYUIHC0+
 6AMSc0ew0/vWXKmtDIG3qcXOMOB4PaOo1erEeLXu6s3cct3FWfYmXdsFGAdQiC9CqxHi
 K3hg==
X-Gm-Message-State: AOAM532Ek2YbvJUumPaNmSTzDnMeFR0QCQbFYAcM7TJVWRXx5enuEwAp
 j63tNRwjgF+nCQYZUL90k4h0ozb6k6d/Vqbs
X-Google-Smtp-Source: ABdhPJyvIHilOe5lS9NntuhffkTCHZ//p5UWlaai74QhVdLHck17Mlcj4MWEODyY2W6dSYUSaLrhfA==
X-Received: by 2002:a65:6389:: with SMTP id h9mr11100114pgv.83.1633355609139; 
 Mon, 04 Oct 2021 06:53:29 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 k17sm12209548pfu.82.2021.10.04.06.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:53:28 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH 1/8] PCI/AER: Remove ID from aer_agent_string[]
Date: Mon,  4 Oct 2021 19:22:36 +0530
Message-Id: <b4c5a5005d4549420cf6e86f31a01d3fb2876731.1633353468.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633353468.git.naveennaidu479@gmail.com>
References: <cover.1633353468.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

Before 010caed4ccb6 ("PCI/AER: Decode Error Source RequesterID")
the AER error logs looked like:

  pcieport 0000:00:03.0: AER: Corrected error received: id=0018
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, id=0018 (Receiver ID)
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
  pcieport 0000:00:03.0:    [ 6] BadTLP

In 010caed4ccb6 ("PCI/AER: Decode Error Source Requester ID"),
the "id" field was removed from the AER error logs, so currently AER
logs look like:

  pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03:0
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
  pcieport 0000:00:03.0:    [ 6] BadTLP

The second line in the above logs prints "(Receiver ID)", even when
there is no "id" in the log line. This is confusing.

Remove the "ID" from the aer_agent_string[]. The error logs will
look as follows (Sample from dummy error injected by aer-inject):

  pcieport 0000:00:03.0: AER: Corrected error received: 0000:00:03.0
  pcieport 0000:00:03.0: PCIe Bus Error: severity=Corrected, type=Data Link Layer, (Receiver)
  pcieport 0000:00:03.0:   device [1b36:000c] error status/mask=00000040/0000e000
  pcieport 0000:00:03.0:    [ 6] BadTLP

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pcie/aer.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 9784fdcf3006..241ff361b43c 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -516,10 +516,10 @@ static const char *aer_uncorrectable_error_string[] = {
 };
 
 static const char *aer_agent_string[] = {
-	"Receiver ID",
-	"Requester ID",
-	"Completer ID",
-	"Transmitter ID"
+	"Receiver",
+	"Requester",
+	"Completer",
+	"Transmitter"
 };
 
 #define aer_stats_dev_attr(name, stats_array, strings_array,		\
@@ -703,7 +703,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
 	const char *level;
 
 	if (!info->status) {
-		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent ID)\n",
+		pci_err(dev, "PCIe Bus Error: severity=%s, type=Inaccessible, (Unregistered Agent)\n",
 			aer_error_severity_string[info->severity]);
 		goto out;
 	}
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
