Return-Path: <SRS0=1bif=5B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C30C3F2CE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44BA62071C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rl52bgYG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44BA62071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7451A29CAB;
	Mon, 16 Mar 2020 10:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LX3VOiS7d9lx; Mon, 16 Mar 2020 10:04:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9258F29167;
	Mon, 16 Mar 2020 10:04:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E08BC1D8A;
	Mon, 16 Mar 2020 10:04:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 932A6C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 43FFB8560C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AqFJKyiWWay4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 00529855C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:55 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id ng8so1050066pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kBHYkDGQlRSJMHZTompYxXUA2EEsAkfNRX4sdP02jHM=;
 b=Rl52bgYGwj6fvBrSOvMK/9sZMWhY1fMQrRKBX39UtLFBN9iJnwkULzkY3leHDJ+jo+
 X11fgWNsT2Y4WxlEYla7JoQrHCMY3wHQGuS2YeTHWaYDeZ17e1TdlqhTaFuKTciGSQ+W
 wfdzdOpTuuE4VTkRZ1urcfvnptjWe1RUEIWj8M9KHjPZnTva9UL3KQ8MfkrxDxpJk2Gx
 AgDnYJbtsJprAR1SPeyuoeiZLckFKzqVSP4zHM235C4+Dahk4DuQ0+cIvdyt8ljsCYVq
 vKT/qQRNJUM9zr3QWdPpS+M0/nUbxEuqg8gib53VNvrvVy62DiBpkd8PPvjDR3ofzW/W
 NCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kBHYkDGQlRSJMHZTompYxXUA2EEsAkfNRX4sdP02jHM=;
 b=mcxwkNJp7AZEy2tuQ8My9LvfCaBeL7t+0SX2SYM1Q+kuwglUyFJDPxUohhGAJ+Rem1
 yDNs2kY0oTuiZJ7n/wbIDCnCEKXIT9cKw0UITdK6eG/SPTtqa6tUfjiSDLlDi3jqnN8l
 Lzp1T4SzTKXGpGGQi2lfCqjvWKae9OKqGDQqXc+M16ePu/n3oAnycNHPZWsRInL8lDcZ
 pTt990bnjku4GRmaq+9E8R/wv4ffsmLoKEQ78rI2CXeDqBosZrejM52anqKYX1U7YVWI
 iPOxmzAEOeXRjqcNz82Bamo6EoZL/iQ3ncnBHCIbphBndS7PnT0ATfoQpZmoukqR1hPY
 wdPQ==
X-Gm-Message-State: ANhLgQ1A9jCaI88Je5iEej07PztwVbKsSXcDvMmy9KpECgltrnKQhie1
 FMUCqdaGuf3rqRIH980IpqI=
X-Google-Smtp-Source: ADFU+vs+yTHAdIO8jA4GylbcYLWqTZxNTloNahGOTNyLK6tC8BQlUvraetcK/whtg9rOSqselypbOA==
X-Received: by 2002:a17:902:8303:: with SMTP id
 bd3mr26653199plb.171.1584353035475; 
 Mon, 16 Mar 2020 03:03:55 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:03:55 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:00 +0530
Message-Id: <20200316100319.27935-8-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 07/26] parsing_cocci: index: Add
	cases for ParenType/FunctionType
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

ParenType and FunctionType are now added to the SmPL ASTs. Add
cases for these types in index.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/index.ml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/parsing_cocci/index.ml b/parsing_cocci/index.ml
index a1103503..5c91f620 100644
--- a/parsing_cocci/index.ml
+++ b/parsing_cocci/index.ml
@@ -93,6 +93,8 @@ let typeC t =
   | Ast0.Signed(sign,ty) -> [129]
   | Ast0.Pointer(ty,star) -> [49]
   | Ast0.FunctionPointer(ty,lp1,star,rp1,lp2,params,rp2) -> [131]
+  | Ast0.ParenType(lp,ty,rp) -> [138]
+  | Ast0.FunctionType(ty,lp,params,rp) -> [139]
   | Ast0.Array(ty,lb,size,rb) -> [50]
   | Ast0.Decimal(dec,lp,length,comma,precision_opt,rp) -> [160]
   | Ast0.EnumName(kind,name) -> [146]
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
