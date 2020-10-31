Return-Path: <SRS0=CDUK=EG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC1EC4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 15:06:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 370CA20731
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 15:06:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjjxHoqM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 370CA20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 90B8D2E0E6;
	Sat, 31 Oct 2020 15:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3WEEKRLsgbSJ; Sat, 31 Oct 2020 15:06:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BCD402E0E5;
	Sat, 31 Oct 2020 15:06:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C862C0859;
	Sat, 31 Oct 2020 15:06:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DA3BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 588CE8775A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2KAsCQ29BkeJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B8EBD87707
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:01 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 140so7707674qko.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 08:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r3BCGj3C/4k9OjwTa/exoIeLVH3IWgVh4YgNa/s9o/w=;
 b=DjjxHoqMs3i8d7hTv0raGxsHvfU0if+6RQHN5j61MQRdpP74wWrmy89fthESuCFEdy
 bvDUYCZDagOerpYqIfdAY3GZqQtlvbwRA2lNSdlsPLyTgoIo+AXCWoj+1lDXt0Lf/nEq
 KaSns5ISpVZ/tDuuvv2J+JqMhvY+HDxtLXJRGrsIPYjmK5sVt5wJk8Q1FLhyYqt8YIX8
 D5yy77N4iXbLRbB6DttkbuvB3GYvzQNH13kdaKpBcAqKz0dPxD+Eh3DVt1lN5fLjBtnc
 M58ccxaPYPOKUHUsXlz7r+hYiKZNXpxwS6dlU02ZmlDouiGV4dDcGGTZCesW1ccGlHU+
 UrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r3BCGj3C/4k9OjwTa/exoIeLVH3IWgVh4YgNa/s9o/w=;
 b=K3pVImGVdRhP7r9rL0NNvXmUcQsu9Egh7F6VOgFLV911CbmpgJX4xnplJ5z6NP9Zg4
 4xngWhYRNbjlXKXOQVz2XFwVL/YEN8uP1r5lg/PUmio7GthrhF7bsieJP8lqjdZkqvKs
 QqMR9ecG1xXKthmLarAMR0ZbrFMSrwOPWj4yi8+YRdgbpom6Y790W3mLEKOrwFFc9cQk
 pVrOLiOtLhifQRY7PRfEsNyiAOV3Tb/8OECj1QAnvPGmK1z5YWTQC2LR3D5ixV1fKsHT
 ulkbUw8pHhGtU79Ylr+AsikvkG5LqCAu61It47XzYnvhiYN468cztQt/J/mgDTKYpr4T
 gAVA==
X-Gm-Message-State: AOAM530dnrqJTkvSS66lTRPBtb+IVLUBJf0zzEuyI0erTZ0EMM8Oug02
 jHX8kCA/4/aOq5IusqMaf7Q=
X-Google-Smtp-Source: ABdhPJyaTt9+4OWhS1aI3woLrkS9QdLAkRnDNYHBoLAw29rPafj+veutMJTHAddNZMp0U7PyLZIinw==
X-Received: by 2002:a37:aa49:: with SMTP id t70mr7254043qke.165.1604156760736; 
 Sat, 31 Oct 2020 08:06:00 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id z125sm2317030qke.54.2020.10.31.08.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 08:06:00 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org,
	r.verdejo@samsung.com,
	nicolas@ndufresne.ca
Date: Sat, 31 Oct 2020 12:05:46 -0300
Message-Id: <20201031150552.663598-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 0/6] media: vidtv: Add support for
	more MPEG PSI tables
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

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Implement support for more MPEG PSI tables (i.e. NIT & EIT).

While we're at it, fix a few minor mistakes in the PSI generator.

I initially sent this without a cover letter and as WIP but I have
now tidied it up and it's spotless. I tested the driver on a kernel
with KASAN & Kmemleak and tested the output on DVBInspector.

Daniel W. S. Almeida (6):
  media: vidtv: extract the initial CRC value to into a #define
  media: vidtv: psi: add a Network Information Table (NIT)
  media: vidtv: psi: Implement an Event Information Table (EIT)
  media: vidtv: psi: extract descriptor chaining code into a helper
  media: vidtv: Move s302m specific fields into encoder context
  media: vidtv: psi: fix missing assignments in while loops

 .../driver-api/media/drivers/vidtv.rst        |   8 +-
 .../media/test-drivers/vidtv/vidtv_bridge.c   |   4 +
 .../media/test-drivers/vidtv/vidtv_channel.c  | 130 +++-
 .../media/test-drivers/vidtv/vidtv_channel.h  |   3 +
 .../media/test-drivers/vidtv/vidtv_encoder.h  |   3 -
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  29 +
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  11 +
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 678 +++++++++++++++++-
 drivers/media/test-drivers/vidtv/vidtv_psi.h  | 240 ++++++-
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  25 +-
 .../media/test-drivers/vidtv/vidtv_s302m.h    |   3 +
 11 files changed, 1083 insertions(+), 51 deletions(-)

-- 
2.29.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
