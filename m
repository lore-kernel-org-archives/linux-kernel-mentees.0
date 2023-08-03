Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBBFEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Aug 2023 05:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0610E40186;
	Thu,  3 Aug 2023 05:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0610E40186
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HwxzMl+w
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOxUydQ7uuBJ; Thu,  3 Aug 2023 05:23:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EA7F14173A;
	Thu,  3 Aug 2023 05:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA7F14173A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAFD7C0071;
	Thu,  3 Aug 2023 05:23:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D401EC0DD5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 05:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB1BA612E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 05:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB1BA612E6
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=HwxzMl+w
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkSXVD2Vff2W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 05:23:05 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3A73612CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 05:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A73612CC
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bbc06f830aso4204625ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Aug 2023 22:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691040185; x=1691644985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MXIhTH4M1QfnWESXrTrS5OHE7UjCglH9VtTwSN6zscc=;
 b=HwxzMl+wA0Bf2wi/690ta495YBBxXP0GhF0h7xQk2w4Lm/di2l8qg/0xFduo3i7aSQ
 PUPEaIXjoJcfQBlFcG38RMMuxqxIVW5DiCb2Ka+QW7XQzPdI/bsHRYwsOtEgJd0Qh8Nm
 s362XGFzp37IeLafMfH+C5rAXhN75wdDEsZMkNV4dI2QOErMFDYx2b/t8CJoj+f3NEkZ
 BIV3sDtu9ApoeAy92QkEDbQEpwORcfLpx8E/GREnYj8LbbmKjKL8BCCd5eqA73N1gD2K
 K/PrgjGFKw7wZEsHDJwzq+KIJsf3l136C5GheKJ8Po0Huddn9ZF4LurtMZzpSnYysQuO
 xboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691040185; x=1691644985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MXIhTH4M1QfnWESXrTrS5OHE7UjCglH9VtTwSN6zscc=;
 b=FNLy5Mwz3l1VtQwGgfV3NfY/tjA7b8b4q3j/o6l1NWrvzPxGahgdyjJ1koObK9u0zm
 +HV0bKSe4w2UW43UOP2worNiUwqQzebglEabMNcipI7bCgMfI1GoJg6kdvi3TaMq6dD4
 Lft9u6nJI7niOCxtNY/gd+YeYzpgatSdwMqzt6mKVlF09DmoGUpLB+9EjNZKmWtyzUGl
 KRN+W2xiXWOAZE2Xl0+2jjOeWPw5wAj3WAWmmAvLkylERWLCHOHU8X81OSQ7kAONSnCy
 vXHBBWaPhy66ZZ4f8lr7u/TJUWc+QbrPPc1N09la624f8vUv2OSy1y7yagcVtq2ks9mC
 thJQ==
X-Gm-Message-State: ABy/qLYbTSAt0SYNAQSOX5HMvae0QEFWAqblY/DRkZF+HYy/MZ1yO8Pb
 aQF9624mlU5BZXY7wMIIejw=
X-Google-Smtp-Source: APBJJlF9wm1yurI+g7oDgrt2/7/NvEcy+amzXkCKdfxcvUNFZ+Nwr2JBHOU62pHe3mu+3hp+VK/xJg==
X-Received: by 2002:a17:903:11c9:b0:1b9:d38d:f08d with SMTP id
 q9-20020a17090311c900b001b9d38df08dmr21977880plh.18.1691040185185; 
 Wed, 02 Aug 2023 22:23:05 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:c7db:43fb:24e4:2bcf])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a170902bf4900b001bb988ac243sm13266685pls.297.2023.08.02.22.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 22:23:04 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: aspriel@gmail.com
Subject: [PATCH v2] brcmfmac: replace one-element array with flexible-array
 member
Date: Wed,  2 Aug 2023 22:22:38 -0700
Message-Id: <20230803052238.12147-2-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803052238.12147-1-rauji.raut@gmail.com>
References: <20230803052238.12147-1-rauji.raut@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, kvalo@kernel.org,
 linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 franky.lin@broadcom.com
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

One-element arrays are obsolete, and flexible
array members have taken their place. So, in
struct cca_stats_n_flags, replace the one-element
array with a flexible-array member.

This fixes warnings such as:
./drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:119:6-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index de8a2e27f49c..fff32e54833d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -116,7 +116,7 @@ struct brcmf_dump_survey {
 struct cca_stats_n_flags {
 	u32 msrmnt_time; /* Time for Measurement (msec) */
 	u32 msrmnt_done; /* flag set when measurement complete */
-	char buf[1];
+	char buf[];
 };
 
 struct cca_msrmnt_query {
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
