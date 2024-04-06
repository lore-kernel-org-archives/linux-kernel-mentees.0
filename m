Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCA017758
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  6 Apr 2024 02:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712371787; cv=none; b=b3E45trX92mdPlszmxA4g1K05ebbGhhiRS75Y1ikqGel5qI4h8k5OWBASIoBoKCwjk9PQe7t13iwNu8TCIGDTTnEuJBBHz9dPmUXX0drtuSSOM5eW6rEpUAtcGCfrG+hnzGQc+TLZPU/B72H0/5VrO7eCfLmRv7pUM2pFuIdfCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712371787; c=relaxed/simple;
	bh=A09mONBJ+iQN0Aw24fomMHxPe22XFN2PHAOTkXu0xuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MPh7/mJil+kIUPBQD2x4WqejTzIrwUMzChT2sTP6uuekW4ZfoyeLRHj5jUWR4ARAhXBfqoyMLpltcuXRWrDarvLN7v5sSP0YKbDBdtwkg+J5tqT6s33dvmc80IlTgaeris7pwzkjn8rBLWVGpHemshGGZVkJSmCbjMIHXlE0bbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+4dX7Mj; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+4dX7Mj"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FAFE41977
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  6 Apr 2024 02:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxYbRiay_tAX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Apr 2024 02:49:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com; envelope-from=andrewjballance@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF3F741961
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF3F741961
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m+4dX7Mj
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BF3F741961
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  6 Apr 2024 02:49:43 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5a4f608432bso1752773eaf.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 05 Apr 2024 19:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712371783; x=1712976583; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5ujRaHA5VATDiuhfq590DYcU4neBIRjVwQ6U7oUACQ=;
        b=m+4dX7MjFdmAyAyzQ3gni2RonsnX/NfCXWSax9y1hmEp58o7nVWXE/HoJEw0oZkEcj
         jC7CT6ubBA/8jkr2knO86pl7jWiBTcsgkx3gQzVOv1cCDhLzanOxB4XQM2i1f0Y928dz
         fKjtYyF47+pMV92pShELoWNM/gGBfxYrlKVPfNKKRvHG3vTA1wqpQSnB+wsGG8fwkS+z
         67avViiHqcxIBlWu66CQ0rO6+IwsUon5WmQ3TRtZxwo3EbcmYMmGXVreV4K3qro3sTra
         6bFEt9Hh6isIeA4Tehpq0E2BKf9NfBoJi7ZlSey75tzTAFCeMC2Pw7J8fNO2BDF6swMV
         8eXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712371783; x=1712976583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5ujRaHA5VATDiuhfq590DYcU4neBIRjVwQ6U7oUACQ=;
        b=W319PJys7nVpDa+GWX7TzeCsGEHwkrAOxQUB9TxDQUIdjvCt9IBJJ8g5J6j1IlkL2z
         SeTQUr1MgqIbgNbM4HADLOkAuuceuYREdtN2VhR9DBQgATTCXEw8fzrVa91hraCrhLOq
         Q9qVuDfLp3HmfpKmlq6GCL79eqpRpRytbieahKWGy8XXnY4wykT9Yb8wJGH+ZQ5TwDtO
         r7cRKz/pLTNxaJMBKrmy7l0pKBqB0UzORRo7aE+12b2WKif9bAHoKYAKy3g2Ixtz72x0
         O1SB/sKJ3v5DGsic7xp/d1ZzRIofyU2hGIUIJkQxWmKkcj4fE4tX5kLQlaQZj9a+Vg6U
         M4tA==
X-Forwarded-Encrypted: i=1; AJvYcCUxkoWHJ0xsEi9ibtKmrUhQqmcmK5mPcEIO2xkcWBrhcPo+eWK+9YGVZZ4nKjvJdLZ0DV0/CH/Ovkow0y/ybjgPzZsgsY2tgs/iyA6hV1xk4FcQ62bU7+tCvXOrfqcm
X-Gm-Message-State: AOJu0YyNOXOcBuzaWEdKkJW1RgV1mpvFi8KKOaCEsg6Qex0z3Um+MVZD
	Fllb0BXtUUEPtWnHD7X5bmrhWWWtsTat7PaQiNvbjFAyiHZW5vmI
X-Google-Smtp-Source: AGHT+IFNc5kXWtQj21j6h2K8CVznxdxDTZr8pXjwemXOTlUDxdX/pqmIrubXfyGlL7YJWZe7/1R0Eg==
X-Received: by 2002:a05:6808:16a4:b0:3c3:9b96:9f3f with SMTP id bb36-20020a05680816a400b003c39b969f3fmr3465835oib.58.1712371782961;
        Fri, 05 Apr 2024 19:49:42 -0700 (PDT)
Received: from my-computer.uh.edu ([129.7.0.144])
        by smtp.googlemail.com with ESMTPSA id i20-20020aca2b14000000b003c3d1b47532sm467321oik.49.2024.04.05.19.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 19:49:42 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Andrew Ballance <andrewjballance@gmail.com>
Subject: [PATCH] usb/dwc3: replace of_node_put with __free
Date: Fri,  5 Apr 2024 21:48:38 -0500
Message-ID: <20240406024838.537630-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this relaces instances of of_node_put with __free(device_node)
in drivers/usb/dwc3/core.c

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 drivers/usb/dwc3/core.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 31684cdaaae3..795a572d46cf 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1762,7 +1762,7 @@ static void dwc3_check_params(struct dwc3 *dwc)
 static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 {
 	struct device *dev = dwc->dev;
-	struct device_node *np_phy;
+	struct device_node *np_phy __free(device_node);
 	struct extcon_dev *edev = NULL;
 	const char *name;
 
@@ -1797,14 +1797,12 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 	 */
 	np_phy = of_parse_phandle(dev->of_node, "phys", 0);
 	if (of_graph_is_present(np_phy)) {
-		struct device_node *np_conn;
+		struct device_node *np_conn __free(device_node);
 
 		np_conn = of_graph_get_remote_node(np_phy, -1, -1);
 		if (np_conn)
 			edev = extcon_find_edev_by_node(np_conn);
-		of_node_put(np_conn);
 	}
-	of_node_put(np_phy);
 
 	return edev;
 }
@@ -1915,14 +1913,13 @@ static int dwc3_probe(struct platform_device *pdev)
 	dwc_res.start += DWC3_GLOBALS_REGS_START;
 
 	if (dev->of_node) {
-		struct device_node *parent = of_get_parent(dev->of_node);
+		struct device_node *parent __free(device_node) = of_get_parent(dev->of_node);
 
 		if (of_device_is_compatible(parent, "realtek,rtd-dwc3")) {
 			dwc_res.start -= DWC3_GLOBALS_REGS_START;
 			dwc_res.start += DWC3_RTK_RTD_GLOBALS_REGS_START;
 		}
 
-		of_node_put(parent);
 	}
 
 	regs = devm_ioremap_resource(dev, &dwc_res);
-- 
2.44.0

