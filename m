Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9109C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BF4B206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ve/qNwEH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BF4B206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5E12486ADD;
	Sun, 31 May 2020 15:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HAWG0cmwbiP; Sun, 31 May 2020 15:27:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ACABE86B1C;
	Sun, 31 May 2020 15:27:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A180C0863;
	Sun, 31 May 2020 15:27:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49880C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 36D7185D7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEFty0qC9XNm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DA5B284AAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:51 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id q9so3798480pjm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hN5UMrIMc/AEejMUwh7GPIfCbUdAcykfbXxFZ6tUuUk=;
 b=ve/qNwEH6rWxmS/mbGMpgDw1GXhA7C/K68avE3ejPPZZLC20xlwW57OFGBr6UTRpk3
 msodZXgA0Yd5IvwCqYcrCxFeLPTXtBlvTzEANn4zo/eZkQoxvdsd3geKeSVdS7X1URkD
 gnK8uhgkfkMj+7taOeDCjADJD1lXhMJHBZ6y62Ci6VfbSQ9F+dnUsCBvRSHimv6QTavd
 mXGBdsSkwK7zdKHrId5cbpEjiET9QpGLSVqAdu982Us1jnq+fDG5D8KkZkMfJQojoDM9
 VyPTN5GhOD4REIols7CeFfcLUnsU1fKjr49ZlJhP6MtT/y4I5hbVMpwL90kLHy/3zk/l
 ZkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hN5UMrIMc/AEejMUwh7GPIfCbUdAcykfbXxFZ6tUuUk=;
 b=dekxNo75hsFOY7GD+sVGbwzZ7OiH2dDgNd9MRkw06kvVZLIidz+O/xBNGGmTbtqwMx
 H5zLXdKyHilT3NNQfkhsnWLIayXIcaY8UtCf1/XJe7dmlzT9yTrk5Y0h7aU7FTSuOh2V
 EaLP2jGrq8hovHO4jU78BQk8CREPM4ned2ByF1eSMC4ey4yZRKdPdNoAJ09Uc/1ZrqYP
 nyQrn3Shgq9O0iWrS3OSS2DcRMNIy+83lfV73BcvKERwRTFXc0DQSSINI/ELPQkeoEPK
 rtYhD8HnrH62MAHhxbXk9HNIrNKpB98GfO//RZF4pjn83bRJIQFzP1h34IFoBZ5gaqdv
 we7g==
X-Gm-Message-State: AOAM532x5E0od4s2sah5RNMtqK80BECcoDP+HU8TwSgPoh60L4yiUib6
 Gno+5+NP7aTIHrfYMLA3XmM=
X-Google-Smtp-Source: ABdhPJwyj243/tLLmRpOmBE/PHwN3wX7J5KwiACHvMJcHhr4gHBnceXpPctprjTWkaCmk3pgWOeNtw==
X-Received: by 2002:a17:902:b18b:: with SMTP id
 s11mr16219727plr.160.1590938871398; 
 Sun, 31 May 2020 08:27:51 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:51 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:09 +0530
Message-Id: <20200531152621.2886-16-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 15/27] parsing_cocci:
	pretty_print_cocci: Reflect struct end attributes
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

Struct end attributes are added to the SmPL AST. Print these changes in
pretty_print_cocci.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/pretty_print_cocci.ml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/pretty_print_cocci.ml b/parsing_cocci/pretty_print_cocci.ml
index e554a6df..aaea3f9d 100644
--- a/parsing_cocci/pretty_print_cocci.ml
+++ b/parsing_cocci/pretty_print_cocci.ml
@@ -580,7 +580,11 @@ and declaration d =
       close_box(); mcode print_string rp;
       print_string " "; mcode print_string eq;
       print_string " "; initialiser ini; mcode print_string sem
-  | Ast.TyDecl(ty,sem) -> fullType ty; mcode print_string sem
+  | Ast.TyDecl(ty,attr,sem) ->
+      fullType ty;
+      (if not (attr = []) then print_string " ");
+      print_between print_space (mcode print_string) attr;
+      mcode print_string sem
   | Ast.Typedef(stg,ty,id,sem) ->
       mcode print_string stg; print_string " ";
       print_named_type ty (fun _ -> typeC id);
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
