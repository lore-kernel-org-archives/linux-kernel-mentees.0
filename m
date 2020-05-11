Return-Path: <SRS0=cT8e=6Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1C2C54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E2A92080C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXkJAxER"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E2A92080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BE5FA24A2C;
	Mon, 11 May 2020 10:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1reehHI6cEl9; Mon, 11 May 2020 10:09:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A822C2050E;
	Mon, 11 May 2020 10:09:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 975C6C0890;
	Mon, 11 May 2020 10:09:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BCD5C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D3D3924A2C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xsc5B4WKgtia
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 40E922050E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:08:59 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id u35so1363652pgk.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qMGzGQX4xag0BRPp1FUVQwszM0e/kjVDxxhuMsIg5uE=;
 b=hXkJAxER6S0X0GoCUgTSoGKfmtVu4ERRxlbVkVhbtGlesY+4ILqR4NRD+vRUZGa9B3
 nBoJC00SSjCpD/1Nn8XZlqf9wqmUNB7N9e/PHK71VD/J11+S7kEtrDFG9ckWHeuAaRA+
 I7bQQWa1EEqu0FCuCJEKum+j9ucUzrHdhBXXaLkQxd5RRw0sYIV5wCbICGFdKgm3e5JP
 ZpP8PKMI4GoUzi3QixZ8y69asYpE4ooMdOVm3erOHYq/9Pht+ywaBZgWaXGzHW5T7aEi
 9pL/qaRkWD99ufu8soGpDva9UsLi70gNopppRADjyCbplYO2XVpPx8ygtpyy3ud0aU30
 kB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qMGzGQX4xag0BRPp1FUVQwszM0e/kjVDxxhuMsIg5uE=;
 b=ffbYH/u1uEF39mzlmvitrJIQucEb47Gkf21B/Rdtu08EOaQWt5eixyMT6QtHFXCnqB
 wXrAA3dCF0AqZiiSUglmKwgfgBpU/Ngsa9M6lF8r1Av4H92hA4q4WIOXQdzJsxpup2Is
 sonnuv3HTjl1KhqoI2psmBdBUjqlTKV39ed+ri6TaI2U/rGnAW70dPKpvbp77fWsvy5Q
 /frSBohojVtBC6AGeXjGXElNzY/EFZRI+F29GU8N/4tnCstkEfjc/klZvpI1g5+74J7o
 HjpFCGlLd0kRhBDvPB1Ob3qjNtODT4fmzzMRhAFwcrtzSAD1sUH8zB8wXyTvIF6aTryJ
 ARtQ==
X-Gm-Message-State: AGi0PuagKAVxUgAl9BLC/JI24VjqLubGuXKnMflD6653j4sL3V95EvNw
 uh4uzS38/f5q6Jn6Gbdq8a8=
X-Google-Smtp-Source: APiQypK5gKBfqdTGy8es+OZDKuBQCvc+0gppK4pUX9rchUKUN5VVrQysfMn+3rg/Jv5i/p89cDZHJA==
X-Received: by 2002:a63:ed08:: with SMTP id d8mr13756991pgi.309.1589191738814; 
 Mon, 11 May 2020 03:08:58 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:08:58 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:04 +0530
Message-Id: <20200511100715.19819-22-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 21/32] parsing_c: parser: Parse
	Cast attributes
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

Cast attributes are added to the C AST. Parse cast attributes in the C
parser and place them in the C AST. The attributes are taken from the
type_name rule of the C parser.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 34d234d2..ccdfd7f6 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -818,7 +818,8 @@ arith_expr:
 
 cast_expr:
  | unary_expr                        { $1 }
- | topar2 type_name tcpar2 cast_expr { mk_e(Cast (snd $2, $4)) [$1;$3] }
+ | topar2 type_name tcpar2 cast_expr
+   { mk_e(Cast (snd $2, fst $2, $4)) [$1;$3] }
 /*
 It could be useful to have the following, but there is no place for the
 attribute in the AST.
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
