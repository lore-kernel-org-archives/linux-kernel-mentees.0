Return-Path: <SRS0=nM8m=Y7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04336FA372C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 01:44:07 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C581121882
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  7 Nov 2019 01:44:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kic0KlCf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C581121882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 79DB9B79;
	Thu,  7 Nov 2019 01:44:06 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AA52CB6D
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 01:44:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 48B04189
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu,  7 Nov 2019 01:44:05 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id t8so616651qtc.6
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 06 Nov 2019 17:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tPal4Tiqr59qTE4j9taLMEZPyrRNOc3SEDhq39Ai+vg=;
	b=kic0KlCfgbyQSycleGSUGHg4bZcIuK3yiYuF99JI4LmP+9yGNWmh7TBUXvukOm0JVd
	nVJVCnB8tq/YCsPxguRsnntFs7IuCYTrd4/7stszwGUmFf3vRa2UX1+HQ6UC1TdpRRCD
	VS9G8/HP64zEU99KnjBUQz1h/o286W4d0lKqe8ceAdQBauATsFQMp5sUOLrjabMdHXc+
	y0svqQXEXfZIDswBnvrWB8pb0j5FdfIhqlYDVNxlL9q4XloYWAzSuwP7051wmYXjbWCe
	DJvSrI+bhrnVh+aphEb9xAPBwUmi9Mv7s/z8vTPVzm7AAVSbhPIgbwgLElwvlr5uTdrh
	2fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tPal4Tiqr59qTE4j9taLMEZPyrRNOc3SEDhq39Ai+vg=;
	b=eKGEuXQT+q5JabzXD4grbaY2cs8FCkCtCYzqwbN/uaFYm9wTBOoTxuTP2r2YZhIS1d
	sbhNRDYXXRjU4ZDnerbPZR+coHnsLq/7XAblCpEi/8/sMP9RcGNQTqJrzIurOWdvyVoQ
	X6fmapZkkCDA9HRvEFgv1Qc7+eBmQbNkkFOCEIHK+Nvfq2xZgNGMShF8Law0uKYSFQDl
	AbTrYXYuQzvVIY+5uHwUxq6ZcD7C7h8mGyg0uXDFnorx/YKILvMwXhzpxl8enJqMpcXA
	Clry+tK5LhfGzkO+hoR2KXW+ExwP4TmBvODnXGVmRXVHBwpuHV4O2JLM7xAV+4/yiP8u
	BXlQ==
X-Gm-Message-State: APjAAAWnCAPq78QhVamnvRZ0zGiy1YyVcBLPMbjgYTmizUwG7tPufz0K
	UP2UKh8Gs8CWUbYilF/IWpY=
X-Google-Smtp-Source: APXvYqz1z+OOXVnwnekzSO564Z0h38RCFhoI+TOMiMkZG4/Vq6sygDhROacXTZXFBFiDWUtG/TUIRw==
X-Received: by 2002:ac8:7188:: with SMTP id w8mr1173603qto.211.1573091044281; 
	Wed, 06 Nov 2019 17:44:04 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
	by smtp.gmail.com with ESMTPSA id g45sm377343qtb.48.2019.11.06.17.44.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Nov 2019 17:44:03 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, rfontana@redhat.com, gregkh@linuxfoundation.org,
	allison@lohutok.net, kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Wed,  6 Nov 2019 22:36:33 -0300
Message-Id: <20191107013633.21894-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] media: dvb_dummy_fe: place
	EXPORT_SYMBOL below corresponding function
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

dvb_dummy_fe.c had all its EXPORT_SYMBOL macros located at the end of the
file. Now these are located directly below the symbol they are exporting
for increased readability.

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

---
Changes in V2:
*Add git commit log

---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 4db679cb70ad..909dac2345c4 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -121,6 +121,7 @@ struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
+EXPORT_SYMBOL(dvb_dummy_fe_ofdm_attach);
 
 static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
 
@@ -138,6 +139,7 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
+EXPORT_SYMBOL(dvb_dummy_fe_qpsk_attach);
 
 static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
 
@@ -155,6 +157,7 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
 	state->frontend.demodulator_priv = state;
 	return &state->frontend;
 }
+EXPORT_SYMBOL(dvb_dummy_fe_qam_attach);
 
 static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
 	.delsys = { SYS_DVBT },
@@ -253,7 +256,3 @@ static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops = {
 MODULE_DESCRIPTION("DVB DUMMY Frontend");
 MODULE_AUTHOR("Emard");
 MODULE_LICENSE("GPL");
-
-EXPORT_SYMBOL(dvb_dummy_fe_ofdm_attach);
-EXPORT_SYMBOL(dvb_dummy_fe_qam_attach);
-EXPORT_SYMBOL(dvb_dummy_fe_qpsk_attach);
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
