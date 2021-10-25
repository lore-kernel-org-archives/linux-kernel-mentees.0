Return-Path: <SRS0=xjH5=PN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EDFC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Oct 2021 17:02:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E4BD60187
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 25 Oct 2021 17:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E4BD60187
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B14C403B1;
	Mon, 25 Oct 2021 17:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JsYbx3roURV4; Mon, 25 Oct 2021 17:02:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 74AB3403A0;
	Mon, 25 Oct 2021 17:02:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52C99C0019;
	Mon, 25 Oct 2021 17:02:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 789DAC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 598C080F04
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:02:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eK4tCCVSuu9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:02:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7B5080EF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 17:02:16 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id n12so3694736plc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 25 Oct 2021 10:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=N4v/A7+QJCcAbm+CvFlnlwM7C67m7YvUb7uDA62Ea6M2zy9mFn7L6qlzyseS/M/hvG
 tSJbimFBdC4p5RReqa2wpV6Qqjd4P24XzwxeLbj00xU7hcRRw5znumqH2s/fOHMfjSX9
 o5nd/AIPR73SqODv5t3sS3lZf5iijuK80MsyWyIw5o0FWX9YKrLpr3FlXwhqmXj9ObM3
 vPpoGZ6V4Jv4wDgtx2wXumflnIweN5T/qLoY7NBdAFL6pkNwLJgP04wR0lIKTa5RLweC
 RqPKrKht1tvRKs6JR6I7M00dsZt0Vx5DzJDUHy6IhLUn99V93sH7dP35x73mQfuyLXxC
 urFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FR6K5YUYcCv1FDH4y5DK0PhIoCQEDWlRf94cnPNCwds=;
 b=5ngKf/480EfdDV+4miG8L9cJSV56wn1SVjO2MO1Ow+fEKXXG6sI+uA8FkWGjmFEcO2
 QIpVFDSNXSEx6W5Xooqj0IRUNgvaGWKxVEjPCeRyUnM65C/s0YtCTmuLGMNzvAqSAk+5
 qNa7eCxDeaOpU4+4ada0YtzwE0dcLkQg+yhfBeN5tFbLA0PHChJJsdfjXMCzcUuWKbeQ
 Loov7dXUPolljDK4M0z6njZMnj1AJY2Yr8f68kqiKqFG95nVwvlvGFkKUqXzqjeszh1j
 Udv3ARhoKN8WzECTgR5oDtrwm86K80KQAbuL88g6Y8YQRqx0xJ1ve7MoAwUtuQNEs8Oi
 mj2Q==
X-Gm-Message-State: AOAM533fHFEjPGcZHLEpwKHxH2aDWNkhIoN9FPmP7q988SFyKv0YXhe8
 mGpvFvagvVoWRtDECoLSp0cwlsuQvSwLJA==
X-Google-Smtp-Source: ABdhPJxPfl0ou0aD/UXHIs1Nj72QAYSTX4fl/euKCb4hAOQJajxyiu9l4DhyC9t/Ht92fYZ9ThIeJg==
X-Received: by 2002:a17:90a:fe16:: with SMTP id
 ck22mr12789728pjb.186.1635181336216; 
 Mon, 25 Oct 2021 10:02:16 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:df8b:7255:8580:2394:764c])
 by smtp.gmail.com with ESMTPSA id
 g18sm5100858pfj.67.2021.10.25.10.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:02:15 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH v5 2/5] PCI: Cleanup struct aer_err_info
Date: Mon, 25 Oct 2021 22:31:01 +0530
Message-Id: <10d354c32e7517ad16e9f37bd4595de83dd7ccbc.1635179600.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635179600.git.naveennaidu479@gmail.com>
References: <cover.1635179600.git.naveennaidu479@gmail.com>
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
