Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50930C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 May 2022 17:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 069B284128;
	Tue, 24 May 2022 17:28:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g6s3tuRLoNuL; Tue, 24 May 2022 17:28:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 29CF684125;
	Tue, 24 May 2022 17:28:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C7D8C0039;
	Tue, 24 May 2022 17:28:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6594C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 17:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C461415D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 17:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R5Pb5yWm1y4g
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 17:28:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC90C415CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 17:28:01 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id b5so9378917plx.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 May 2022 10:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TQSXOGBPTe2uw0qPjIIRPCO+MsJXruCMk2fBLAYYqXA=;
 b=SMLKrRvgc/KrH7nqdtcAGv/w6WVgHYGDMTNxXymT+PIT3qI9xE5xRuDvStKpTZbMXt
 zLx0qqGhh9+Xe0u49z7OgT/yzgZzmY/7hM3YveAoRyOyiPXVxyENFk012ZMHkgdO6iF4
 dclSnc56WA7bYzd6iCQrGr4sVbgqKdh2Mjf130eX4fsZuNq7X7RiwjlXJUoDIM2uQZAr
 8Hl7xzfeCJ/KE/pX2xXckAHsN01i2+4TTP7o28H+XBzQXC+/1xhSzJ/lmvBQwfgFiPH0
 +jtlFOfItgDT0bITZgkfDDJXiapu+Z1f6PLIbGnS0TDbauiK37mByB0WywIgAaSA1amA
 Sgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TQSXOGBPTe2uw0qPjIIRPCO+MsJXruCMk2fBLAYYqXA=;
 b=ery8cPkrrYO/rG3ktIDABC7nx2AJ94MBcbytE8F291VP8aDPRPrX/XG9mS4KrLGT0I
 3Mqdv15qJuzpXAFqZGniw2pCqND5AYL+5EgEJ0F5P6X5DgMW5DqHaqmoK8byJYuTkz1E
 3tACrUPFjUjP8duqUE1twKlUS2bRajZT27nQW6naCF/zIqoyOYX/iJWc7exWz6366kD1
 Q2wjxFpdZwYU/g2f1bTov+Zh99QsSvXekL2yDw9MUmuTrtsJHljIfC/C7GxsyIFouN1h
 b6YsgphYaBKMT9jvIhocj6SXWWj55zKzYDgQWWBOlDt1S1vlIQCHrBxYrPNzR1jckmit
 +6+A==
X-Gm-Message-State: AOAM533cbnrTcH+Lhs/dEyA36fP/5eLOfmYxcHuVzckSNxIZdR3m4k/i
 h9YL9h0dvITIliv0qXNdbpQ=
X-Google-Smtp-Source: ABdhPJxtyLUP5CjnATo5cBrld/MCmrqLC9oAQT9qim9Xt8yHRxK3xMyYy+Qp/XMm3N4d1auSj+NHOg==
X-Received: by 2002:a17:90b:1e4f:b0:1e0:b91:39ef with SMTP id
 pi15-20020a17090b1e4f00b001e00b9139efmr5532443pjb.51.1653413281244; 
 Tue, 24 May 2022 10:28:01 -0700 (PDT)
Received: from ubuntu.localdomain ([103.230.148.185])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a170902db1100b0016144a84c31sm7573894plx.119.2022.05.24.10.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 10:28:00 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: akpm@linux-foundation.org
Subject: [PATCH] include/linux/mm: Initialize an int variable to prevent
 returning garbage value
Date: Tue, 24 May 2022 10:27:55 -0700
Message-Id: <20220524172755.11892-1-gautammenghani201@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-mm@kvack.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Gautam Menghani <gautammenghani201@gmail.com>
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

Initialize the variable 'ret' to prevent garbage value from being
returned. This Fixes the clang scan warning: Undefined or garbage value
returned to caller [core.uninitialized.UndefReturn]
        return ret;

Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
---
 include/linux/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 9f44254af8ce..f437bd81d6a4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1700,7 +1700,7 @@ static inline int arch_make_page_accessible(struct page *page)
 #ifndef HAVE_ARCH_MAKE_FOLIO_ACCESSIBLE
 static inline int arch_make_folio_accessible(struct folio *folio)
 {
-	int ret;
+	int ret = 0;
 	long i, nr = folio_nr_pages(folio);
 
 	for (i = 0; i < nr; i++) {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
