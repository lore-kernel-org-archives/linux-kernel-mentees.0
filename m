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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4961EC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:23:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18CD420725
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Dec 2019 16:23:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIF9WBFn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18CD420725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CCA6587B25;
	Sun,  1 Dec 2019 16:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCyY8HCyEh0n; Sun,  1 Dec 2019 16:23:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 66B85877DB;
	Sun,  1 Dec 2019 16:23:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55545C1DDC;
	Sun,  1 Dec 2019 16:23:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B7BFC087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2AB568686A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DclnE-10UPyo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6BAED86501
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Dec 2019 16:23:44 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id v23so22362802qkg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Dec 2019 08:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ca3gAkK8mEDKTQoYW4h/G0KW21BXs9QHiaEf8+8zow4=;
 b=PIF9WBFn5QpTNZvIZdnm96+Rc/rPVmbjduaJJIaOQEvqQx8gqnWIxpNjfi8N7Jy7gR
 jzmGom/vTUbULb5hM0K5xAkxUUp7HdnldnWFgytPdntQiR6HpVpiGejYISu1dDY/e6ml
 KoKSnVbp0nrBXmw+WfGtFKmagV26WIEGHAwyOUasDIxoWZUk6kygn+SsmPGEMLoyS1Vu
 8xvv7vQdlONtlWiM5X1vPu3T6G7iJr9o+WWJd1e+oKR/9V0ca1NYJ2EtVZqTQulEbuK2
 HlaJYqnNvOphmjFPai5c65vGJojCo+/o3KdFHyutaBkpujjrZ72yXkxSxVPwg7RqhRGA
 c5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ca3gAkK8mEDKTQoYW4h/G0KW21BXs9QHiaEf8+8zow4=;
 b=d+0mmYO2VssnKMJQ4Fy9Xi8DWAD+G58t2YGk3Irh5oEHEPJltxGoHf+5XRXS+7R1vV
 aC80Kc18QSwR4BXIHLncxo4Umag2tXNtR7yKylQNMUOP/us+uiJlaL1OkAi/zl7o0LnP
 9zLpxGZu+UZkWpuuFx+jZ4dggMCxRxWRv7quNZMBt7PkjlIGGAwt9YcO6dsGPH3wOI/k
 00WD9k3aiz5pmt8TqykfkIc064kVQyKSizd4lvCc59Ix6JidhyvWh4fv7Oe/wh/DlZ8K
 aceI9kLnpPWdY8khDThl83lC5Z8qb214MsZDSEIP5qyY1YMxz3VuQgdm5lu2Eq4fpYxv
 EVJQ==
X-Gm-Message-State: APjAAAU0dvh6EhUKXKqvlDuo0NQ8i1X3PQ7f9AX6CYE6QGwLLWI/9eQ0
 2gpQNJ3+mBJmbClQcW7z0W4=
X-Google-Smtp-Source: APXvYqzvJ9aogJH75lPYKrVoRsU0SieRRxsGSToW9xVeMYc+1x7HMJogEMY42vuDh1LFOUiatwVW2A==
X-Received: by 2002:a05:620a:10ac:: with SMTP id
 h12mr28488552qkk.227.1575217423362; 
 Sun, 01 Dec 2019 08:23:43 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id y10sm5171195qky.6.2019.12.01.08.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2019 08:23:43 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
 kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Sun,  1 Dec 2019 13:15:37 -0300
Message-Id: <20191201161542.69535-2-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201161542.69535-1-dwlsalmeida@gmail.com>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH 1/6] media: dvb_dummy_fe: place
	EXPORT_SYMBOL below corresponding function
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

dvb_dummy_fe.c had all its EXPORT_SYMBOL macros located at the end of the
file. Now these are located directly below the symbol they are exporting
for increased readability.

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
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
