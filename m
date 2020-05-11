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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1349DC54E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:07:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5B4820720
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGspPLMv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5B4820720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ADE3286E3A;
	Mon, 11 May 2020 10:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n1Mhn-JQPtUl; Mon, 11 May 2020 10:07:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C1DFD8745C;
	Mon, 11 May 2020 10:07:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B20C4C0178;
	Mon, 11 May 2020 10:07:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3460C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D95E824763
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tatFCGyxBRRS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 558582050E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:07:55 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id t7so3745975plr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lwqNogG8vHxP252WZiCGBfjwezgxLB4uDA3affNqJMs=;
 b=SGspPLMvRF5YaQP/mKKPZYTP4HX2+W89zla2jc3fWpFQK/ro1mZXNGtqSmPMbo7ZQ8
 Gu5F/Z3u/2EMD+zCI5Ewxs8ZzzMsN99ttKziZCt6yFWe1FMrswkj0h8wUMSuKUkzbmjy
 3CzWCyJQmfyOHTdz49m1S4/pbWtyCS9qIWbcd9+RxjRhRzvBlV/EaQrES4fa+nvQWtuK
 tWolOW5qjOqXOj9y/SmqnP5hZ89h8A40NR59t6gCjaK3zTUX2ziNr1bMwCy+ZF9JwvHi
 viX7JZufAXXAxd6+pXFhJDWcJySQO3WGmYnXbFrtgHX+c+KHHYdP7lV2VwdZg+wLJgQz
 ylSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lwqNogG8vHxP252WZiCGBfjwezgxLB4uDA3affNqJMs=;
 b=DkQyQzUN+anbL/JG7vfWyYRqR0oLMRtfwjMyMBYIf82J4RedH62mLh/puoAD8+S6El
 k4We+lpoDhB51FfhFeTuBeys8+dOSQRJ8h2yURrzITNQMb5SLtf5eW5pmu34xTKPtQ8I
 t44udMiCkOKN56K3TfSciQ6U0CxQAZAEQDRBabh8vW4EsRu91vTKu6w9c2pzIRtZ7DZE
 WValzFFR+Cs3VQucAOK6Bh4uZvLb4paNhjndiyBUTmrhhei5NxCt1eBybnDI6Cp8F37K
 0TFIVmsCaGVVRG245BJ63h7bfStngTNDLFtdmcaD/2LzkSjz4tqiPGmzVUSFVoseA3eB
 bh/Q==
X-Gm-Message-State: AGi0PuZ2hpjbebOuIWfVpMZy6bP3Haxj16VbbpjGXPPjesLBw27Rc+8X
 jFRgQcbxXb/E4Dp7Q9kXHgY=
X-Google-Smtp-Source: APiQypJ68zQGHG5UsppyrzhPXuU4lpCYa9QqUfkjD5EStfgOGg9DGG5fwMHnYkg+widv7RjG6s+MRA==
X-Received: by 2002:a17:90a:276a:: with SMTP id
 o97mr21386692pje.194.1589191674892; 
 Mon, 11 May 2020 03:07:54 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:07:54 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:36:48 +0530
Message-Id: <20200511100715.19819-6-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 05/32] parsing_cocci:
	unparse_ast0: Reflect cast attributes
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

Cast attributes are added to the SmPL AST. Reflect these changes in
unparse_ast0.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/unparse_ast0.ml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/parsing_cocci/unparse_ast0.ml b/parsing_cocci/unparse_ast0.ml
index fdaf6cfa..7f554b37 100644
--- a/parsing_cocci/unparse_ast0.ml
+++ b/parsing_cocci/unparse_ast0.ml
@@ -221,8 +221,10 @@ let rec expression e =
 	  expression exp; mcode print_string pt; ident field
       | Ast0.RecordPtAccess(exp,ar,field) ->
 	  expression exp; mcode print_string ar; ident field
-      | Ast0.Cast(lp,ty,rp,exp) ->
+      | Ast0.Cast(lp,ty,attr,rp,exp) ->
 	  mcode print_string_box lp; typeC ty; close_box();
+	  (if not (attr = []) then print_string " ");
+	  print_between (fun _ -> print_string " ") (mcode print_string) attr;
 	  mcode print_string rp; expression exp
       | Ast0.SizeOfExpr(szf,exp) ->
 	  mcode print_string szf; expression exp
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
