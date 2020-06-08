Return-Path: <SRS0=Jgkt=7V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8592C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Jun 2020 12:20:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC3432076A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  8 Jun 2020 12:20:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmyXdexq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC3432076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 90AB38807B;
	Mon,  8 Jun 2020 12:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kBMRS6-uarXx; Mon,  8 Jun 2020 12:20:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 217128803E;
	Mon,  8 Jun 2020 12:20:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D8B7C07FF;
	Mon,  8 Jun 2020 12:20:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C00FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3BA5086DC5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id imSLjVuX8vU0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:20:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C6ED286DB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jun 2020 12:20:56 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id b16so8453741pfi.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 08 Jun 2020 05:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L/H5sSIkBx5Y4W3AtTFGNRoAgrU9OF5ws+/F7pPa0MY=;
 b=cmyXdexqZt9rkg0j348JxK4c4A5fyAA61j+DDlsRKm8yxsOtiP4Df3aKSgWpgLaIJ6
 5L5lBlsbeVPqP7KpB8GNeNUiH2BVeD79DL2cv5B+bF+sO9IQJf/SKI/99Kkl+1Xcq99D
 5XFHtX/UOca1elJYr/FQbKvlPWBsCB9b3gsMcdvCSgaRKZ5gbLn+x+nfI4ERs2RC0SrC
 94T06KQNI84ujuJ5gelkyX7Ukm/B3Fl/YBNoSc7Vo+p6A02psGyJUgjfMQ8MwrOwFmGK
 C4EbDXAY0LGKaxBaBC+jw5NEvtfSj9QSdGlf9ydiM8qsCdVecN07mvo6lADhjFsSG3Iy
 roiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L/H5sSIkBx5Y4W3AtTFGNRoAgrU9OF5ws+/F7pPa0MY=;
 b=DMbXo2U9ZSdecHJdFqO/w5lnregSiENsteuu4orsZxdiXanSUh1Xwj1sFg5vYQoh71
 rJLbDcF80cTOXMzPv35QhTdYWcCt7CiS1vnTUZLnK550PXoXuHuJXGHUO8XDr8Y3sbBN
 +zRe9FJmiSKfJtmXV2SizJ4GoG4HAHA8rBX54GSWGqQdNRkQyN/085fiALZtMOzE3/H/
 3J5BAfIRIvebQ8tVzSwAwdgef7yGxwt5+TIuYNASPW+C9Dmcw6d8KONnvZUhf40gjkXp
 KV0DUFNMT6H4Iqtfs6hAFVMZxWn5KbD0IyXDKGssBHR647RXSqx+ZLdZXCcLunw3U2GZ
 jTcQ==
X-Gm-Message-State: AOAM532pznavxD9ibMvd4lu9RNRv2BO9AhJed3Gp2h/mCFPZMuvzrg1o
 JFIgYTbcAvO+rJ7Hrrbmt2s=
X-Google-Smtp-Source: ABdhPJzBKegCFSi+SBUtxlKSLwIAm2M5WoebWgD0fHEa/GhC3iQVspBYLehR8VsQIJJP1HxRYEQixg==
X-Received: by 2002:a63:36ca:: with SMTP id
 d193mr19752761pga.253.1591618856364; 
 Mon, 08 Jun 2020 05:20:56 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:3a80:1863:7add:d8e9:7114:e8b0:51a9])
 by smtp.gmail.com with ESMTPSA id i5sm15747657pjd.23.2020.06.08.05.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 05:20:55 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon,  8 Jun 2020 17:50:35 +0530
Message-Id: <20200608122037.28019-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200608122037.28019-1-jaskaransingh7654321@gmail.com>
References: <20200608122037.28019-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/4] parsing_c: parser: Use
	end_attributes_opt in decl2
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

The decl2 rule has redundant code caused by additional productions for
end attributes. Use end_attributes_opt to resolve this.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index 78407844..ebb3b327 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1560,18 +1560,7 @@ abstract_declaratort:
 /*(*************************************************************************)*/
 
 decl2:
- | decl_spec TPtVirg
-     { function local ->
-       let (returnType,storage) = fixDeclSpecForDecl (snd $1) in
-       let iistart = Ast_c.fakeInfo () in
-       DeclList ([{v_namei = None; v_type = returnType;
-                   v_storage = unwrap storage; v_local = local;
-                   v_attr = fst $1; v_endattr = Ast_c.noattr;
-                   v_type_bis = ref None;
-                },[]],
-                ($2::iistart::snd storage))
-     }
- | decl_spec end_attributes TPtVirg
+ | decl_spec end_attributes_opt TPtVirg
      { function local ->
        let (returnType,storage) = fixDeclSpecForDecl (snd $1) in
        let iistart = Ast_c.fakeInfo () in
@@ -1605,18 +1594,7 @@ decl2:
      }
  /*(* cppext: *)*/
 
- | storage_const_opt TMacroDecl TOPar argument_list TCPar TPtVirg
-     { function _ ->
-       match $1 with
-	 Some (sto,stoii) ->
-	   MacroDecl
-             ((sto, fst $2, $4, [], true),
-              (snd $2::$3::$5::$6::fakeInfo()::stoii))
-       | None ->
-	   MacroDecl
-             ((NoSto, fst $2, $4, [], true), [snd $2;$3;$5;$6;fakeInfo()]) }
-
- | storage_const_opt TMacroDecl TOPar argument_list TCPar end_attributes
+ | storage_const_opt TMacroDecl TOPar argument_list TCPar end_attributes_opt
    TPtVirg
      { function _ ->
        match $1 with
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
