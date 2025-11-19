Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F94366DDF
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 13:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557758; cv=none; b=nnkivYLaFz8Wv5KcXAEee/+CKDfI2Mpliq0G+898byZLpLRcq9vefz05uUqInn/AzeByBz21m7ezkE+CE5M0C3xNCwvQjLsvkwyWxXwXK4YyKV1iXi3QlA5aL3mZM9cjziIer1oNNhDAeSnsKEZt5AW6sqc/MdEY3Wi7OxfmT5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557758; c=relaxed/simple;
	bh=BKVkqufuiS6rJUzZ9VChnre5rMNCHEX7xtpGlB1yltc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSrnxSioHbCGlYs8eiq9oOws9sKcfMigqimG9cUPVlQSg+LuDoO223HvFb4cxn6F3mrTzpqaeVuxwLXovBWSzDeebEn9/CFz5WalyG6T8j5vcNc9mjMN66+ZqQxVOaabO2djM0PA+u3DnqzsOvCOZmW7XHO02QTK1ir+I6mINwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhmC8sL5; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhmC8sL5"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so7510154b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 05:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557756; x=1764162556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06GbOV/A6LG+eZBqgimfmJrpsTDcg0URAHnZRQ8sqDY=;
        b=EhmC8sL5Fj8k5jQWXWNXTHE9wx7+Kxdu/53C748ENFXkVuUJ8QtxgewR6upTWlPK43
         p+PvpzoNq7y25mdW9gZnY+2+oSU17MtjrV7YZwgxyCLEoQIBaRBiYvAYvrmtmaLVprgG
         ncE19l52hlaA2IdgAkhzztrZ6aWXWJGCgwuJ8Nb0jWz3UlkxDIISbWg50y+V5MdLxTvf
         KlytwlWRBOTK30Jcb1nXz3H/YMu0OFIWfYIoU72e/IeyMMP2tPtq3ga4Dz/2SYii9S5B
         dHGjFO7sQYU2zQMmzgyNpPLkjgX0T/93MuzE1uOG1/n0RMrHyd61g/wa74xCAYL/bdAD
         z10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557756; x=1764162556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=06GbOV/A6LG+eZBqgimfmJrpsTDcg0URAHnZRQ8sqDY=;
        b=MnVTGHbdVPM9zq7I28WkmWw2qBSeTtwmdmH0PClTyH/JqZnZ7g7VHPeFNMLPJwC/tx
         btxXTZNWFj727boEanpPFkT/6IeyRCwdeQdGolif5cq0UOis/nwgwF39k2sJUqs00saH
         T93GE630Yl6gmEokk4NmaqF2+aPGiVM3wwdY9r12ilXTFNE/eWPDxghR8GzgKb/OA4la
         gfwMtxNnsI50P4V9O17kOY0ToLmdb+aUXliM943g33MlamV872TMtFVZ9LOCQN1FLsao
         Phk8PlKI7VOS8Ncw9FPoc3ihreHqlMNVDep1Vt7VrxEnvcnVTfb0vmIw9j4XMqWBOUka
         FzLA==
X-Forwarded-Encrypted: i=1; AJvYcCXDigv3llPwfrVNkTA2WBJiHX+kslFIBQSBygSa5LyqBy5fiz84YXfkSs2CfnqUncv4JfIe4PCZnvZNsoMws08p5fbFYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbvF0T4Z5ip7AGY0Rt5YucQ0nintCq9gakxM+4uVsx6vLy4b+n
	xkjqvtqNqRi4dAIVioiYW7S7Nze5Cdp6HYqKe+3qnpTXLaMh+KnFCVNt
X-Gm-Gg: ASbGncv0/7e12L3YPBM4FV6Mci4glaUknoqua7uA6YP50ldtEseYU8Ed5l7J9Fy1XDN
	z2S2gplGYoF8unMp2RVF48LQDZRs3E3sbZIFEAjDwgwFMMno5jCMzdTw/F4hAIosEb+20RmJAa1
	ZQmfcDziLsC3VO6p8UcPOM2lU2A9/K/zA4furJV9OmeUV2DLkmCSSLGyi0cB9HMQa0zBU8lANSz
	7XJxhLAKxNLEvEEzq6EKHyBgI4iQWYYPipI3e00KSZarrWstRo/C+3nGZaI01/GWLgi8VNU6KGQ
	Nh2UG5Sj3iWIKYr7VO1YyNyMSicQOrg60MdUXnPTm4jl3O6NbDz+JrDVh5PkS7BS0yvsdWenPwt
	oDYH7qkZdq3nNasi+UXsWuefbhjFsOXJL5GJC0G+eKPIhZ//a71lkIZfu5Z1u9q0d4kp+4H4H1h
	QfiuBKDLjDdhCsCGnMBL9pJk/tWVOfVN58pVQ=
X-Google-Smtp-Source: AGHT+IFqxlxMO3fSMkUnn+NerG4tlfho8+9htOLWbFEUP8jueOACUIoxEhV6KKUoeou9Auwe5Y6Epw==
X-Received: by 2002:a05:6a00:1798:b0:7b9:a3c8:8c3a with SMTP id d2e1a72fcca58-7ba39b3f426mr22579129b3a.7.1763557755625;
        Wed, 19 Nov 2025 05:09:15 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:15 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH 6/8] usb: gadget: dummy_hcd: use sizeof(*ptr) instead of sizeof *ptr
Date: Wed, 19 Nov 2025 18:38:38 +0530
Message-ID: <20251119130840.14309-7-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'sizeof(*ptr)' instead of 'sizeof *ptr' to follow kernel coding style.
This improves readability and maintains consistency across the code.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 1363de6fe..1840dd822 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1273,7 +1273,7 @@ static int dummy_urb_enqueue(
 	unsigned long	flags;
 	int		rc;
 
-	urbp = kmalloc(sizeof *urbp, mem_flags);
+	urbp = kmalloc(sizeof(*urbp), mem_flags);
 	if (!urbp)
 		return -ENOMEM;
 	urbp->urb = urb;
@@ -2082,7 +2082,7 @@ static struct {
 static inline void
 ss_hub_descriptor(struct usb_hub_descriptor *desc)
 {
-	memset(desc, 0, sizeof *desc);
+	memset(desc, 0, sizeof(*desc));
 	desc->bDescriptorType = USB_DT_SS_HUB;
 	desc->bDescLength = 12;
 	desc->wHubCharacteristics = cpu_to_le16(
@@ -2095,7 +2095,7 @@ ss_hub_descriptor(struct usb_hub_descriptor *desc)
 
 static inline void hub_descriptor(struct usb_hub_descriptor *desc)
 {
-	memset(desc, 0, sizeof *desc);
+	memset(desc, 0, sizeof(*desc));
 	desc->bDescriptorType = USB_DT_HUB;
 	desc->bDescLength = 9;
 	desc->wHubCharacteristics = cpu_to_le16(
-- 
2.43.0

