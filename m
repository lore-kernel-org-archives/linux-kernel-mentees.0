Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074B7C43217
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:01:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0F8260C4A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0F8260C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB416089A;
	Mon, 11 Oct 2021 18:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhP8UfxZiKpx; Mon, 11 Oct 2021 18:01:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9C511605B0;
	Mon, 11 Oct 2021 18:01:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B9CFC000F;
	Mon, 11 Oct 2021 18:01:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0743C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9083D4036E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BMGU6R22GunH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:01:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED4544036B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:01:22 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id g9so1418069plo.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 11:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ac9LXj3z0Aargz2ofBXWx7xZeNNeuttwY96oTD0m/Sk=;
 b=UpndYJVH2kYvgQ5Urq0olbt0Q/fTxH1a2N9PJz1x/BbJNW27uKe02za0ZnD4O3uV8x
 YFIiMi8hdgMC+n1Tfo/PF390u3CxZxjtx6npxQZUEMMhxo1MszeFmbBoKa3C8g/HAiJi
 6q1hHL9b5Xs5weDigUXmr1d80R1XH4E3wwVFtXGZJup+wBXRzN/ORh+klZgF8dSFTwCi
 c2Du7OJmO+39l4z0+o9gdiK2FsW0UHXIX60P7C97Ov4y1/TGassp70S5TnWTe3meFzGD
 n94a7Y+pBkCH6UDpBEWc5u5LfH4c/2rxQdU6dzs/WeYRxbGQ0h1il++ovY47dTcqPZwn
 ZmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ac9LXj3z0Aargz2ofBXWx7xZeNNeuttwY96oTD0m/Sk=;
 b=6vM9UZZ8JxO0jXAlBLcBF5z/fv/Wo8i/ssv2K+i/GhGtUX/Xo/fpJIyyVvlt4HxLaT
 QS/hzno2dPA1OvoubRlJVWVgWFL2pSMIW3wsNc+2CrXN1fSCq78hJRfg7GgBJ/I3IS4J
 GkagBkB6c46dfSLLYbywlyQOtnYBJiyqQneRrLMXr++OBTTv1c2C2fcglZ/Rv6yCb70b
 MwfnZw7lB+IEfb4QqcrZVVxGosfGPIt+b2ATCpryKWrso0Lz/NB82MsxzajcXc8eqHKu
 NTcdaN1ok4IEhTIoErHOVtL7au8R6Oyq9G48rcAllWs55jijEh023xMf0I1Ko9T+Lqxl
 YgSA==
X-Gm-Message-State: AOAM533k/UwusXff9vH2dliC0kMrudDX76uIb71n2nQwWtlgP4yzMW+A
 TPr09cEGMqH1DFqT8umZdqI=
X-Google-Smtp-Source: ABdhPJw5MHCkS1Q9eMp5sQHWRTrT0swYRsJEFWRTLQ1wt1NrCBy09H9LzFYZ4hCqnvbpODaPwXUvUg==
X-Received: by 2002:a17:90a:8912:: with SMTP id
 u18mr456538pjn.69.1633975282221; 
 Mon, 11 Oct 2021 11:01:22 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id
 b134sm8820045pga.3.2021.10.11.11.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 11:01:21 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH 11/22] PCI: altera: Use SET_PCI_ERROR_RESPONSE() when device
 not found
Date: Mon, 11 Oct 2021 23:30:49 +0530
Message-Id: <8e70c0f96b25e4b30ce4fc261cafe038a025429c.1633972263.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633972263.git.naveennaidu479@gmail.com>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Joyce Ooi <joyce.ooi@intel.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

An MMIO read from a PCI device that doesn't exist or doesn't respond
causes a PCI error.  There's no real data to return to satisfy the
CPU read, so most hardware fabricates ~0 data.

Use SET_PCI_ERROR_RESPONSE() to set the error response, when a faulty
read occurs.

This helps unify PCI error response checking and make error check
consistent and easier to find.

Compile tested only.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/pcie-altera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
index 2513e9363236..d6c71b5d1ffb 100644
--- a/drivers/pci/controller/pcie-altera.c
+++ b/drivers/pci/controller/pcie-altera.c
@@ -511,7 +511,7 @@ static int altera_pcie_cfg_read(struct pci_bus *bus, unsigned int devfn,
 		return PCIBIOS_BAD_REGISTER_NUMBER;
 
 	if (!altera_pcie_valid_device(pcie, bus, PCI_SLOT(devfn))) {
-		*value = 0xffffffff;
+		SET_PCI_ERROR_RESPONSE(value);
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
