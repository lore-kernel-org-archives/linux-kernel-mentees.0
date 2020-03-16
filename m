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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25C5C4CECE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:05:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B70EB20663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:05:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5YCpgLL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B70EB20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9825989A56;
	Mon, 16 Mar 2020 10:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ONXcVuxjGmD; Mon, 16 Mar 2020 10:04:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7896A89A85;
	Mon, 16 Mar 2020 10:04:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68198C1D7C;
	Mon, 16 Mar 2020 10:04:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E85FFC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D0147220A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1dJ7mkj0cBx3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 9FBFE20134
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:04:57 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id w12so7760273pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eY8uN9ZiTYVXH+rnlUtslQcR4wVjV9QbTbMABZr/Vwo=;
 b=P5YCpgLLSVs9G7DFYDU5cL7nVXpQfT+R91wwzHmNT6IKHtgl534g696OxN/zqaGa9j
 G/idX1Cz3GmuMJPr/SrW4kC5wit2YFY6TmwXLVpT5myRtPMX1PQxKG1eknVjr2EVu16w
 TKYrxEIQnmayiNZB4jjjzTQRsTkz0iAqtBBGRN8iILs/WEFqbwZmKo+xImrqyGgOkfyl
 cLZU/uYqxpwkE1JyFbHyKAiGb0f48zDMlumusZmld/p2tcAPUP7qytttICgLBYynu7dP
 OKazk8cFkwH5XCYGE4NnRgx9ScrP/UM8sjLUxZyK5K23jAU8NCCZQRYPxNVIoMa5gejH
 Z6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eY8uN9ZiTYVXH+rnlUtslQcR4wVjV9QbTbMABZr/Vwo=;
 b=cUkCkSpARPa0nZPrmwWVqX8ZYuBjzy3LjJo0CMUvs8/VYbi/5DbAy4uNDIDUzPa5jz
 KaEKl0CUPRZr4T3xZ0ed3ibPnbGokb/8Tk71aMs0x1ofSYDN9SAu1xNfvAlrpPIzI4/p
 Bjhth4YeWUPXv1P6TolGR1xdwo5qMumi/E+n6toAmYeunsyIPcrqqrj4jzi1Jaf6cdKn
 4iy+gCpKYgPGQX4sXr6nNhe3YtWWPTALyhbC6XbPBeWlqusSpbzc4/R4ThjKLclmdsZo
 ZA2H797D2Q+73TbbOEY1jgYr01rF3eciUUn+jGATHJGsciCAynSqSBJ3HIfgieRyDdLR
 f31g==
X-Gm-Message-State: ANhLgQ07knIwnF8S43rT7xtkqmFCbHQluONW73KbH3qRsThByFMdv8mp
 wylW8xKEAJSX9j+HRN1ntwWav5nQ
X-Google-Smtp-Source: ADFU+vvT4Vmpd/OMW6ATeRCvA3hzjngeibW3R6WSp8G6wnt+DzBLOhSfoshEl0+xvuPM6tYvkmCx9g==
X-Received: by 2002:a17:902:8303:: with SMTP id
 bd3mr26657731plb.171.1584353097172; 
 Mon, 16 Mar 2020 03:04:57 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:04:56 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:17 +0530
Message-Id: <20200316100319.27935-25-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 24/26] tools: spgen: Add cases for
	ParenType/FunctionType
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
cases for these types in position_generator.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tools/spgen/source/position_generator.ml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/spgen/source/position_generator.ml b/tools/spgen/source/position_generator.ml
index 31d6cb5e..2fa630fb 100644
--- a/tools/spgen/source/position_generator.ml
+++ b/tools/spgen/source/position_generator.ml
@@ -195,6 +195,12 @@ let rec type_pos t snp
   | Ast0.FunctionPointer(t,lp,star,rp,lp2,params,rp2) ->
       let constructor ~mc = Ast0.FunctionPointer(t,lp,star,rp,lp2,params,mc) in
       mcode_wrap ~mc:rp2 ~constructor snp
+  | Ast0.ParenType(lp,t,rp) ->
+      let constructor ~mc = Ast0.ParenType(lp,t,rp) in
+      mcode_wrap ~mc:rp ~constructor snp
+  | Ast0.FunctionType(t,lp,params,rp) ->
+      let constructor ~mc = Ast0.FunctionType(t,lp,params,rp) in
+      mcode_wrap ~mc:rp ~constructor snp
   | Ast0.Array(t,lb,expr,rb) ->
       let constructor ~mc = Ast0.Array(t,lb,expr,mc) in
       mcode_wrap ~mc:rb ~constructor snp
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
