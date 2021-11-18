Return-Path: <SRS0=8PjG=QF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59083C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:09:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17CA6610FB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Nov 2021 14:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17CA6610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC16160792;
	Thu, 18 Nov 2021 14:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A70PDBkDfErW; Thu, 18 Nov 2021 14:08:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1A35C60761;
	Thu, 18 Nov 2021 14:08:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE349C001E;
	Thu, 18 Nov 2021 14:08:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F72FC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E380180C6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L3Qdo_2IvcJf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:08:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55F4780C6E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 14:08:56 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id m24so5320208pls.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Nov 2021 06:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0wzxd9WltV+kgpmgehfeEa35+HeAAqxQYv7He1qYUFw=;
 b=Vtge5Jzv3Q+gqha8QfyzXjXdN7qKuArxFBnAJRdzO9mfBwXwoVtuG/ZQD13QTse5J/
 rYOYd4DUndtFj+rDNHyjsYdJ4K9M1RKx6MSMRqYAugJWJki8o9nZPQre09so5YQ+9Xuu
 9hyBBZlXB2etwNVlsHZoZ7K4HmlF2rA8n8wLTr1g6fqkzttPV2rPt+X5+o6aDktNKwdJ
 5c7AfRmuou01iz6q5uNdTgefcCQLkmPzuGDY56Naz2Y09FOwg6L4S9DF6w0WQe5Xn3Km
 PkU4wKjMbkmca2bn8N2NvQ7yNgKFm8TwOUPpB7co65xNXsk4EmPSW1ANfCfFCLisX6vI
 TQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0wzxd9WltV+kgpmgehfeEa35+HeAAqxQYv7He1qYUFw=;
 b=z2GOp/jHcKz/cTnCV3+2NCKv8hjph/pPMnHCw0H+fdb2kYmd8KEx7/0hYcH9JyCr15
 fJKKFZOeXBQJdZUlw/YCXChcKshQMtTlqiUgsarmw/ivuUslQxK8STwtgZ5/niuQlmtb
 au2nRHY6KUj9R/6iKD4z3YTwi4a/+kQt/r6yFwvsxdKLYz+HjvkqvnvLljueHLTRTqg/
 8UY/mrjQAnF3u+oQJnCxKz4LkVn5t+oUZtz7Z5SjRK/qyYn4xbkURdDPyLPpuKfnQ1BV
 MlZkAvTPUV/1G9M5SDwuSn6cCbSu8A1/c2sVhd/tMUFu2wgHHRbk/iUI6NclsWq8I4ir
 SALA==
X-Gm-Message-State: AOAM531H2TTdWCM7TYa5Eens32G5HgSUZ7ZyMII6MY7M8loaZFQxyZSN
 Y402b6Fv5p597mgrx/dXkYI=
X-Google-Smtp-Source: ABdhPJxf4xirjTfa6NfIeW2moya1k5DpgGZPxhSfUAKHoEymIOn99zlGld0PMa8NpD4v08nzP0clfg==
X-Received: by 2002:a17:90a:5d8e:: with SMTP id
 t14mr10603930pji.95.1637244535782; 
 Thu, 18 Nov 2021 06:08:55 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:63:2c47:5ffe:fc34:61f0:f1ea])
 by smtp.gmail.com with ESMTPSA id
 x14sm2822878pjl.27.2021.11.18.06.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:08:55 -0800 (PST)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: [PATCH v4 17/25] PCI: vmd: Use PCI_POSSIBLE_ERROR() to check read
 from hardware
Date: Thu, 18 Nov 2021 19:33:27 +0530
Message-Id: <ed01cad87a2e35f3865275b5fb34290817a1ebf8.1637243717.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1637243717.git.naveennaidu479@gmail.com>
References: <cover.1637243717.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, Nirmal Patel <nirmal.patel@linux.intel.com>,
 linux-kernel@vger.kernel.org, Jonathan Derrick <jonathan.derrick@linux.dev>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Use PCI_POSSIBLE_ERROR() to check the response we get when we read
data from hardware.

This helps unify PCI error response checking and make error checks
consistent and easier to find.

Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/controller/vmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index a45e8e59d3d4..515d05605204 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -541,7 +541,7 @@ static int vmd_get_phys_offsets(struct vmd_dev *vmd, bool native_hint,
 		int ret;
 
 		ret = pci_read_config_dword(dev, PCI_REG_VMLOCK, &vmlock);
-		if (ret || vmlock == ~0)
+		if (ret || PCI_POSSIBLE_ERROR(vmlock))
 			return -ENODEV;
 
 		if (MB2_SHADOW_EN(vmlock)) {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
