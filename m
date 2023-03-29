Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D43C6FD18
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Mar 2023 03:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E3ED408FE;
	Wed, 29 Mar 2023 03:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E3ED408FE
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qmpshAbC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qksFtd8V8mYS; Wed, 29 Mar 2023 03:30:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1779E400E4;
	Wed, 29 Mar 2023 03:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1779E400E4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC5FDC0037;
	Wed, 29 Mar 2023 03:30:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3993C002F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 03:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FDF84187A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 03:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FDF84187A
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qmpshAbC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cYKd5RUVwoKz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 03:30:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32B324186A
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32B324186A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Mar 2023 03:30:20 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so17233273pjp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Mar 2023 20:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680060619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FtcGDVjaqeuPL/8W91XNPY+pMHVz0BQOB0Aiv4wpJnA=;
 b=qmpshAbCBfuJyN0nxoS0rwN7HMmcs2sIkK+0M41zIOvabJzUxUNgoXdDRpUhtoQPsY
 mlp1UhjMk+5sN4t3PsJjmXw8Mb9r/+mCLfdHWU8lfQA874uRhKis1ZmOWyPJizJJQ/V8
 lHrOaNkRzdQtXMwYzeUhd7lJkL2jbphwXJCp8+G0ZjgWpl+dVts31p5xH9Vu54rPgkGx
 oYFamu0EjSeoxTzEg3MlHAeDZwSU8kcsrVj1PVbsgwMTEVftnG+C56Cm8Uo1BRBUUCjy
 AEYx972gwWKdvr7yLiv/2JLzaSVZnFKRw057/fyfYHV454xC6D7WfaL4LxbCuYBM9Gdq
 1ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680060619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FtcGDVjaqeuPL/8W91XNPY+pMHVz0BQOB0Aiv4wpJnA=;
 b=g4l/2agNETgeS1vemt3bT/3WVkXJl22j5ThkIZSZDTRicxZkszovb9ws2MzsM//nAZ
 ELeJPXBdO4DPIyCOUrCrIej6U2Bd7FzpRDAHbCBTu8s6xZEig19YaLnoigyWGjVfLqI5
 F0d6qEmWsFvTUF0N8GCJge8eKF5uqzo7HBu1so24blK/yazm/0F8Whq7Bve7x4C2B4sh
 uWzEu9NJmOVVUk7wrnYP/rdhQrvEpfQK8X9S/iLmMPxAZLnr25B7FYqXl6ZiB9Z+pkcW
 rsOFhIZJjL5Yog6u4uZGe8bxBsmh2Zk8arre8FEgD5AVKzkRfv5sE23xSAUeaA3XAqml
 HE/w==
X-Gm-Message-State: AO0yUKXqP9qoUKwRs/taTDT1yIKbK+rXJ4R74wS7pOgq7MXlw4Vgso2i
 t2yOwW4A8J+4K6e9MvbR+uw=
X-Google-Smtp-Source: AK7set+CTVBUTdTSSPwN58myXR04b8IPcF1+KE3BwukRJc4IVqatk69et9J/h/7SjjKJY6HQXGTiRw==
X-Received: by 2002:a05:6a20:c41f:b0:db:6237:e76 with SMTP id
 en31-20020a056a20c41f00b000db62370e76mr13881116pzb.15.1680060619295; 
 Tue, 28 Mar 2023 20:30:19 -0700 (PDT)
Received: from mac.. ([2401:4900:1cb9:b52a:d09c:44e6:8975:d681])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7800e000000b0062d8e79ea22sm4100116pfi.40.2023.03.28.20.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 20:30:18 -0700 (PDT)
From: Piyush Thange <pthange19@gmail.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb:dwc:core.h Fixed warning of documentation
Date: Wed, 29 Mar 2023 08:59:38 +0530
Message-Id: <20230329032938.225211-1-pthange19@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Cc: shuah@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

While compiling documentation a following warning is generated.
Function parameter or member 'resume_hs_terminations' not described 
in 'dwc3'

One more warning arises in the same file as follows
Function parameter or member 'gfladj_refclk_lpm_sel' not described 
in 'dwc3'

I need some insights on this.

Signed-off-by: Piyush Thange <pthange19@gmail.com>
---
 drivers/usb/dwc3/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 582ebd9cf9c2..4743e918dcaf 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1098,7 +1098,7 @@ struct dwc3_scratchpad_array {
  *			change quirk.
  * @dis_tx_ipgap_linecheck_quirk: set if we disable u2mac linestate
  *			check during HS transmit.
- * @resume-hs-terminations: Set if we enable quirk for fixing improper crc
+ * @resume_hs_terminations: Set if we enable quirk for fixing improper crc
  *			generation after resume from suspend.
  * @parkmode_disable_ss_quirk: set if we need to disable all SuperSpeed
  *			instances in park mode.
-- 
2.40.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
