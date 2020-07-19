Return-Path: <SRS0=eJeJ=A6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55A6C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jul 2020 09:21:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0B4020734
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jul 2020 09:21:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUVH9hYd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0B4020734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 62D6186657;
	Sun, 19 Jul 2020 09:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37bXoX6ffrSy; Sun, 19 Jul 2020 09:21:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C8CF086651;
	Sun, 19 Jul 2020 09:21:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEEAFC0890;
	Sun, 19 Jul 2020 09:21:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DCE7EC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 09:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C05D585B5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 09:21:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Co5JqlEAiXia
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 09:21:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5BE8285AF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 09:21:20 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id gc9so8614960pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jul 2020 02:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OWbYFYIu0qmpjpMid4/cfRGsYGBLqRNDtWeBkoqnf5A=;
 b=IUVH9hYdYtKdmEr0iL7kFbFPAoYNKsQUo9o3D7vRj/LRtCEjaIiOK+/ZpYLkPsKCSw
 LNvC77PektZN0gD4G7hezWii5cmrwZpUuFjbqzGrljbQWw7o9DBtZdft9p79v/D1BdTr
 zoEro0gnT7J0JC5EUKFZjkCDKDDq3E19wODbX7nCgusPybXLQiAsruNLwlJ7bEOKUiPU
 25IrxNRjWJd8uJ4OGZf8cRUswu8FOHHZROuwxFsChSqDCPX8s36RPSUgF5kkyKKQHpDL
 No2pvA+TyuCIctP71IySo/55gyRG5bae2WH8maI0fVBotDRs+PFFra8R+JvyqCxJotOS
 t34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OWbYFYIu0qmpjpMid4/cfRGsYGBLqRNDtWeBkoqnf5A=;
 b=nUqtCH4xnY8rk4Bfc9msjy2VqoSW9/9daPZD/jnOjn7fzGntq8aPWmRerRFbq3zFCn
 fe1g7CZlF+bU/NGfNxA1/AS7AGwyCIWkgWSpvBQFmtXHQowizpVxKxsUGjXuCtoYKe22
 dNoYqwjH481zOWWX3X9fj4y+iRmo6CszymHTRART8t8JZoVKbvJbhkgvUBStILI9W5kV
 McHlYHTlsVyi5D6hCpIhLvo0TI5qwm2nHLS6X4OFUJZ1rJvH13vtUn78X0JIj8grMl/m
 +oQ4y6c/2pI/44viPWjNihf1Eke4C77MZve0Lu8py5bHbU93WhVuDfZOp0+WychGWWI8
 YoMw==
X-Gm-Message-State: AOAM533PjVp64BD0NhzpA3iRapY9n789AvTH1k9ppjgSvYmFRvHOS2KT
 dyK+kE6UK3Tz/6pEKNSAbEQ=
X-Google-Smtp-Source: ABdhPJz/cm9/Ert5FZhVfv5koR2QvbD+NIBbWfvRk7/Gkcle9QzzGZo+yDtuqUuMeBrFuIli+t/9mQ==
X-Received: by 2002:a17:90b:102:: with SMTP id
 p2mr18831244pjz.227.1595150479861; 
 Sun, 19 Jul 2020 02:21:19 -0700 (PDT)
Received: from localhost.localdomain ([124.253.248.36])
 by smtp.googlemail.com with ESMTPSA id s10sm11145207pjf.3.2020.07.19.02.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 02:21:19 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Date: Sun, 19 Jul 2020 14:51:09 +0530
Message-Id: <20200719092109.21762-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Puranjay Mohan <puranjay12@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] PCI: Add _DSM Function definiton for
	Latency Tolerance Reporting
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

PCI Firmware spec rev 3.2 defines function index 6 for LTR _DSM
Add a define for usage in LTR mechanism.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 include/linux/pci-acpi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/pci-acpi.h b/include/linux/pci-acpi.h
index 5ba475ca9078..2889bf7f2a39 100644
--- a/include/linux/pci-acpi.h
+++ b/include/linux/pci-acpi.h
@@ -110,6 +110,7 @@ extern const guid_t pci_acpi_dsm_guid;
 
 /* _DSM Definitions for PCI */
 #define DSM_PCI_PRESERVE_BOOT_CONFIG		0x05
+#define DSM_PCI_LTR				0x06
 #define DSM_PCI_DEVICE_NAME			0x07
 #define DSM_PCI_POWER_ON_RESET_DELAY		0x08
 #define DSM_PCI_DEVICE_READINESS_DURATIONS	0x09
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
