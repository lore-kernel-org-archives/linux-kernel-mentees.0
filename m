Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A450C83000
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:04:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FC4520757
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 17:04:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4V2iqEf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FC4520757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 426EF22854;
	Tue, 28 Apr 2020 17:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NEZEpw5FHPK; Tue, 28 Apr 2020 17:04:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B538F20436;
	Tue, 28 Apr 2020 17:04:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A22DAC0864;
	Tue, 28 Apr 2020 17:04:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 473E9C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4465786542
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NGknO6Xj_NeS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6550D864EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 17:04:22 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id hi11so1451689pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 10:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DpFBF9X03e6oLDFxlRK6sDsGiwnDHFexEKHASlqXDt4=;
 b=W4V2iqEfZGi8nIbsEVO6eA0m8gs3Y/czYMCeIy66SPM5BshuVzH1+kiRXy4Y66UfCP
 xJoHIFAZYRAcUShMMbXMkSfAQ12/FoNXJqpte6sP8sTvyPVyLCrrnmhn14glzBKCQcAw
 jxy/TErog5alAXLy5LCJEky+3EGGnUcadOEMLgyytX+JMEKnNdQJ+Yg0RRBlLY1yXJo6
 wy2/UVR9mA454AncM9FTvwDU4DMKwPJ1MsmE7TOr/DMtXUlX0xfjzryH0vpk4Fw/MQBJ
 WUZ2UM0jGpz3Q5GSRaerzXtmbShSItqJktqfHlOkfWyJPrTF6nsxkciIrUcUnUCOqlGX
 s0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DpFBF9X03e6oLDFxlRK6sDsGiwnDHFexEKHASlqXDt4=;
 b=D5WiMmm8CvdF3JOVMGMAbaNA/nqVDVaJhx42ZAUbXlsJCk8Ig+fb7P47g2ap9AEayb
 OcBNW2fcwlOQXB9rVuQOLG7oY86uyVtayWUt1jw8W9aegD7fzCx98b0IldBMmf0NHbBv
 prOuV50+bU7lczABSyRuva3WrHem92Sr0gdf7+7gQGfJeNBO99hqta7qILzv7o6IAYTu
 mSUSXtwaLycEeaAsD45e49nSEbUV+eiS/ctKc4AJD5DzPCQkKZ4Vhc6JojSZ2eDkrd1h
 Fq61LrUcNcqStMIRv6+daaOVMsUl9TnmHJwQmeQF1ep9RPWgLXY/U8D3ZUJMSuvys+VS
 LckA==
X-Gm-Message-State: AGi0PuZbBycRTydpj9KlXZMWXXezuoU8r3dSbVdvlcuPQdKnsxT+n2Uk
 C6SJbAmZCahSctwpBDq0CkA=
X-Google-Smtp-Source: APiQypLBXNc6EWkIc+oqGccL0HKbLJ+N8c8adDl7gSiIJ4KsMVlq0R8VTJ+ZqXu2x9sCoe2JiRgZpw==
X-Received: by 2002:a17:90b:1993:: with SMTP id
 mv19mr6083674pjb.88.1588093461974; 
 Tue, 28 Apr 2020 10:04:21 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.163])
 by smtp.gmail.com with ESMTPSA id u15sm2505097pjm.47.2020.04.28.10.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 10:04:21 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 28 Apr 2020 22:32:17 +0530
Message-Id: <20200428170228.7002-22-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
References: <20200428170228.7002-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 21/32] parsing_c: parser: Parse Cast
	attributes
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
index 0abcc9b0..9e640ba5 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -818,7 +818,8 @@ arith_expr:
 
 cast_expr:
  | unary_expr                        { $1 }
- | topar2 type_name tcpar2 cast_expr { mk_e(Cast (snd $2, $4)) [$1;$3] }
+ | topar2 type_name tcpar2 cast_expr
+   { mk_e(Cast (snd $2, $4, fst $2)) [$1;$3] }
 /*
 It could be useful to have the following, but there is no place for the
 attribute in the AST.
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
