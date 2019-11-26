Return-Path: <SRS0=PNQn=ZS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC43C43215
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Nov 2019 15:40:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 454EC20727
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Nov 2019 15:40:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZryQJlQk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 454EC20727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 033D9204B5;
	Tue, 26 Nov 2019 15:40:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWFxGD1pkpZ8; Tue, 26 Nov 2019 15:39:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 702E720464;
	Tue, 26 Nov 2019 15:39:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6771DC0881;
	Tue, 26 Nov 2019 15:39:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83919C0878
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 15:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 801B78577F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 15:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJb_Npv2IJLY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 15:39:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EB843849BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 15:39:57 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id g1so12491588qtj.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Nov 2019 07:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jqOLj+zmhCKP7Os2hVh7KNkHJtVIfRP5Fr7ygxzfC/k=;
 b=ZryQJlQklZkrilo3PB6/3iQkzFYlNRAE83eqDldO3pYYrXbuN1qjXyaSyDg40Q3Ww5
 r/FrUnvEAuKgvzCqaPXgOAL3PNq9MLItAvdW9jCp76ILGphb7Ljr4ZDpVQdOftgxTp7F
 +RT9wdHGyU7YMnPBOP0zn8Kfwh7I22gbbIdHKkFpN+GiSlclJY3nPMJ5e1czT60+X2H1
 NMP16huoRg+U4XS4O5sxylbyxdM60MhTXvMqCvW3dtDDvnw321e1QpjjghbHVJ8qY2cB
 BzR/B9F4vMkDMy+0UwZ7YL2js25YJkFu3fbgp3wMLIv+/gYJ4KVTkKKEaEyCFMQNO+dH
 INWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jqOLj+zmhCKP7Os2hVh7KNkHJtVIfRP5Fr7ygxzfC/k=;
 b=ZgaKSDHg6xivzPcUko7E77iQFE7kf21+zatwlfsqRC1scvW+troP5hdMqH2rq819Wv
 5J0rLfvKz6OW+rI803H4Jt2YNXeNz7Cbo1Yeh00ywPKgqjL8VMR4XDGED/oN/fYBlOq+
 kL9B7Gxsdfci/S3zgDTTjK8MmQoS4u+gMMNnPUyRXFj6Gr6PFMcH8rqj0DbR6SDh1oyU
 wgfFIsxAKOHUQZWxrb/gsG16x/u0N85GQGUDbvArAoSTp4eY1WhsVhhVbGW7XUczehNk
 5BNW9NlsJvU78FgHF5J6Hqk9Jnz5m57S17EY9w16x+SfW1gFc6t4EdocQkQaJAnzeV+c
 HSaA==
X-Gm-Message-State: APjAAAUVbh8Vw2XzPdD1ewG63F0sqecCOH+z1sftfu0LE/7wj9ROj/HX
 oNLDG9lvP2ZWqq4yNjOJbaY=
X-Google-Smtp-Source: APXvYqwRg51oIe6DA1IT2q++wUTdAqhqELpT4Qih6rNjRSxcYqDcBeXG9pFn2r75cIpoj1BsYMC0kg==
X-Received: by 2002:ac8:690c:: with SMTP id e12mr23339115qtr.239.1574782796765; 
 Tue, 26 Nov 2019 07:39:56 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id z64sm6047532qtc.4.2019.11.26.07.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 07:39:55 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org, gregkh@linuxfoundation.org, rfontana@redhat.com,
 kstewart@linuxfoundation.org, tglx@linutronix.de
Date: Tue, 26 Nov 2019 12:31:57 -0300
Message-Id: <20191126153157.26355-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] media: dummy_dvb_fe: register
	adapter/frontend
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

Before using the DTV frontend core, a bridge driver should register the
new frontend at the subsystem and unregister it at device detach / removal.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/dvb-frontends/dvb_dummy_fe.c | 39 ++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
index 4db679cb70ad..1ccb58c67e8e 100644
--- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
+++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
@@ -13,12 +13,12 @@
 #include <media/dvb_frontend.h>
 #include "dvb_dummy_fe.h"
 
+DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
 
 struct dvb_dummy_fe_state {
 	struct dvb_frontend frontend;
 };
 
-
 static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
 				    enum fe_status *status)
 {
@@ -84,7 +84,36 @@ static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
 
 static int dvb_dummy_fe_init(struct dvb_frontend* fe)
 {
-	return 0;
+	int result = 0;
+	struct dvb_adapter *adapter = fe->dvb;
+
+	result = dvb_register_adapter(adapter,
+				      KBUILD_MODNAME,
+				      THIS_MODULE,
+				      adapter->device,
+				      adapter_nr);
+
+	if (!result) {
+		pr_err("DVB_DUMMY_FE: Failed to register the adapter, errno:%d",
+			result);
+		goto err;
+	}
+
+	result = dvb_register_frontend(adapter, fe);
+	if (!result) {
+		pr_err("DVB_DUMMY_FE: Failed to register the frontend, errno:%d",
+			result);
+		goto err;
+	}
+
+	return result;
+
+err:
+	dvb_unregister_adapter(adapter);
+	dvb_unregister_frontend(fe);
+	dvb_frontend_detach(fe);
+	return result;
+
 }
 
 static int dvb_dummy_fe_set_tone(struct dvb_frontend *fe,
@@ -102,6 +131,12 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
 static void dvb_dummy_fe_release(struct dvb_frontend* fe)
 {
 	struct dvb_dummy_fe_state* state = fe->demodulator_priv;
+	struct dvb_adapter *adapter = fe->dvb;
+
+	dvb_unregister_adapter(adapter);
+	dvb_unregister_frontend(fe);
+	dvb_frontend_detach(fe);
+
 	kfree(state);
 }
 
-- 
2.24.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
