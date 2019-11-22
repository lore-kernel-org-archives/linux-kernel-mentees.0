Return-Path: <SRS0=fwyv=ZO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BE3C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Nov 2019 04:26:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C55B420704
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Nov 2019 04:26:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tI9ZcU4X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C55B420704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 78C6E2047F;
	Fri, 22 Nov 2019 04:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dqhx0t1PFj6q; Fri, 22 Nov 2019 04:26:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ABF2F20477;
	Fri, 22 Nov 2019 04:26:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8AF4EC1DD9;
	Fri, 22 Nov 2019 04:26:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B05DDC18DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 04:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9B62F2047F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 04:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCUQOtmbIS0s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 04:26:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by silver.osuosl.org (Postfix) with ESMTPS id 64AB120477
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Nov 2019 04:26:11 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id e187so5197915qkf.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Nov 2019 20:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mHG8+AxgBFSWa8fV+NFUGm+PfxGngjUbTez74iu0nRg=;
 b=tI9ZcU4Xe1MKGicL93WBj6TscKcqAOuxBlMzSP/FS2W2Pv4T2F1rHrN+Aepi6pF2NL
 Ym2EkT5lcpeqUFQfNfIitYYxY69axKaYRavmuTDa0YsvoFpuzMVmMl+uKNsD4Z9OptCS
 +RW20STVgsxUffNkF56iNWvWeuMaaZUXbChfa9gVcu4vhDVNvQNkc/45ou7xLo/XbMO7
 NeTCb8AlptxmP8eMKnkfEFRW0owhazbJZlYdEj0ZpkJlG0VpTwhqcSk8NW27Gzlliqz4
 xDQDroUim2xPx7F8BNkXJBGEjrMX+m4EOKXWTZul9cV1ONthw+PqfHg4nQF02M7XtRGt
 QWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mHG8+AxgBFSWa8fV+NFUGm+PfxGngjUbTez74iu0nRg=;
 b=ughr1TTpoYPthPTQQSC6LFTFlbQ3rfpU5kWmW+1sXB+WUH/5w6VHDhfcdhPIzOtAOd
 M9SLoxh1gnyydt6FFwGcPObI/BvzX/kN1DTgGB7JJAqnbS7h0UulUI7P2lT6Zf3rtNjR
 L4pQerMFKFDjtyS7ewoWOI+HV4l58JFk3mj6KK7qrEUXYHH99oycbm3r3Y+BAimdvnKb
 B4Q+XfnDQzhGohgusfdOODxpeVU+wfvPPtwSvIV9t91b48D/yB+vO45OcXGlyWN4rLaD
 UEScxE0QRZtGzXT1OCbr3qTV1+GozGkCXnBpJQcie+pnAAVQWkfDXFmrbtUpo94oGOb7
 WNlA==
X-Gm-Message-State: APjAAAUGHVqhfJnGo+hDZpQOv6Q21QNVtFTcwPbH2sHhu7r2Who8tfhN
 Eplzk/8ZLcQRRdeit/i9t18=
X-Google-Smtp-Source: APXvYqyW5aL2g8rbYlgvhpyY3kUxtcidGpbW8mDaqNBNfOBUXyy8NsIxoXl2GcFRM2QkICe6U0DT8Q==
X-Received: by 2002:a37:508b:: with SMTP id e133mr11084096qkb.21.1574396770124; 
 Thu, 21 Nov 2019 20:26:10 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id b6sm2748821qtp.5.2019.11.21.20.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 20:26:09 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: dhowells@redhat.com,
	jarkko.sakkinen@linux.intel.com,
	corbet@lwn.net
Date: Fri, 22 Nov 2019 01:18:06 -0300
Message-Id: <20191122041806.68650-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 keyrings@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] Documentation: security: core.rst:
	fix warnings
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix warnings due to missing markup, no change in content otherwise.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/security/keys/core.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
index d6d8b0b756b6..d9b0b859018b 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -1102,7 +1102,7 @@ payload contents" for more information.
     See also Documentation/security/keys/request-key.rst.
 
 
- *  To search for a key in a specific domain, call:
+ *  To search for a key in a specific domain, call::
 
 	struct key *request_key_tag(const struct key_type *type,
 				    const char *description,
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
