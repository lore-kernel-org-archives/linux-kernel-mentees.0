Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9351369B4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Nov 2024 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732117573; cv=none; b=WJ21Sd4PJg098w0l+yCDD15YlqWqJrGQis7mEDS7WSxZROOh0s7kC+5AVKYctVYCKu5O0NxcbH771uKjdHhBW/VTxD1/hRj4yH6IwbwIFZWKzS6XGPFETcIL/3ayrdrX3w7ZGDV5zhENY4jST5T37ijRDpDWVN6AC6C9hxwHJRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732117573; c=relaxed/simple;
	bh=NoAx2DXVAyrCS/4irxTbhJAiFco/Aqrx4Ig8U69PSHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G3857Hq6xN9lFo/bxwxzUy7e196eGTWgQxOeappCk5At6NxdPcHDW9CmQ8FDN6fEk5HC2W+xNI5zAN2RoDdxMpquGEZQjCLuwkSlMNZJnJKnWuiXQ6yx1Z2MkmBum/zU5+IY5yhqPOSAG/lvR58N+uLTMJ1VWc/uh4Ct162yRhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkyXuVu/; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkyXuVu/"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D558985039
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Nov 2024 15:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rk-Q7zb1Y3vP for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Nov 2024 15:46:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAAC18501B
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAAC18501B
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mkyXuVu/
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EAAC18501B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Nov 2024 15:46:10 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7246c8c9b1cso3362222b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Nov 2024 07:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732117570; x=1732722370; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mlC1fiUhPeILfOtmUrQ/N6IVvKcd/i9shLrZYcMb/8g=;
        b=mkyXuVu/efoW5TT4DkfCU3vfBwCagaqaKbVq3qf0Gpk8sx8gtw3TKQ/KmkCxnWzIEv
         FFzc1nhXTsXhYWCIEA18TPnvJoLW3cBawTOObQzA+JxVhl1qt0ok1PQ37nWMgdr5Drvt
         Wacf4SajZZyMqMyMC4gcu//XFSI2YHdwy27RA9JZJbl7ty8nw+bqTY5c2n6Pi8Dxkf4U
         OH5DDfUKLZ+owgFFNSnJPMoQWVpoFrRmJhgGfUyx0xXi3rpbOyxOpTuZA+ffJRiCRo7R
         6IP402qO8r7hMSyzM43bp2KkxK81Sxz1pOPb+GeGVKkVnecwyWZb5mfisE9Y54zPpiNZ
         2dHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732117570; x=1732722370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlC1fiUhPeILfOtmUrQ/N6IVvKcd/i9shLrZYcMb/8g=;
        b=wEznbF80q3Tj38gxGAYd6iztSWNwJJd6Gl+OAmIbbPnbCnctIFCpxbFcovn2Nl/Wwz
         08Jjc+aZnN/g2Sv/D5PRcAMysPxseb6fbpW0O2sAKC2VoEKzeZg38a4A+OUla/1N7PCs
         Zl4zUQisDE0/duKMdcmqu+riyYYBdDg08Ep1AcwbgW92pa6h1zEg31cH6fz2zH1/hnS6
         Pzniobd9YPsPkQsVu1GSVy9FO6nasVd4raNSpB1u/faX/6/cCk0h1ZenujzF5qNhyi0c
         hJdxC6Sr5L1e5W0iYEKl+HpAQBHDHa+/c2fyLLAKdd4AZyyhSkumsRxFHc+8aUJdqixk
         ACdw==
X-Forwarded-Encrypted: i=1; AJvYcCWLVinJ1fWbFTuPWArBCGmdE+9+F8MLSROPTULTQnVVbcK4M9z30WoN8T7Bh1dXYUzNM7hcHhzpEIkvRsK4djNO1pJTrg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxa0PTDznty5abtTZCLAbarIFuav2fv7BAhBS0lfvbUihwSifux
	+d60Ouu54J4Ks14hb31nqeafg5kZgqEONBFax3WBH4aDKphzkuvS
X-Google-Smtp-Source: AGHT+IFNRYwFJYtTRsYFIAe54Lh4omf9H/vO8B1hc+P4dH5FyrlHuZmBlJaXnBwLQ8pp45dbnF1nBQ==
X-Received: by 2002:a05:6a00:138b:b0:71e:695:41ee with SMTP id d2e1a72fcca58-724becd76f7mr4397056b3a.5.1732117570022;
        Wed, 20 Nov 2024 07:46:10 -0800 (PST)
Received: from x13.. ([149.40.62.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724bef8daa5sm1844109b3a.102.2024.11.20.07.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 07:46:09 -0800 (PST)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	rbm@suse.com
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	skhan@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v4] usb: dwc3: remove unused sg struct member
Date: Wed, 20 Nov 2024 10:46:03 -0500
Message-ID: <20241120154604.51815-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sg (scatter-gather list pointer) member of the dwc3_request struct
is no longer used and should be removed. This patch eliminates the unused
member, cleaning up the struct.

This change improves code clarity and avoids maintaining unnecessary 
members in the structure.

Reviewed-by: Ricardo B. Marliere <rbm@suse.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20241118194006.77c7b126@canb.auug.org.au/
Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
v2: remove unused sg struct member as per review[1]
v3: 
  - Add reported-by tag as per review [2]
  - Carry over reviewed-by tag from v2 [3]
  - Update commit subject to reflect maintainers
  - Update commit message to reflect actual change gathered from 
    Thinh Nguyen's feedback

[1] https://lore.kernel.org/all/20241119020807.cn7ugxnhbkqwrr2b@synopsys.com/
[2] https://lore.kernel.org/all/2024111922-pantyhose-panorama-6f16@gregkh/
[3] https://lore.kernel.org/all/5l65sdskdzbehxamff5ax4ptiqhaxh7ewi4umtpp6ynen45nj6@nebuxjg4c4rx/
v4:
  - Remove out of context paragraph from commit message as per 
    Thinh Nguyen's[1]
  - Fix Reported-by, correctly attribute report to Stephen Rothwell

[1] https://lore.kernel.org/all/20241119221907.tyt4luboduaymukl@synopsys.com/
---
 drivers/usb/dwc3/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index ee73789326bc..3be069c4520e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -956,7 +956,6 @@ struct dwc3_request {
 	struct usb_request	request;
 	struct list_head	list;
 	struct dwc3_ep		*dep;
-	struct scatterlist	*sg;
 	struct scatterlist	*start_sg;
 
 	unsigned int		num_pending_sgs;
-- 
2.47.0

