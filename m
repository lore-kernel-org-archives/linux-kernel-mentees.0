Return-Path: <SRS0=yDVd=ZX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADDFC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:24:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8029D20748
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDHBQ6ii"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8029D20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 643F5877DB;
	Sun,  1 Dec 2019 16:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnDrfZ5UKoB1; Sun,  1 Dec 2019 16:24:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 010AD87B60;
	Sun,  1 Dec 2019 16:24:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F20F3C1DDC;
	Sun,  1 Dec 2019 16:24:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4EBBAC087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3D92E87B60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rUVlcjNo7DQC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:24:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A49A9877DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:24:03 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id a137so28357248qkc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Dec 2019 08:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RoeWgDgLObUnZ0KQQuawd0aWkmo9MU3ohnAF6iYl1KE=;
 b=CDHBQ6ii4gUKoqPd60R7v1VjD/7lRklOCJdNDRn39wGgBxYaH/pmDmYJ+ONuI3vzXR
 46G7MwPQcJzXnwELV+EHP0fh1fu+/miG7MKBiI8pljYeYOiOiy9yw7WvBV5rdvkyNbmM
 UoRtPUZp3njhOjLb1fWhycfst0hp++/fWMCSK7oPlIEnwVXiosfkd8t5+LkbCL43x69C
 0NtHS7rwzu++sZNbMzQ+/Kp9/NzdTWCA/P2HCPPVbftiHZ0aoSptYiN+iEyMsafUawHj
 e0s/BIKEEcUUcmzecZFw3RIIZOsHUFu0qTNPa9RgB/2J83AfhmjzRKT+L7jR9wg9QcbE
 AOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RoeWgDgLObUnZ0KQQuawd0aWkmo9MU3ohnAF6iYl1KE=;
 b=eo2txOvFYhUfOLG8fHecBsyII80CUJ7egpgiqat3USqixhO92tyBDIo9uT6+pY/MXJ
 uWsH+KQGWnX+z2AcQE4qFafPx8Z7dixIimnaCE2JN3KWHbS42w4KGLv1RmT96A/CAfTA
 dWCsWHOjg7wjI9LpbfwBP1olkwe28+1FoLd6MzB1V2a1PVry+wQDEoU97hoxAmieLHXZ
 F8S7sf+Qya+EHj4dO3ErzA4dv6rbN9LCLRrMlUmthxzmfiZj6Wn6APxVAXrdFXaamim8
 KqNeCeNAM71iFdv6OUx2HXhfKNWeW4eSc9/9nZXknkvtwD0jBCaMtIcLY6e2Vs0vVOzS
 +o0Q==
X-Gm-Message-State: APjAAAVPMUvP/TiLocVBilRSftOrNOLzxRlVaYENibWtZhp5ILqvGnjE
 HCDNGMjvmeZBprRhPbum6Lo=
X-Google-Smtp-Source: APXvYqyPTj3pBXMc2lj2I8Vf+T6aTQpkRy3BKK2H0cfD+3Fp2vnRkYQ59fbjRD0G6Mkh6qOoh0+u7A==
X-Received: by 2002:a37:9bc4:: with SMTP id d187mr25351712qke.17.1575217442605; 
 Sun, 01 Dec 2019 08:24:02 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id y10sm5171195qky.6.2019.12.01.08.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2019 08:24:02 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
 kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Sun,  1 Dec 2019 13:15:42 -0300
Message-Id: <20191201161542.69535-7-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201161542.69535-1-dwlsalmeida@gmail.com>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH 6/6] media: dvb_dummy_frontend:
	remove 'extern' keyword from declaration
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

Fix CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
by removing it.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.h b/drivers/media/dvb-frontends/dvb_dummy_fe.h
index 35efe2ce1a88..1c82338e0c8a 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.h
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.h
@@ -12,9 +12,9 @@
 #include <media/dvb_frontend.h>
 
 #if IS_REACHABLE(CONFIG_DVB_DUMMY_FE)
-extern struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);
-extern struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);
-extern struct dvb_frontend *dvb_dummy_fe_qam_attach(void);
+struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void);
+struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void);
+struct dvb_frontend *dvb_dummy_fe_qam_attach(void);
 #else
 static inline struct dvb_frontend *dvb_dummy_fe_ofdm_attach(void)
 {
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
