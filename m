Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620D7C001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Aug 2023 05:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD7E612C2;
	Thu,  3 Aug 2023 05:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBD7E612C2
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=MNyoiRAb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8I7tLjnvDV1; Thu,  3 Aug 2023 05:23:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CB92B612CC;
	Thu,  3 Aug 2023 05:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB92B612CC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A78CFC0071;
	Thu,  3 Aug 2023 05:23:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F420FC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 05:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9B1F4173A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 05:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9B1F4173A
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MNyoiRAb
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1gjUNPhTKpTi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 05:23:05 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 095D2404F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Aug 2023 05:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 095D2404F1
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-686f19b6dd2so370394b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Aug 2023 22:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691040184; x=1691644984;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RoLht6Nj+QdoUfDoHkYrw79LiGPXCNEAvhbkzzXglIs=;
 b=MNyoiRAbJmQfGdpgpLQgEjR657sskbGl1I/vQps+Yty+Zu8vTloO+twdKugdJ4iv4j
 Ai7nUlQG6ebDpYRtcb4sSNXDsbw019wUb6aQfu1nHYhdfH/rCk8Ovr5J5aHpjD3BaPl1
 jbicGWUnQ3frnU/pE7YK6rCeKjo89UsPLJa63Q364P2Hvc+OlDiLssn1LRc2uQ9BuIAe
 9QLd9Ti7pDpl+E+j2NQhHLS+6A+gL0XFaPDhf+pVB5HHMP56eiqcou425YTdvZf2ewIY
 697a2ynUxQcgsfTOKYSeIeiZh79Z3d/wVnOWWMUOkG/KzqrGYAbAFmKoOWVkfA/ciGUN
 rmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691040184; x=1691644984;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RoLht6Nj+QdoUfDoHkYrw79LiGPXCNEAvhbkzzXglIs=;
 b=KGNGbx1DB0lb05DIXtJL9G/nyUnU0SKWwq4HmspJQIjBZvhd5r8xt+Q/n2ZaQOXusD
 zuYKoVC7ZWV+mZCtgqxBgX3E9gkcdsZpiAKMslzwKRXZAuIK1/cAYa47JV0j7zOkIPEY
 XxqdhDdcohNNcu7RFAFAyr74VoG/QH020ty4fGntQav8pMSp5N0+lkt4DoZAhMKhtpI1
 NGdNnySQLx1UHRRSIQjIN6HhlIHXBM8nTWjzNSTCSoBsgIfeFLAOoYp5lSWkL6PLtOot
 8jvtnL2U4G6FIA6l2F0CdR+kQqcw7a4469YfJg77oVRPdGWM6QNaJDxMvUTRlxw8C9PV
 GZag==
X-Gm-Message-State: ABy/qLahn1LLePn0MFaUni7f4RVPzLgF5VLum20GJ98jg2fvYzB6vVtC
 PrbvDnGOm4jOcX90Iyzm+GCu7qdDM2TZ2L+T
X-Google-Smtp-Source: APBJJlEgPXz/r9TdTphuTp817soe3ze+zaNp4Ct7yWmTZmnI9QFxXOmXI65huZjRwldDAB2P565GRQ==
X-Received: by 2002:a05:6a20:3caa:b0:13e:9451:53ee with SMTP id
 b42-20020a056a203caa00b0013e945153eemr5188313pzj.38.1691040184137; 
 Wed, 02 Aug 2023 22:23:04 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:c7db:43fb:24e4:2bcf])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a170902bf4900b001bb988ac243sm13266685pls.297.2023.08.02.22.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 22:23:03 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: aspriel@gmail.com
Subject: [PATCH] brcmfmac: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
Date: Wed,  2 Aug 2023 22:22:37 -0700
Message-Id: <20230803052238.12147-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Replacing zero-length arrays with C99 flexible-array members
because they are deprecated.
Use the new DECLARE_FLEX_ARRAY() auxiliary macro instead of defining
a zero-length array.

This fixes warnings such as:
./drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:119:6-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index de8a2e27f49c..983946b146b3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -116,7 +116,7 @@ struct brcmf_dump_survey {
 struct cca_stats_n_flags {
 	u32 msrmnt_time; /* Time for Measurement (msec) */
 	u32 msrmnt_done; /* flag set when measurement complete */
-	char buf[1];
+	DECLARE_FLEX_ARRAY(char, buf);
 };
 
 struct cca_msrmnt_query {
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
