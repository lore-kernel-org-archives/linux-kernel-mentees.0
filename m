Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF20BC001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Aug 2023 11:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F9AB40327;
	Sun, 13 Aug 2023 11:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F9AB40327
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Mx8py+Hi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MyZtI0zt4WYk; Sun, 13 Aug 2023 11:01:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C730740176;
	Sun, 13 Aug 2023 11:01:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C730740176
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94048C0072;
	Sun, 13 Aug 2023 11:01:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91F52C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 11:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B66F81B17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 11:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B66F81B17
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Mx8py+Hi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XduTu4Pf-vWw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 11:01:29 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63E1181B10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 11:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63E1181B10
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bbf8cb61aeso22263245ad.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691924489; x=1692529289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dIx3E8QDpnEzVTbkCLWDZWHa0zlmtqhLo20j+vuNiJQ=;
 b=Mx8py+HisInkEu9PfRzoQPep/XRUv3Dr/F+4qHdbjKCaMYQSirKh8yRNZ2jTEJjMBC
 clnpY7oBdlB/Z4uf7kApAgBuTKn9W6b+n8Uz4cnY8qvKQQh5TnVSpI5/kQb2WsKDpHj7
 772PL4jmMfBKI+To2PES2+oTy6K52lF6HAXCiHcmDrX0oPxisEKuf1vpf5tE132tkRWy
 kb/jmzneTntyTpcWpGAy2fl/S12w0bM6YhdEHC67opRl4vRMyGlls8DZT2xuGILgSt3w
 4Ztoc2WFmgPtIgDYyZUsgxepXNq02WCXsCWUTox8riDojjpCIM5B8eW9JoM9aHF1pRK3
 jY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691924489; x=1692529289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dIx3E8QDpnEzVTbkCLWDZWHa0zlmtqhLo20j+vuNiJQ=;
 b=WB3vuo6UDaUcX/ToYWIEy3RKB8Sb5t3tOJh6aCf2E1rqGISrLggjCphnFjiX6u4+0e
 t7TMTZxnFPq7Nur7yjmw+jfK+WEoV0n1MuejYRaMO/yBOWlOmJ/JdckKFGI02Z+gVf9C
 iBIBuQPmNe+EsqZ6z6MLS5khQ+bpKJNTGQ4KIJBPY7eVFgrRUx/Df7eTY5gr3v/FxaJD
 qp7UqQaH/W5FE5PPTRZBvZOcQgIpy+Y0vzp2nS0e3SvfMELeqLJLBj5m/FK3EgqX6zqS
 IfvdGFMKyzAo2CwIe8R7HavPjMUKD+jVYz2K2K+EklodP0LfooHEpvb+ggRG5/R8Rs98
 LyIg==
X-Gm-Message-State: AOJu0YxHIHNzmYMw1siuWInu/yvXDZ8DYT3C53bh/KAGu+t1HXHkgs/Y
 4S5ksr67Hyw2ZIvI1IlqV0Q=
X-Google-Smtp-Source: AGHT+IGJTQuQonYB6BKUw4PWJ3jAaaanpnTdgGLbZC1g7Y//dgViTo9wIIKcRsJAbvIzTZja+okZ7g==
X-Received: by 2002:a17:902:f545:b0:1b9:e972:134d with SMTP id
 h5-20020a170902f54500b001b9e972134dmr5764797plf.3.1691924488635; 
 Sun, 13 Aug 2023 04:01:28 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c2:100c:8e93:d00a:1992:423:e24e])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a17090a404800b00268b439a0cbsm6103075pjg.23.2023.08.13.04.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Aug 2023 04:01:28 -0700 (PDT)
From: coolrrsh@gmail.com
To: Shyam-sundar.S-k@amd.com, hdegoede@redhat.com, markgross@kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform: sps: Fix an unsigned comparison that can
Date: Sun, 13 Aug 2023 16:31:22 +0530
Message-Id: <20230813110122.129793-1-coolrrsh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

From: Rajeshwar R Shinde <coolrrsh@gmail.com>

The variable 'mode' is declared as unsigned int in local function.
The return value of function amd_pmf_get_pprof_modes(dev) is int and
it is stored in the 'mode' variable. Also the value of 'mode' variable
is compared with 0 which is signed int by default. Thus redeclaring the
variable to signed int.

This fixes warning such as:
drivers/platform/x86/amd/pmf/sps.c:128:5-9:
WARNING: Unsigned expression compared with zero: mode < 0

Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
---
 drivers/platform/x86/amd/pmf/sps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index ab69d517a36a..703723a66830 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -176,7 +176,7 @@ int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
 
 int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev)
 {
-	u8 mode, flag = 0;
+	int mode, flag = 0;
 	int src;
 
 	mode = amd_pmf_get_pprof_modes(dev);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
