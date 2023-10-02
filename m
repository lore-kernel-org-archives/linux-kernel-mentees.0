Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6B5E784B0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Oct 2023 17:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 958BB817B0;
	Mon,  2 Oct 2023 17:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 958BB817B0
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eXJnNFKk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5xurOtiHSzC; Mon,  2 Oct 2023 17:05:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9193B817AB;
	Mon,  2 Oct 2023 17:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9193B817AB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75050C0039;
	Mon,  2 Oct 2023 17:05:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23793C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 17:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E571F60E31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 17:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E571F60E31
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eXJnNFKk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXtHLKaJZcov
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 17:05:25 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4543B605E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Oct 2023 17:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4543B605E9
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c77449a6daso318155ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Oct 2023 10:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696266324; x=1696871124;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tm5ZgP4npWWxsKKblUdwHTtzFpVC+Tkeac3SWyzkCzQ=;
 b=eXJnNFKkYFUL6uPanO0ROSNPwemXJHcl3r0CBP6GDLZq/ZphK8eqDU/RKVVm6zOcou
 RRbdfANayrJu5bvLGlu4DUnRaeK2SW8U/4AuXXTMK5KGH3NQk7utMqYsRpbE1OiJVxzz
 o6Ab8x/3qz/Vr+6zqJj62oYww4i5iPlL39Hqe3XnxQnUqf29nsX/imSzQcL7I3lxkhP5
 S4V/Hweyc6aXBtK8RDQjLxypj+fcMl6zl38EQkYkcK6qUa+wKnBS+nHZKoH7uqIaNCC4
 Fouub5mKKgq5fyd3Q3ysNslPTtiqJULcBvINZan9j4u0w4hTYHVUQ2Fz/Wpngrgcgayb
 B9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696266324; x=1696871124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tm5ZgP4npWWxsKKblUdwHTtzFpVC+Tkeac3SWyzkCzQ=;
 b=buduricd3wTCFVe0lmzIrydnhPdAsvshgRH/QiS3pwh5XStCcNDE+hBeX8MRKZdCL+
 fwQLF9hvAoJD7OcfYKf5K0zRqLAaKG1velGViZZuJbYFk3GeVsRS6jJLINng063YsL6S
 ozOb5fTlaT//u9Q/X26JMw3bLo6rhaa29NjJaLjANigcpZ9Rg1AYkGy1uESm1QxONuvm
 8qZq9EmrrQtMXW7tt6KqlZbvZPZp/3EEkbs8iLA0tiBCtWyAsddwt9IGxrZarE6VqGGr
 PdLGASmSSHpofRQ2gjh95Kot5w78l1c/KpvHPnQInKgXvAqbcImWr1ZtF5tgLhGRobT1
 rD7Q==
X-Gm-Message-State: AOJu0Yzn3WljA3SxKtzdWaXobkR6qgPyPVz0HuQz5SzIuPhJgGHsMn8O
 T4i3oTGK22HyPYHFqy/DXHE=
X-Google-Smtp-Source: AGHT+IEaszjqgU2abyNxBlvNw12ydAAMRyU8hW/BpciYMiEFH7TBldf3lwXRrOJJP1lDw16W+t6z6A==
X-Received: by 2002:a17:903:1ca:b0:1c3:e5bf:a9f8 with SMTP id
 e10-20020a17090301ca00b001c3e5bfa9f8mr16268734plh.19.1696266324538; 
 Mon, 02 Oct 2023 10:05:24 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.87.78])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a170902ed0200b001c444f185b4sm16134591pld.237.2023.10.02.10.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 10:05:24 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] usb: fix kernel-doc warning
Date: Mon,  2 Oct 2023 22:35:15 +0530
Message-Id: <20231002170515.207633-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918193505.7046-1-swarupkotikalapudi@gmail.com>
References: <20230918193505.7046-1-swarupkotikalapudi@gmail.com>
MIME-Version: 1.0
Cc: swarupkotikalapudi@gmail.com
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

Fix kernel-doc warnings discovered in usb driver.

Fixes this warning:
warning: Function parameter or member 'gfladj_refclk_lpm_sel'
         not described in 'dwc3'

Fixes: cf1202418e0b ("usb: fix kernel-doc warning")
Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
 drivers/usb/dwc3/core.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a69ac67d89fe..078edfe0f88e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1106,6 +1106,8 @@ struct dwc3_scratchpad_array {
  *			instances in park mode.
  * @parkmode_disable_hs_quirk: set if we need to disable all HishSpeed
  *			instances in park mode.
+ * @gfladj_refclk_lpm_sel: set if we need to enable reference clock for LPM in
+ *                         Global Frame Length Adjustment register
  * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
  * @tx_de_emphasis: Tx de-emphasis value
  *	0	- -6dB de-emphasis
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
