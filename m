Return-Path: <SRS0=ogCp=OY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27EBC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 14:31:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E96C60FBF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Oct 2021 14:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E96C60FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EBBA415B0;
	Mon,  4 Oct 2021 14:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3LIKsY-sgH-r; Mon,  4 Oct 2021 14:31:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 69E7A414BA;
	Mon,  4 Oct 2021 14:31:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49C6DC000F;
	Mon,  4 Oct 2021 14:31:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90CC0C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72FF440862
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9GgVh5aiQVzM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:31:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7F58402DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Oct 2021 14:31:41 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so112821pji.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Oct 2021 07:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=qv8zIopXqjv7B/cSRZ3wFwRISLoio93IP+EmFxrBZNfRmhYbTplZEVW9dbeqkXSexO
 xC3ATUpxmJRydYGgHKT3jX9RRk2qOU7MqZ9BmxZ6Y3BlGHKqMrtbglNX/7S3JP+vJVNU
 U3qE9ecrnlJ5AaPehV0/Eud3IiTAY7+4moUA9fpjiLZjPLT92K24ftq6+UvV2j5Lovtd
 tqH2P7rgEp32UWbjhvU8aMXRoDyzlxgoq4DkDk/g6hBpL/LgNHnzh7D4kCZjvD9R7RYq
 yHs67pCK6OfFDCdXNQDTate3xFUKIr+gHHSHRPSOFAa4I1B0hh4WRKbU4PFzYDYT26Fl
 LsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=oIlHIVQeuJY1o80em7g7nW47Tirsbmn0bDFHOtdSuKNFTC+X3GB01CszbHa6NhxcXB
 c5DSB83EYWtuJu9ePQgQ1Fp3dGfodyx5O3zkNG0PLLoNFVslxMfvp7DDcCCV38WNpYpz
 wi8omtkvqPWiHwb1c+le6RoSDXac1jTiSnhhDPeLFy+Av9y1lgfQlJMrhHtLgNh2cLLP
 orpcFiJ7J6X16kEZbRhVVmr90H56utW2k8YcKyI04Xq9PA9pZoBpxkJ3qDW8kIRJviEj
 B4p0Ji7gVjblrMFdHNOz1Z15mlU5WQllwr9VXpnsCW2OX10ShaAJMoZIJJQgFD4yVcm9
 nWNg==
X-Gm-Message-State: AOAM533++gmFYtRLftCJQ5tB8TznsFv8I6da/d7C1vcmbwpR7hFGXy3M
 4cEQ3ajvWh0RO85AocIXe9Q=
X-Google-Smtp-Source: ABdhPJzR4Ghi3JFA5L9/8cvKQIXgFoRIAEnS77Xg6YAAEkbaN1BHaaNb+r1kBF2MKHApzqX5Ds9q0g==
X-Received: by 2002:a17:90a:f287:: with SMTP id
 fs7mr9466092pjb.98.1633357901102; 
 Mon, 04 Oct 2021 07:31:41 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 q3sm14489146pgf.18.2021.10.04.07.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:31:39 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v3 2/8] PCI: Cleanup struct aer_err_info
Date: Mon,  4 Oct 2021 19:59:58 +0530
Message-Id: <247efb0e4168393f4aee5e267a9aa8b3a8adff0f.1633357368.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633357368.git.naveennaidu479@gmail.com>
References: <cover.1633357368.git.naveennaidu479@gmail.com>
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

The id, status and the mask fields of the struct aer_err_info comes
directly from the registers, hence their sizes should be explicit.

The length of these registers are:
  - id: 16 bits - Represents the Error Source Requester ID
  - status: 32 bits - COR/UNCOR Error Status
  - mask: 32 bits - COR/UNCOR Error Mask

Since the length of the above registers are even, use u16 and u32
to represent their values.

Also remove the __pad fields.

"pahole" was run on the modified struct aer_err_info and the size
remains unchanged.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pci.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 1cce56c2aea0..9be7a966fda7 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -427,18 +427,16 @@ struct aer_err_info {
 	struct pci_dev *dev[AER_MAX_MULTI_ERR_DEVICES];
 	int error_dev_num;
 
-	unsigned int id:16;
+	u16	id;
 
 	unsigned int severity:2;	/* 0:NONFATAL | 1:FATAL | 2:COR */
-	unsigned int __pad1:5;
 	unsigned int multi_error_valid:1;
 
 	unsigned int first_error:5;
-	unsigned int __pad2:2;
 	unsigned int tlp_header_valid:1;
 
-	unsigned int status;		/* COR/UNCOR Error Status */
-	unsigned int mask;		/* COR/UNCOR Error Mask */
+	u32 status;		/* COR/UNCOR Error Status */
+	u32 mask;		/* COR/UNCOR Error Mask */
 	struct aer_header_log_regs tlp;	/* TLP Header */
 };
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
