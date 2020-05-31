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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699C2C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E3B9207C4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfwMIDeI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E3B9207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 12BC62035C;
	Sun, 31 May 2020 15:27:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCiH44uFwhWF; Sun, 31 May 2020 15:27:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 79F2220030;
	Sun, 31 May 2020 15:27:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7621EC0863;
	Sun, 31 May 2020 15:27:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FB9FC0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9426286B17
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uoU9oAY6xj1F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0050E86B05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:27:19 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id nm22so3183422pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8h/pvSSdYfn3Zgzqr1TDoXPIV2JdP7GY8NAxupsolQM=;
 b=pfwMIDeIMZaUCusXBbpjxnNS1F/0w7ut65oFMsyX6s2agk1ccwAIrH2cKzWmlgh/Ck
 2o92UTKgjQWo123oWNCCvGtg1JrkAwWn0VpRBTWMjL42OoHN+MmZNGziu7GAuDZXe9QZ
 kkdZ2x3RSPnClotlPsQ26bz5YxgOkcLfD9vc3EsiqB7JKlddTO8IyGj5rJJQxj2CSniD
 WgJ7umW217FBfRYMwtRyBGDcsP9jwfo6a/PQoKJeBRNMHMZkU2Pz/VT79hz6KJSXyQn/
 aomWFEzH1QZxJyeRYL7mIdNRZtTwFI7WJHoa8Tqo1iuVzvqt4bpjncWmO9XABu4IZfwu
 O9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8h/pvSSdYfn3Zgzqr1TDoXPIV2JdP7GY8NAxupsolQM=;
 b=crsVHt6qz1UzIRwaUSSp8WnHsdhkgZjCM0BiEcnLth+9fJHoXLRc60a74bg21daeQI
 Q0IFdvP226/CjcSV3GcY7ZpAB19UbXD7SNeR3lAOESGXpGk2VImkb4efT1RdetXJEiJ/
 agqiEKgqFyI0OhK70VlDqQClE3Pwb2tia89VjLGxQWKNDK/0ZIkMjTaHKMDVWCbpawMo
 L8EICI4mwNog8hHYWbAe3lalJQlUAcddqV+auS1uGVhUMV3eLCbHcJqNqljQnY7NZTBN
 8EGrxyLcEgxNuyYO9Y4DGV8i48l8zY6GWR1aDNolM2bIfAVlNY7Um0zu0C1DIjjslXZa
 VzSg==
X-Gm-Message-State: AOAM532yLeZkQpU2qAazzxn+3vYePKo/7u4TCYo5BqAEZde+FaUl/ZIz
 NAHMUIVjITjjXyx2Q+uezFg=
X-Google-Smtp-Source: ABdhPJxjvQg4JI/oZeJCzJxB0WfYaXPkiDvMXpEQIu1ZaSqZkFWy4jmkalb3vEov+VsDvywEXcxAvg==
X-Received: by 2002:a17:902:a5c6:: with SMTP id
 t6mr5337878plq.287.1590938839426; 
 Sun, 31 May 2020 08:27:19 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:27:19 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:55:59 +0530
Message-Id: <20200531152621.2886-6-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 05/27] parsing_cocci: index: Reflect
	struct end attributes
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
in index.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_cocci/index.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_cocci/index.ml b/parsing_cocci/index.ml
index fc04bd6f..8df048dd 100644
--- a/parsing_cocci/index.ml
+++ b/parsing_cocci/index.ml
@@ -119,7 +119,7 @@ let declaration d =
   | Ast0.FunProto(fi,name,lp1,params,va,rp1,sem) -> [132]
   | Ast0.MacroDecl(stg,name,lp,args,rp,attr,sem) -> [137]
   | Ast0.MacroDeclInit(stg,name,lp,args,rp,eq,ini,sem) -> [157]
-  | Ast0.TyDecl(ty,sem) -> [116]
+  | Ast0.TyDecl(ty,attr,sem) -> [116]
   | Ast0.Typedef(stg,ty,id,sem) -> [143]
   | Ast0.DisjDecl(_,decls,_,_) -> [97] (* added after *)
   | Ast0.ConjDecl(_,decls,_,_) -> [88] (* added after *)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
