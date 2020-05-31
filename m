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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E2DC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CABA5206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLcPYUS6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CABA5206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B053286ADD;
	Sun, 31 May 2020 15:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHF+bnPBPwPR; Sun, 31 May 2020 15:28:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5915186B05;
	Sun, 31 May 2020 15:28:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4919CC0863;
	Sun, 31 May 2020 15:28:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66B44C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6289787E3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nl0vIEMfcPEZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 13D8087E3C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:08 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id q24so3806624pjd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zU4amKGusW40yYOw6SpmUuhDr+uqLTgraL7yGwd6ZOY=;
 b=fLcPYUS6MGiTfiiVvXxtkq8cgTI98nGPB4tOWqf5z5QcrT4xfD/PcxrjmVPihnyi59
 gZYnzgQ0waUNb7U3PVrJGBqJeuRAPbVOjaAQBLgXVNSD8nbtkWlF66TimxK8rEeO6cQu
 LnaZoMQUgtCAvP+XN51NrlYMoxfk1rTzj6hOuhGEOVmQ7Rb5r+R0vdYPZH1LKHVc18BG
 63m3X2uBnKmosIUqyH7hpBhW4Ec2py3dorO4hF6yPBRR2JVEmUpt82CrbC1IjYiCXGyU
 dsDtBbU39L4x7VFgIJ802/OACCpVMrCUG8l+7As/425RncA6KF/ZB4x0PaeSM9Fzuj0S
 M89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zU4amKGusW40yYOw6SpmUuhDr+uqLTgraL7yGwd6ZOY=;
 b=m0AFN24Z42mWYu3ytN8XoyL4Zpt6a/jkCRay36xbR0PqAkuwBW4ON+H/LeV03mDrMA
 wEnQrKCGSzj6qSkgG5fKWLBENUkT2zafBe1rBdTg7bDPSJTbFtcLAEPE8iatN90q3PCs
 h8OYVsW1+V1MNNW2vxGlzLZ91tFt412QSfIIc3LldLrvA53ddo1XbFW4CpWJ0GrBlIUm
 KJxSWL9pdOl96o/4rOKgQVvARvVjusITCgzrr8VZGWT7h0FX5PqbgPdwFBNn2EmgwnAV
 Ak+6oXAXs7+GvJB51X3AazwpMC2c3eF/MdrgKZ6+xt9/jK/PUh0jl9dMHKa7w1+fLU5z
 CLDQ==
X-Gm-Message-State: AOAM53217QQAl1FctnijLXixb6/MFa9PPYlBFUW51YF7KVDx3Gq+nhBv
 4WOSuHSgGymSOHqoFr4QxC4=
X-Google-Smtp-Source: ABdhPJyT3RJZEMPueeQkg4x1HnU2eb5R34tSjGYIkVZtzQN7jBZ3zzOFmI+0+wRJsMe4JkCDCVx+qA==
X-Received: by 2002:a17:902:ba8d:: with SMTP id
 k13mr16646870pls.290.1590938887659; 
 Sun, 31 May 2020 08:28:07 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:28:07 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:14 +0530
Message-Id: <20200531152621.2886-21-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 20/27] parsing_c: unparse_cocci:
	Reflect struct end attributes
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

Struct end attributes are added to the SmPL AST. Reflect these changes
in unparse_cocci.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/unparse_cocci.ml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/parsing_c/unparse_cocci.ml b/parsing_c/unparse_cocci.ml
index 30050ea1..f0efc968 100644
--- a/parsing_c/unparse_cocci.ml
+++ b/parsing_c/unparse_cocci.ml
@@ -955,7 +955,11 @@ and declaration d =
       close_box(); mcode print_string rp;
       pr_space(); mcode print_string eq;
       pr_space(); initialiser true ini; mcode print_string sem
-  | Ast.TyDecl(ty,sem) -> fullType ty; mcode print_string sem
+  | Ast.TyDecl(ty,attr,sem) ->
+      fullType ty;
+      (if not (attr = []) then pr_space());
+      print_between pr_space (mcode print_string) attr;
+      mcode print_string sem
   | Ast.Typedef(stg,ty,id,sem) ->
       mcode print_string stg; pr_space();
       print_named_type ty (fun _ -> typeC id);
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
