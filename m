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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6766AC54E8D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3498620731
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 May 2020 10:09:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAHF4eLl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3498620731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 16492888DF;
	Mon, 11 May 2020 10:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MypwRUVijL6I; Mon, 11 May 2020 10:09:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9F5DE888D9;
	Mon, 11 May 2020 10:09:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AD78C0176;
	Mon, 11 May 2020 10:09:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAF3FC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D402D85D40
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id comCKb8Z_P1j
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EB2A4869EA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 10:09:27 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id f23so3679003pgj.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 May 2020 03:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tnmadx4ChwXWJFTYu0SdF/be9OfsuCxM51pURrHXSuQ=;
 b=IAHF4eLlbjiId+201+2fZ2vwo3Ae8ah9/vZdAiU8Qj724U1skQQV82SSQttsEqxiOm
 1jbMBJUGeAWLs7aVZB5hSa9Qfib5i8xO3WW8cSYrMNC1/C5Dj2PIxKqh103ddy3xmVFY
 gqbv5T4hknwd5gbok34wozQRt44AOdt4e/gycBJF2HIAFyIE4l44ih9Htv4OPUVuRDy2
 GKVTgRzf7qjHCmV9weHiXs3QvHFacqRMx0ZsZfWWtIEtTkNeH8Lv9pCkUfvPi+8iKyrP
 xHYJcjG3JENeUZgZJ2HoCuvCZTQeytrIHda212GFEI8kQhB0sTGx0GiUmZE4KUbJclXc
 2X8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tnmadx4ChwXWJFTYu0SdF/be9OfsuCxM51pURrHXSuQ=;
 b=ZEOzRqhA13zBXXQ9WzI1F9mkmT83m74SWR1HU6t2UHrA7/YZ0Ow9HjkcdmW9D5/qhn
 EbhB7wslcajgHUHuIYKiPWBnlp5iPJcjOg8GIpCcoKoSjZAmVV/A6hYduZCfYwGCFr9n
 vH8VRvLfzkVp2PpWQ+0rVVobJzrk+OmOWeQz2aeJEgfDCgfQxkfmPeLURRcoz4ILCFA7
 0O86mF/X9kMQGTDn6xs3aaUfled4kxILB/o+mw9xD7Ay3BOrrT9smV/OJjT1ZvJwcdvm
 f7QG/VIIom9SrDD/8d7MDZveFbJjXoe3gYJHcQmITH3oMzJWhTvWHHFUpGhtkWkBNZjg
 MuLA==
X-Gm-Message-State: AGi0PuZVj845WfFHaQygD54Ax8rfjTl4g9MNpOd95eY6Pc+OCBrwVj2M
 diWdiut7ZR+VJ8aBl9qGvD0=
X-Google-Smtp-Source: APiQypI7cpXU1X0EEk0VX5oNWZRaw8z/D8HMApDgODhGcXYEqCkI9SR6ayjV9tz0rq8c6QgFOHn+qA==
X-Received: by 2002:a63:1d4:: with SMTP id 203mr13405381pgb.74.1589191767518; 
 Mon, 11 May 2020 03:09:27 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:382:66db:4729:1ab8:2139:8945])
 by smtp.gmail.com with ESMTPSA id
 o99sm9772994pjo.8.2020.05.11.03.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 03:09:27 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 11 May 2020 15:37:11 +0530
Message-Id: <20200511100715.19819-29-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
References: <20200511100715.19819-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 28/32] ocaml: coccilib: Reflect
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

Cast attributes are added to the C and SmPL ASTs. Reflect these changes
in coccilib.mli.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 ocaml/coccilib.mli | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ocaml/coccilib.mli b/ocaml/coccilib.mli
index a305d616..ab583c1d 100644
--- a/ocaml/coccilib.mli
+++ b/ocaml/coccilib.mli
@@ -146,7 +146,7 @@ module Ast_c :
       | RecordPtAccess of expression * name
       | SizeOfExpr of expression
       | SizeOfType of fullType
-      | Cast of fullType * expression
+      | Cast of fullType * attribute list * expression
       | StatementExpr of compound wrap
       | Constructor of fullType * initialiser
       | ParenExpr of expression
@@ -2569,7 +2569,7 @@ module Ast_cocci :
       | ArrayAccess of expression * string mcode * expression * string mcode
       | RecordAccess of expression * string mcode * ident
       | RecordPtAccess of expression * string mcode * ident
-      | Cast of string mcode * fullType * string mcode * expression
+      | Cast of string mcode * fullType * attr list * string mcode * expression
       | SizeOfExpr of string mcode * expression
       | SizeOfType of string mcode * string mcode * fullType * string mcode
       | TypeExp of fullType
@@ -3305,7 +3305,7 @@ module Ast0_cocci :
       | ArrayAccess of expression * string mcode * expression * string mcode
       | RecordAccess of expression * string mcode * ident
       | RecordPtAccess of expression * string mcode * ident
-      | Cast of string mcode * typeC * string mcode * expression
+      | Cast of string mcode * typeC * attr list * string mcode * expression
       | SizeOfExpr of string mcode * expression
       | SizeOfType of string mcode * string mcode * typeC * string mcode
       | TypeExp of typeC
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
