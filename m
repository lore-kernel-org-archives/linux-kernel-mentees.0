Return-Path: <SRS0=NjJu=6L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8815DC7C8A0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E77C20656
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Apr 2020 12:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsxt4Vbv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E77C20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E25182067;
	Mon, 27 Apr 2020 12:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GPp5ucOdW1Jm; Mon, 27 Apr 2020 12:09:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1362384AB2;
	Mon, 27 Apr 2020 12:09:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F30EFC1D74;
	Mon, 27 Apr 2020 12:09:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12ABDC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0B74A85F51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLGVlH7v8-zq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 098D384C29
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 12:09:13 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 145so8900793pfw.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Apr 2020 05:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZyzlIWNwdkp9Rh6rKkpnyNaMorCGqrIfrYY1rTdq+DE=;
 b=jsxt4VbvC+H7KB+fFg0PHPvFz2RZWIW5bY9/LP+PsGCnt5CasL+zQ3nEafBePBes4n
 niy/9CLCiCxa/OQfzn+0XwqdrsHrhD0+m0rS2YmpMij8IOFB42gkYTxDG1GTo6dFI7zt
 +oGMUnUXKJqBAxnrK1yAoUizHoAa6vHrqAYx+DUo7R41kbqM2B/AWJ5qw8b3D3S3bxAa
 K/HXT1jiWnannVDBOvvoTWJJgFqcVoO6bE7c3W6PP0iL/9yhXe/MG1E7X79seCswIFnz
 CsCftxUgXhA0DmQWEn0j09dIs26MnnWY/R+big23xnmW2Tp7v2tUJmHP/EBcJf5gKJto
 mUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZyzlIWNwdkp9Rh6rKkpnyNaMorCGqrIfrYY1rTdq+DE=;
 b=YNROX3M9o3ustO5PRXKfW3c8sTQxUYTUBshG5zknq3KxVep9K3uHfWymwyMvLjJzGa
 83KaAT0gfWnWL1ezH7kmsSC7ASHua/7qrcaNRxpS/nYDPvpjjQKz5Qls6rIVSvZH73XN
 tD33v3UjXme5iVGVa+aC8pRDY8oIFLyPjvMQNzrziOvSNojIAY3CnJCLYl6mFGDNsoo6
 qJJoKoRIMHkztYqtXTeIDGSjzdBw3lOtsJQ3Psat6cGTv7ImQj2nQzc3Gt7eXyjRdtBz
 6g59asV+yQtIjJ2Vb5djQh/x8yzmpM29hv4BnDrdCisg6fYFkN76XlMKJffoBkSwcEXU
 z33w==
X-Gm-Message-State: AGi0PuYDkmUuCDgSldebnAthQpBsI1Jby1Dh1D3L971luPdb+xtHI2uX
 AddSxJYvDehQHy6SJlcVB3A=
X-Google-Smtp-Source: APiQypIknihnM7sHuHj8/UWNvDIKXC8pkdWAEYArmKla6sxpuQ49pOvT8Ziv2jRqo4QmvURsmp5WMA==
X-Received: by 2002:a63:b649:: with SMTP id v9mr20301582pgt.402.1587989352637; 
 Mon, 27 Apr 2020 05:09:12 -0700 (PDT)
Received: from localhost.localdomain ([1.38.220.114])
 by smtp.gmail.com with ESMTPSA id r17sm9623885pgn.35.2020.04.27.05.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 05:09:12 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 27 Apr 2020 17:38:18 +0530
Message-Id: <20200427120834.380-8-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
References: <20200427120834.380-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 07/23] parsing_cocci: context_neg:
	Reflect Parameter attributes
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

Parameter attributes are added to the SmPL AST. Reflect these changes in
context_neg.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/context_neg.ml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/parsing_cocci/context_neg.ml b/parsing_cocci/context_neg.ml
index dd768a61..98b96ac5 100644
--- a/parsing_cocci/context_neg.ml
+++ b/parsing_cocci/context_neg.ml
@@ -466,9 +466,11 @@ let classify is_minus all_marked table code =
   let param r k e =
     compute_result Ast0.param e
       (match Ast0.unwrap e with
-	Ast0.Param(ty,Some id) ->
+	Ast0.Param(ty,Some id,attr) ->
 	  (* needed for the same reason as in the Init and UnInit cases *)
-	  bind (r.VT0.combiner_rec_typeC ty) (r.VT0.combiner_rec_ident id)
+	  bind (r.VT0.combiner_rec_typeC ty)
+           (bind (r.VT0.combiner_rec_ident id)
+              (List.fold_right bind (List.map mcode attr) option_default))
       |	_ -> k e) in
 
   let typeC r k e =
@@ -839,8 +841,8 @@ let equal_initialiser i1 i2 =
 
 let equal_parameterTypeDef p1 p2 =
   match (Ast0.unwrap p1,Ast0.unwrap p2) with
-    (Ast0.VoidParam(_),Ast0.VoidParam(_)) -> true
-  | (Ast0.Param(_,_),Ast0.Param(_,_)) -> true
+    (Ast0.VoidParam(_,_),Ast0.VoidParam(_,_)) -> true
+  | (Ast0.Param(_,_,_),Ast0.Param(_,_,_)) -> true
   | (Ast0.MetaParam(name1,_,_),Ast0.MetaParam(name2,_,_))
   | (Ast0.MetaParamList(name1,_,_,_),Ast0.MetaParamList(name2,_,_,_)) ->
       equal_mcode name1 name2
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
