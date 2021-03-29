Return-Path: <SRS0=0o+h=I3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB5B8C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 10:45:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 302F461934
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 10:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 302F461934
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D354B606BB;
	Mon, 29 Mar 2021 10:45:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pI0-xZRXf7N8; Mon, 29 Mar 2021 10:45:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2801607A1;
	Mon, 29 Mar 2021 10:45:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEE14C000C;
	Mon, 29 Mar 2021 10:45:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A78B3C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 10:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81EF982EF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 10:45:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XDo4RMxx_wRJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 10:45:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0045082D47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 10:45:29 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso5713856pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 03:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=g2efpXc6CiG6QCMpvbYQLueL6cg1gKbJK+Z6dWI/3SA=;
 b=lwrDNhydGj21KJbXpi1nfvXIHfwqMDKggqjgFJYmJiFhS1w2zAilBYILA2Pf+jhLBG
 LXTuSExnbOeyAt1TLjatsaF78h+UIn//EmEKd32UB2TkEZhxCI9cul7wvRSgJB9n7WKm
 Aj0/x94Ok2ChTDRpA0+S5TVIqRDTE62HZZaHxiwMsRCiwGTxvmCNDnJsmRHPLIWGJ+1P
 7Zcqu7Re8dbRg7GRLyUXr8tsvODQTGElId3XjqrWCfW068mkTC2k8i22UiVONQHg5mk2
 wb7T7DfcU6OnPUmGUUZRDApveoszKOJ46JaIRA82UPEVSZj4CU/h26KAuvbA7D2BsYlz
 alrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=g2efpXc6CiG6QCMpvbYQLueL6cg1gKbJK+Z6dWI/3SA=;
 b=jdtEjHleOgHdf7/2E+L2GTxQ3+8We+loWKQChO6YLHezYBeLNHiybakIMXkhbYgG7i
 VzowPcuXm8E8Y9G2Y5uqZ9Lusp142KSQ5L61txZOE5ER5m4KPqdleMK0n4tnKcFxxIn8
 v06KyKOQYmnYmn/E33omta7TjgjLtt5KdyYPSPInnRhs9CzAoOFV4pbUPk/993xjilO2
 TjFzFTPAxbEIihtpI/46BgVUiP+5lM1hyEFct7+IDv9KhxswqaZ73JMES95M6z3X9WtZ
 IZDA4o1H/+7wZ1wYXfkymka6kP6Pppxtm1Bm+GYjM3j67H1RfNwzZoPxcllGUF0f/bV2
 mg/A==
X-Gm-Message-State: AOAM533grD9imACo8iLzek5e4jkEpouiq0IpGCNRcfwVfNZIOnUopLuL
 +raHtwHAAgujC6HBy03Qxpvvbnz2viAw8A==
X-Google-Smtp-Source: ABdhPJxZSy88aUJ6nv1FSCn7vFcyjln/WZWwIqUth7Zbwp+cTyNUvACjs0umhKfvpfaQ+TFdNkjGHg==
X-Received: by 2002:a17:902:9a0a:b029:e6:bf00:8a36 with SMTP id
 v10-20020a1709029a0ab02900e6bf008a36mr28128496plp.51.1617014729311; 
 Mon, 29 Mar 2021 03:45:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:4ed:8f53:adc7:b574])
 by smtp.googlemail.com with ESMTPSA id
 bb24sm14881555pjb.5.2021.03.29.03.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 03:45:29 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH] crypto: chelsio: fix incorrect kernel-doc comment syntax in
 file
Date: Mon, 29 Mar 2021 16:15:14 +0530
Message-Id: <20210329104514.16950-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: vinay.yadav@chelsio.com, linux-doc@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com, rohitm@chelsio.com,
 linux-crypto@vger.kernel.org, ayush.sawal@chelsio.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for drivers/crypto/chelsio/chcr_core.c follows this syntax, but
the content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
"warning: wrong kernel-doc identifier on line:
 * This file is part of the Chelsio T4/T5/T6 Ethernet driver for Linux."

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/crypto/chelsio/chcr_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/chelsio/chcr_core.c b/drivers/crypto/chelsio/chcr_core.c
index f91f9d762a45..f03ef4a23f96 100644
--- a/drivers/crypto/chelsio/chcr_core.c
+++ b/drivers/crypto/chelsio/chcr_core.c
@@ -1,4 +1,4 @@
-/**
+/*
  * This file is part of the Chelsio T4/T5/T6 Ethernet driver for Linux.
  *
  * Copyright (C) 2011-2016 Chelsio Communications.  All rights reserved.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
