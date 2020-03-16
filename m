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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB294C0044D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BF192051A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:04:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afnaxcBk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BF192051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D672685643;
	Mon, 16 Mar 2020 10:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0u5ZLmVV29n; Mon, 16 Mar 2020 10:04:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7FAC684FDD;
	Mon, 16 Mar 2020 10:04:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E4F8C1D7C;
	Mon, 16 Mar 2020 10:04:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95B5AC1D7C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D1A698561E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OEbWr_oMRpCa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D021C855C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:03:58 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id l36so8036050pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8WQLiIaOsmFjHM1HjEy2R4Nr4kZ1TGFicBFeXYCuWCQ=;
 b=afnaxcBkjsA/AOjz/U50ShMNgapRIdI+HYZrDUWFQ7Qogas1M3InMcqkFV8VRrakME
 Mi6HH7CyZ+TiR5FI6B4HNeBCaTz+kygWekZkkLCFquSQp8U7udIUnSBqWqgsU8g1/O6C
 HOIY7ljSobbHkTTdtQYWM0Thw8lR2zSxHW7786g473C9Y1vG8c81kz/b+Dl7hQHjvTyu
 FILCPwacor5MwdcK/ZcaoQ2ofmw6arwAE4I/YmxNphIvDfrqnatu4FI6Im3VEbbvO6Ph
 Q4voCH0H0i0VxxTUDrFaBeEGdnhrYCC0KR/yDtIhOiGZSMqrknsVksmvCOfXcl1SyZ85
 fEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8WQLiIaOsmFjHM1HjEy2R4Nr4kZ1TGFicBFeXYCuWCQ=;
 b=cR4Ll72LFlqqZnNsWmeU6e+ZarSPvE8RF+AKBmCZefNS/hZr28ePuAosM257s36avo
 W1A8fNN20NE51nsJETP3i4rxxtnMlnRzSLbeoHapIYYqA6A8inlUrTm0b3T4rIItn6N4
 nw6SginzsI2kEHzXmZPqMBWTgugmG+BSBPLtHbQ1iY3HeGxiIehVV8QjQM4OYoG0g6lT
 7QDA7aQpaUTvrD/i5YfDOawTfD2JVr0RWsvUGRzKPn+umRiaKgV/6JAGnwQuztMlCpnJ
 Ktq8/lVyhmu7Bv3czbzZTBYsC/u6q6qN7N8b5lA49g6zq9twwsf8SbGOhv4uORD3yqoJ
 zk2Q==
X-Gm-Message-State: ANhLgQ0nM5JVw854CM9Xi42beRr/fu586sy312h8uLQ7zuawLlnPoXIC
 CyguQogpssm6HlHjBuil2Q4=
X-Google-Smtp-Source: ADFU+vsWNKfLhdvdxKJG6Tv5vj7Jcs6ONcweaidYwQ3+171A2U2QfA5gn2V7k4ACe2cE9OXwNTTZ2Q==
X-Received: by 2002:a17:90a:a40f:: with SMTP id
 y15mr12719959pjp.143.1584353038359; 
 Mon, 16 Mar 2020 03:03:58 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:03:58 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:01 +0530
Message-Id: <20200316100319.27935-9-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 08/26] parsing_cocci: context_neg:
	Add cases for ParenType/FunctionType
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
cases for these types in context_neg.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/context_neg.ml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/parsing_cocci/context_neg.ml b/parsing_cocci/context_neg.ml
index 7bbf743d..b3a52daf 100644
--- a/parsing_cocci/context_neg.ml
+++ b/parsing_cocci/context_neg.ml
@@ -663,6 +663,10 @@ let equal_typeC t1 t2 =
       equal_mcode sign1 sign2
   | (Ast0.Pointer(_,star1),Ast0.Pointer(_,star2)) ->
       equal_mcode star1 star2
+  | (Ast0.ParenType(lp1,_,rp1),Ast0.ParenType(lp2,_,rp2)) ->
+      equal_mcode lp1 lp2 && equal_mcode rp1 rp2
+  | (Ast0.FunctionType(_,lp1,_,rp1),Ast0.FunctionType(_,lp2,_,rp2)) ->
+      equal_mcode lp1 lp2 && equal_mcode rp1 rp2
   | (Ast0.Array(_,lb1,_,rb1),Ast0.Array(_,lb2,_,rb2)) ->
       equal_mcode lb1 lb2 && equal_mcode rb1 rb2
   | (Ast0.Decimal(dec1,lp1,_,comma1,_,rp1),
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
