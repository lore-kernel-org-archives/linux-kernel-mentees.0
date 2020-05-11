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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B37C54E8D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AB922075E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMwi1ZUV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AB922075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 471B424C66;
	Mon, 11 May 2020 10:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RaFrIL4-JC05; Mon, 11 May 2020 10:14:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AC64B24C39;
	Mon, 11 May 2020 10:14:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B932C0176;
	Mon, 11 May 2020 10:14:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E11D3C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D0D7C889F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ONNftH5srGZi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7E286889B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:14:25 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g11so512164plp.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LiameRiyJLzWrc6OD69O6jqN0a7XU1kU6x01nq1+tvI=;
 b=bMwi1ZUVslR2u55Nk9yAXoKqJ4AdYGnG/lHKDET8XgXIXxSb3KNePb6cksxPM1yAH2
 miqWyjweb+RtWTrbBKJl+268nV6xbJEU452PiAJuwAuDv3it/zVkmC2mJiqrbR8v7VOl
 TgjxqYFstWVanzFdCVnwIFyZC5XRF/G7OEuaXrMLJ8MU9sMPMOkMS+uIqriNK3Cb6tvJ
 aJ7QzvuE7HIHUzgGVCBuroovM1BuNvAYTegUGtJOEW4WP0tfq+BSCFZDBH0dMRXn2FOJ
 Q0BYktb5YAVjGjvUIukj7sxfQknSNV03j5Bu8y4duERXY6ioUxs5p4hOyVI6FFgYQATz
 5rxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LiameRiyJLzWrc6OD69O6jqN0a7XU1kU6x01nq1+tvI=;
 b=IecQXDbw4uzoW/yvKEMvSDg5076aI0KkPsx5+fJy86XZk45DDcqVVLCaV8mQu7uo7a
 jtx9hscVQeUG/GNP4MlolJggDscwZtNuBRBXE3/368//Sh0iMz1Fnv2e1m6FnN9oZWUY
 wJBbc02Dc/znJ0I8RfdLg0OMG4o12SyOiEmNBy60q7jy2JdXl6EAFlI6nh885fRrHo8E
 eA9rPN71NGIEwdBlRjiChVl56U3TxxYFG/XUsilLtLc8iXFdy/wnBvS4dZ00fs1mvS+Y
 ejQBduilXZzvsacC4oiyxMhaU5gj4YCeBfycjrN2xgie5vDI4E06VhsQbeeMRbfBDTw4
 D6tQ==
X-Gm-Message-State: AGi0Puaky9mjgbaQaHxD+2nDW0dF7wf8/9W/0adfSQRp5sUkMl0ZMEYX
 xum0kTS/p8iKRCXIwBhhD/4=
X-Google-Smtp-Source: APiQypJXvGkQpAzb1FtNR+vS1aQ2Sgaq1TcUZhK1oGM5TQmK/LH3x/UP9Euqeas24pZam+CZiUbzgw==
X-Received: by 2002:a17:90a:216b:: with SMTP id
 a98mr20981013pje.235.1589192065055; 
 Mon, 11 May 2020 03:14:25 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 j14sm10021121pjm.27.2020.05.11.03.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:14:24 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:42:55 +0530
Message-Id: <20200511101300.11101-19-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
References: <20200511101300.11101-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 18/23] parsing_cocci:
	pretty_print_cocci: Reflect Parameter attributes
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

Parameter attributes are added to the SmPL AST. Print these attributes
correctly in pretty_print_cocci.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/pretty_print_cocci.ml | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/parsing_cocci/pretty_print_cocci.ml b/parsing_cocci/pretty_print_cocci.ml
index 7628882b..a9eb4a8b 100644
--- a/parsing_cocci/pretty_print_cocci.ml
+++ b/parsing_cocci/pretty_print_cocci.ml
@@ -688,9 +688,18 @@ and designator = function
 
 and parameterTypeDef p =
   match Ast.unwrap p with
-    Ast.VoidParam(ty) -> fullType ty
-  | Ast.Param(ty,Some id) -> print_named_type ty (fun _ -> ident id);
-  | Ast.Param(ty,None) -> fullType ty
+    Ast.VoidParam(ty,attr) ->
+      fullType ty;
+      (if not (attr = []) then print_string " ");
+      print_between print_space (mcode print_string) attr
+  | Ast.Param(ty,Some id,attr) ->
+      print_named_type ty (fun _ -> ident id);
+      (if not (attr = []) then print_string " ");
+      print_between print_space (mcode print_string) attr
+  | Ast.Param(ty,None,attr) ->
+      fullType ty;
+      (if not (attr = []) then print_string " ");
+      print_between print_space (mcode print_string) attr
   | Ast.MetaParam(name,_,_,_) -> mcode print_meta name
   | Ast.MetaParamList(name,_,_,_,_) -> mcode print_meta name
   | Ast.PComma(cm) -> mcode print_string cm; print_space()
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
