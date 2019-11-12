Return-Path: <SRS0=D7LL=ZE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B645BC43331
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 20:00:21 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 864D4214E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 20:00:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzEVLDql"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 864D4214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 59C33EB0;
	Tue, 12 Nov 2019 20:00:21 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D9144EA5
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 20:00:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CFD178A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 20:00:17 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id i19so15655838qki.2
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 12:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sUgul/A9cCSF36Xg/vqaHA0cEImiVIRh9iAQCFNRdHQ=;
	b=HzEVLDql49dOVwTMZt9IJDllV61HRuag1vF5aQdcuQ4PoiQNz/LWZ1bbSiAEI1/Vw7
	DW9kfGONyd8NihhAqJNDEPWlb7bjjYSmv/FjLZR52t+3EMmdg73bCOuUj/2CMsSSFiES
	5yjBHKF+UMnr3FObFsxN3msgz2Di972TS6wdu9ztmhlPFITx37jINsXm1fgrKxb/lAos
	SCHrJsZFHTmL/YfLZUIy8WfHtYntAaVYkyy9pF2SAmDSXBJV5qxQTDpssyoa5W1DzfGE
	6+MWvd8AlcA5s7yDaH1ZW3mgT30vZsuGLvbBPD68VNYbZtnSJg7eQIfZFHSOk4f63JQm
	o1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sUgul/A9cCSF36Xg/vqaHA0cEImiVIRh9iAQCFNRdHQ=;
	b=ELM+aGmFgBC2qFujxS6eM11sJjF96NC7T28c6aE3yBUAwCpc1H+BIZX67xsGi3QtxC
	790rVsLtZ3BsAQzedqcR0waq+qI9ZhRYoIGiGDw3sxlzC8TFu0OSU20RIB4oRnhF5eBl
	83+cCdD061uiKMf/iIU3QgmgbaN0EvCp9UJLBU7Gmmc5O1HOJoI9B3UAzYtCJA+mOn90
	MNBc95Xyh5rHmg+zRZzCZIYLpXPLMSccpdz99k/sfnwYetL6RXTUmpZ6no96I1mXCwcG
	zlsTrGKu54HFYojCwO2IKiGy5MJ9ySz89SqGDDCQE9wtjSZgR5ooybGypDRKy/KH9qBe
	DE1Q==
X-Gm-Message-State: APjAAAU+Kse3JkZsb0aBRUZuHKhCVW/J4pNbsym+YyvC1upbAwyuNQby
	CiBOY0R7Pfcjh4G2IzGqZYU=
X-Google-Smtp-Source: APXvYqy1f9ekVu+VnvCTbNVtKxjC7eHIzuOiXxnRVAjWeIcCFuTmMakBzLxZOfrwLbUN6A2aMk6Vmw==
X-Received: by 2002:a37:f915:: with SMTP id l21mr17001532qkj.209.1573588816759;
	Tue, 12 Nov 2019 12:00:16 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
	by smtp.gmail.com with ESMTPSA id
	h186sm9436141qkf.64.2019.11.12.12.00.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Nov 2019 12:00:16 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
	kstewart@linuxfoundation.org, tglx@linutronix.de, allison@lohutok.net
Date: Tue, 12 Nov 2019 16:52:48 -0300
Message-Id: <20191112195248.36084-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] media: as102_fe.c: fix checkpatch.pl
	error
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

This patch fixes the following scripts/checkpatch.pl error:

ERROR: open brace '{' following function definitions go on the next line
+static int as102_fe_get_tune_settings(struct dvb_frontend *fe,
+			struct dvb_frontend_tune_settings *settings) {

Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/as102_fe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/as102_fe.c b/drivers/media/dvb-frontends/as102_fe.c
index 496ebb8176c0..bc72d954dc1f 100644
--- a/drivers/media/dvb-frontends/as102_fe.c
+++ b/drivers/media/dvb-frontends/as102_fe.c
@@ -290,7 +290,8 @@ static int as102_fe_get_frontend(struct dvb_frontend *fe,
 }
 
 static int as102_fe_get_tune_settings(struct dvb_frontend *fe,
-			struct dvb_frontend_tune_settings *settings) {
+			struct dvb_frontend_tune_settings *settings)
+{
 
 	settings->min_delay_ms = 1000;
 
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
