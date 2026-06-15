Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428154183BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 17:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544590; cv=none; b=jjdK0VlEzAXV5aKq02NChr+SQ+0Kq6OhW2BGnZpCZkmCRozWnjJEYQQvEayDcrF0pp7fOCmaGr3S6OTPZGuTYE9lL1w2x7yCATmYtOGgBu8U5RFob5RxMD8uFOlQvz/Cq5GAyI14SYiIc4E3xG/HOSWeuQpvN0Qpf2QEObyFmj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544590; c=relaxed/simple;
	bh=UBpkXLYHfGfP21sRIvOuvWMqtu6js0FvM4qTTeQS82w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qsf/1A5iFMgA36fT8TMSj/CZa0vDxVbYAwPiPsDv685ymk5M0ttCiiALRmmw3C++rQncvtKu4qrjKIcoOnuQwPXZK1Fa5Qc+KercmRzVTrcl9R5E3ZJvZ3s754CnFDj5fjcvpULKluEXxMSOQH/2HUiKXzI8paWVVRidFHBQIMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFjDSsck; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFjDSsck"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 066C6403D5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 17:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnDFvtidEB02 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2026 17:29:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ayushmukkanwar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 385574004B
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 385574004B
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YFjDSsck
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 385574004B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 17:29:48 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c2d3479e5cso2713755ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 10:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781544587; x=1782149387; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blqmb+amG4DpJECopbRIs77Qpd+XdY0Z9iQpAl7/TEM=;
        b=YFjDSsckfN76KAsHNXIqi+mXDFNyFpVrr+zxAwLPCx5imT2n8j+tLyC+NiKIzlZLLK
         ptX3N69ViBOF5b3ZSlWYMaK9kZDJlwGPwGkvFP3mr/VxvLU3RJm+rZvwCuuohEFSi2Y4
         xc9EEa+kb8WvQG4bMrvo0FO7DJjZs4HE1b+Woi5EXdcZWFhoZL1i9HFT9P0cT5wu/s3f
         2RJHweWBmlYywwjVH9Y2BQK9GAilOUX6MJURpOZ0Tgvuy2cniGwCktS1zAoQi8g8pMgg
         vcZcBsyYc2jH0jIX0rPFKJXPzrcNfx8jURCnZROMyXBZsu5ruSQ7cOpLC+YIy0Eg+g3p
         ncIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544587; x=1782149387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=blqmb+amG4DpJECopbRIs77Qpd+XdY0Z9iQpAl7/TEM=;
        b=Bsd2zYNs/31aGWZ2RRl3rgiytPHVmv87bnIOqN2SvqqGS4OCM/BjRQJsWCqNKokfqo
         kmbQVLiRNZjR1XBN/o9+psRW8+u9LUg2pjuymaypahRTP+Fe9oJCjNNucCLdXAbbsquf
         +MEQeiPm6M1geQhcSHRdwOmmLLERoHEfcn/Wap9MMgzQfbocygMNc0Xm3LIW3WC+G7xJ
         5ni7prWBuDU1cWKjDbGF10bjL63kWoKO/5e5ihHF0BC2DE5RNY+5UzXqQFXtYlU+wZW2
         5FnXOwcgNARejbkQaxPSAgXmsM5zp7DojJs5y6bkh7wvv5QEIR38vSJtzGzKiFzEIsmJ
         D3xA==
X-Forwarded-Encrypted: i=1; AFNElJ+f6Mq1qAqTykgU68qiibn+PL26PZeKM7YwgG0BiwTWpZohGPCA/kZnRrg35+KTYr97rqt/Yv+o1dho9SG4X8aBTB62ZQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YylSiM+YKh4PPYWJD1PefWxXKCahIpPp5x4WjjEsHuKUitktL7b
	VIt2WbS6iEnOaGVYsFvpMh1GLZtMl1aZzKY9Y1SWpVf5iLxIUqHSVNYRnrrD/UMT
X-Gm-Gg: Acq92OFht6+6jnePUzT2P8NieHcaN27V44ULfUakb5kXTp1rpLd9W4+s6Hchg3oKnpx
	CxeX9S8hNjdyj/E5ORDwFNBvZWOBTWm9OVqw90CkXbv0jI3Qrm0TzibJr/f8mvB6yiy9KmxbfFl
	ATa/meZP6h4dEXt9zpXD93Nc7JO1FX8Yhcxp25r5UcIkSiG/V/zw5vAQMBs3zAbWaM2qH5roz5r
	AJ1G8UwolTTpaZuOLAddQdlRAAHWY/H8rBzI7hCP1xFnlXTUc8lACFE44te2nxQrjmCMgeCEbAz
	MrUTYCqF936zBGct9whBYkqaYAj7ozaWEdLdMGfB28azr+WdTqo85mRGNPKcDOaMPD/uwK+ghlz
	R+Bz3b25yGHxnfCJMII6UD1RDJVX77ql5yE5JyaYPow9GIWNbICZ+PSMj7zYt/Kn9qr1N7EZcW3
	zgEbw/07caaXAjZGQa34woeldtXNG72U7GoMW7egq75gcZNuRQrE4Jf6asiWUl1kIcKwRvl0wxr
	dLbNDaKMN/O8ITs3Kb1HdyBCWM=
X-Received: by 2002:a17:902:e88f:b0:2c0:b359:99c1 with SMTP id d9443c01a7336-2c41050946cmr83596165ad.2.1781544587495;
        Mon, 15 Jun 2026 10:29:47 -0700 (PDT)
Received: from fedora ([2401:4900:7c8e:5373:4159:c5ca:b737:78a0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb5411sm105001775ad.32.2026.06.15.10.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:29:47 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 2/2] staging: octeon: add missing napi_disable in cvm_oct_rx_shutdown
Date: Mon, 15 Jun 2026 22:57:34 +0530
Message-ID: <20260615172734.42038-2-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615172734.42038-1-ayushmukkanwar@gmail.com>
References: <20260615172734.42038-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvm_oct_rx_shutdown calls free_irq and netif_napi_del without
disabling the napi instance first. As the free_irq only waits
for completion of hard interrupt handlers, the napi poll
function could still be active. If cvm_oct_remove proceeds to
free the plat structure (which holds the NAPI instances), the
active poll function will access freed memory, resulting in a
use-after-free crash.

Fixes: 3368c784bcf7 ("Staging: Octeon Ethernet: Convert to NAPI.")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260511150931.93382-1-ayushmukkanwar%40gmail.com
Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
Changes since v1:
  - Added Fixes, Reported-by and Closes tags 
  - Added compile-tested-only note

Note: This patch has only been compile tested. No runtime testing
was performed as I do not have access to Octeon hardware.

 drivers/staging/octeon/ethernet-rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index cd36b5ba6f6c..3e9d58d32156 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -535,6 +535,8 @@ void cvm_oct_rx_shutdown(struct platform_device *pdev)
 		else
 			cvmx_write_csr(CVMX_POW_WQ_INT_THRX(i), 0);
 
+		napi_disable(&plat->rx_group[i].napi);
+
 		/* Free the interrupt handler */
 		free_irq(plat->rx_group[i].irq, &plat->rx_group[i].napi);
 
-- 
2.54.0

