Return-Path: <SRS0=3RFK=ZW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E476FC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Nov 2019 05:02:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A430C2075A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Nov 2019 05:02:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVJJdPhZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A430C2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7E8FE850E9;
	Sat, 30 Nov 2019 05:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZ6Iej8ut_7T; Sat, 30 Nov 2019 05:02:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1AD8285082;
	Sat, 30 Nov 2019 05:02:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06906C1DD5;
	Sat, 30 Nov 2019 05:02:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09596C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Nov 2019 05:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E657D84D35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Nov 2019 05:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6bHfNchKlai
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Nov 2019 05:02:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5466B84C3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Nov 2019 05:02:49 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n4so34778597qte.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Nov 2019 21:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v2t4S2oRrDrvLFBOnB6dJGEG8QhYQMSo3sQCvKaKAA8=;
 b=fVJJdPhZjuVFj7BDk5abPsGB2R9H0GROrSTvuGs7eRbP1HI2oyAOMeb7ixPbu94vju
 psCSIJ339kw74n0XMfSWAYM9fRPr7p2BVm8jNr2sClbsdXd8HNp7ludHI+m+iFxQNE0E
 eEEeHxkw9PgHbRtlzm108fGLoB0e+/k56BRDiddNn3Uo8GR25FR5iWTsgtWAjNBHHsHT
 eNWknR8l4y4pL3iwIHLJvcsHlu2i5ozKZRBhVMPv48f7hFPOFb4fW4kFdqkzSJmQgVlS
 +7JO13R5DhHnJ82pRe77SIP2wnlGUcygnUug14AoOrDnN+zzkRo1oAmT/fBoqYDXWpZo
 9Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v2t4S2oRrDrvLFBOnB6dJGEG8QhYQMSo3sQCvKaKAA8=;
 b=lwSoTHj/YD3+zFaXgrHwQicZmFSmpRzsYiycCfUjwmMo4tB1MNtrLiuMaTWoo1xd+I
 7MHnayhCryqb+v4GYa/Bu0LDvXMIKF3cqXvhnNmZ5jxXOEQt6VVbcVTNmSstW49wTZV9
 qFtgWGMAZLGk5rTiDweex48P8bmjQPyytoZ3R1+FD75uwM/mgay19n2EDOBRaLbptoZC
 CBJahYmytf9imAGfJMGgJWPpzI96VTtU3DE6E9fKOZllpsee0JqUzlThOYFV5GD+rS2C
 +pHmCJjs4qfzg16X6q8SLKhjpJN6eXjuFJhJD1UCHalpenhDMCxb881NG3wsAkhcQIq4
 10Yg==
X-Gm-Message-State: APjAAAWydNHs95uYIgn/yL8On5Zt1nhVGCPRcGpHX2ZI1GX/hEmOF7Ke
 V8/Qk3FLbcW35mcjfDOl4dc=
X-Google-Smtp-Source: APXvYqxr5V+yHjKM8qf9L9Okteakl0KcnAjQPyW+oWlKlsdUJWQZ2sYsqqZ21G0G3kQc+M6KlUAihg==
X-Received: by 2002:ac8:468c:: with SMTP id g12mr2677906qto.92.1575090168076; 
 Fri, 29 Nov 2019 21:02:48 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id g64sm2440437qke.43.2019.11.29.21.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 21:02:47 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
 kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Sat, 30 Nov 2019 01:54:20 -0300
Message-Id: <20191130045420.111288-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] media: dvb_dummy_fe.c: add members
	to dvb_dummy_fe_state
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

Add members to dvb_dummy_fe_state in order to match with other frontends.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 26 +++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 1ccb58c67e8e..80e6a3bf76e0 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -15,18 +15,29 @@
 
 DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 
+struct dvb_dummy_fe_config {};
+
 struct dvb_dummy_fe_state {
 	struct dvb_frontend frontend;
+	struct mutex lock;
+	struct dvb_adapter adapter;
+	struct dvb_frontend frontend;
+	struct dvb_dummy_fe_config config;
+
+	enum fe_status frontend_status;
+	u32 current_frequency;
+
+	bool sleeping;
 };
 
+
+
 static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
 				    enum fe_status *status)
 {
-	*status = FE_HAS_SIGNAL
-		| FE_HAS_CARRIER
-		| FE_HAS_VITERBI
-		| FE_HAS_SYNC
-		| FE_HAS_LOCK;
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	*status = state->frontend_status;
 
 	return 0;
 }
@@ -79,6 +90,11 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
 
 static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
 {
+
+	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
+
+	state->sleeping = true;
+
 	return 0;
 }
 
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
