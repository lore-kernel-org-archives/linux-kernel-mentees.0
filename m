Return-Path: <SRS0=YFfO=5F=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8696BC4332E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57F8820774
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Mar 2020 07:03:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBwAxwPc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57F8820774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5274B880F8;
	Fri, 20 Mar 2020 07:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fT3nlS-SMXFx; Fri, 20 Mar 2020 07:03:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF4D0880D2;
	Fri, 20 Mar 2020 07:03:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DEB39C089E;
	Fri, 20 Mar 2020 07:03:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B04C5C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A045D87447
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmSkYW3_kMxY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4FDAC87347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 07:03:02 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id b22so2602255pgb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Mar 2020 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LowBblvxuIcW1zcDuNk5uVX3z82/+a6o2QZfaKC6TiY=;
 b=iBwAxwPcdbyf6ajcTN+g33HlnFfAGf1IVU+lT+q4JxKP9ShbBPl+K4++6HY3Erwl7p
 sZyd3jvE2NmhkCiYd/Zylrybb0pm4ps1TNwVFxiTDElbKxVJs+LI6U1X7JFoIrRNDkrr
 ZZHDbUzfiO4ewhsdspjkujdjiar95qe/opKrgU2htDaTOhMwvNqWTXAioflBzG9voNDQ
 RKz9t9rZ+acsh5cFzLi/FbAL6qD4NKVrpAqd9z9/nIJ22YVFRZF0HIF/b4oEqYVFRDbO
 mS3cDJa6lZN8YTFqYP9YKAvRdyUn04gmrTVRSBsPKC8wvAJm3LELAtXe6aOYqsy2XGiW
 +tVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LowBblvxuIcW1zcDuNk5uVX3z82/+a6o2QZfaKC6TiY=;
 b=DzwA8GfGnjGrePaNvYdb1fogWN25XO2gt7O5+90wt74zZfM7CsR/GL3ESBuyyygcjh
 T0ZAjE2Qg5Ux94kX2BrcisO2kVN89+U2PhLEzmA8kEjVtcggoaoNeYvEwFYSlHt/1z1P
 w+YGNe/ZvS1R+Pr6HMifBm/5MKEfmC5R2JtYwDp7b9retxvgwlmNwka8I/rvMLu1SikK
 IiwnfIMlJg1590Xl67HoUsLe3ifDNhIkFgZX6c3wVHa/3xEqI9h+C+/lTsE92oYWVBo+
 pN+W63qmcd2sCZ6nDqjvg4s8NXHgQn0IMqXC/8lhJPren33XCXP/bTgOt/0EqlBKxQsr
 1lAA==
X-Gm-Message-State: ANhLgQ1VUWf0NuNekYsMdk+JWvnkkf1egm3EJWXB2cqz5lHOiAY+lMwD
 dpd5NU6o/m1KOYbzWvvhkIY=
X-Google-Smtp-Source: ADFU+vscuCjMSmCrUXt9CQjjIzhxXUv2VyUWI+xkbBYtoypv3vUsSP4WD8qiSKeMv5ZZ3BCNG2XsMQ==
X-Received: by 2002:aa7:9467:: with SMTP id t7mr8143156pfq.97.1584687781847;
 Fri, 20 Mar 2020 00:03:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:2190:a751:deeb:c09d:833a:659d])
 by smtp.gmail.com with ESMTPSA id l11sm3941232pjy.44.2020.03.20.00.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 00:03:01 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 20 Mar 2020 12:31:44 +0530
Message-Id: <20200320070157.4206-14-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
References: <20200320070157.4206-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 13/26] parsing_cocci: iso_pattern:
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
cases for these types in iso_pattern.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/iso_pattern.ml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/parsing_cocci/iso_pattern.ml b/parsing_cocci/iso_pattern.ml
index 5ceb2bdb..6d51b072 100644
--- a/parsing_cocci/iso_pattern.ml
+++ b/parsing_cocci/iso_pattern.ml
@@ -1818,6 +1818,11 @@ let instantiate bindings mv_bindings model =
                           Ast0.rewrap ty (
                             Ast0.FunctionPointer(
                               renamer ty', s0, s1, s2, s3, p, s4))
+                      | Ast0.ParenType(s0, ty', s1) ->
+                          Ast0.rewrap ty (Ast0.ParenType(s0, renamer ty', s1))
+                      | Ast0.FunctionType(ty', s0, s1, s2) ->
+                          Ast0.rewrap ty (
+                            Ast0.FunctionType(renamer ty', s0, s1, s2))
                       | Ast0.Array(ty', s0, e, s1) ->
                           Ast0.rewrap ty (Ast0.Array(renamer ty', s0, e, s1))
                       | Ast0.Signed(s, ty') ->
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
