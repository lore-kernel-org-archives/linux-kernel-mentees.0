Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D44C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:10:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90F8D22240
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90F8D22240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A4768686D;
	Tue,  5 Jan 2021 13:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgiGtEvEzgMU; Tue,  5 Jan 2021 13:10:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D622386849;
	Tue,  5 Jan 2021 13:10:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D24A1C0891;
	Tue,  5 Jan 2021 13:10:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20257C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1C9468686B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9rxWz+qA2CX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 85E4B86849
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:21 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id 143so26267880qke.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 05:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7V116JlniXowvoRil+y9QTOIRjNYDEUqk7cGXQm9XJU=;
 b=fOwI65AuUdFjysiIf7D37W8dRQ+AtUhRQO2LHgbSqZZtqyReJn42INs+AguEFda0ho
 IgeDn1d3GAhCw10aZZlEPCoXzQMEHQAutZFipWBFfX8B9IIuR5XON9bJuBk7bRFtuXNj
 6m0PdNNzNeiM6VSBjdrrkbhKVeN84cMXbHqDeEaIBz8/e49DG6qU6xAT9xSvxb58C1FK
 wn//yZ78LSDxqlPckXPeb3uf3VyQfWEPUascENb/vxS0jzNQ736wqb7V3xtCm2tnMy9t
 I2ww/sYbsn+rnAni4Oirf2AZ8xDw23wd0tqrnQ/inxhVPyzcEIppHFsPT8gaj1bxvUmf
 I74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7V116JlniXowvoRil+y9QTOIRjNYDEUqk7cGXQm9XJU=;
 b=Uaaq6S0bLbkviAsnKBpCJBej8yg+U+f0uLc/O1Wt5s18+JO/eSDJnKpAxkNV+Z466S
 YcmK+ZpEM74Jpy35DIlKOX6yTCeR/vV62wcXHsrxjnGpsuA6scWsCTipKUyMAydz95hh
 eGwW8wZzbDzK1CpLrZmjlEVRje4IYuAiQiFscLY35CnSf5zG4r9Lf79bMbGchq39O9Qh
 q98Y5foG4PaQWLkWnr+Ba5xiHzaZ8S3RW3gr5cFP06G2z+t5iaGvU4RB1cBp8jw+jOUo
 q+MntO5bphGA+50yImMTlPhJ+qE3fPK5O+iS0DsnZMLYnGmpDhGl1NJcTOBCA4xFUQrK
 iUUg==
X-Gm-Message-State: AOAM5339N77+Zgi4SJ9JG/nNgWSksQwC/T5A1p03ezN24A08e1IIDNqL
 1xa7894MsXdPdLyN99GGFmt3sg76Xwv3XA==
X-Google-Smtp-Source: ABdhPJwp+HawSXDqndcEGHoRfjp3wzEfNziRoGK+VeWD6R2ADQ1R4zhQA1bWDmPAknZVZSeMvwrJ4Q==
X-Received: by 2002:a37:4d8e:: with SMTP id
 a136mr14823262qkb.317.1609852220678; 
 Tue, 05 Jan 2021 05:10:20 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
 by smtp.gmail.com with ESMTPSA id s14sm19877804qke.45.2021.01.05.05.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 05:10:20 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org,
	hverkuil@xs4all.nl
Date: Tue,  5 Jan 2021 10:09:54 -0300
Message-Id: <20210105130956.1133222-3-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
References: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 2/4] media: vidtv: reinstate sysfs
	bind attrs
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

Reinstate sysfs bind attrs so that vidtv can be bound and unbound
via sysfs. This is useful for automated regression testing in
userspace.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 4424f9585f86..4ccaa0f00639 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -569,7 +569,6 @@ static struct platform_device vidtv_bridge_dev = {
 static struct platform_driver vidtv_bridge_driver = {
 	.driver = {
 		.name                = "vidtv_bridge",
-		.suppress_bind_attrs = true,
 	},
 	.probe    = vidtv_bridge_probe,
 	.remove   = vidtv_bridge_remove,
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
