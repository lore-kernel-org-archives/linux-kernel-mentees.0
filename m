Return-Path: <SRS0=a8nb=7N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DCFC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 787B9206EB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 31 May 2020 15:28:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ED1aNGT0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 787B9206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 59DC386B05;
	Sun, 31 May 2020 15:28:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tOt5NGk+mgO6; Sun, 31 May 2020 15:28:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F39D186ADD;
	Sun, 31 May 2020 15:28:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF72EC0863;
	Sun, 31 May 2020 15:28:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E921C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8B91485F92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x9W0Odqa96Im
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2AD1B85F11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 15:28:24 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x207so376056pfc.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2020 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqCIwDScet/SSV7xUt/88H3gSHkZyzKqS7t7vQrsTB0=;
 b=ED1aNGT0qZkmpNi2FGH95YkZPgnAX3Un0vMTQw/WLnCiueBToJwkS/orpnemCYs1uD
 3dT+BRK+ld96nT11+sROqve3yp1H6VXWrxR6clgrPF7V/qa0FAhxHtYxZJfvu4X1sxxh
 f8GagLxA9Epqfsd4wbMUfSAcN0rVETgiPSGuwvr6tsVLzoMtch/FrO6ho7N7oI/LgbdB
 u7uDeMTEPqauXLaS1gF2GhqocUEZ90XyiX+zeGbxXBE2H48u0uZ4MsilpJMSDNBydYav
 ftJNWlFV4hciy0fMgMrhju8kqlh6321ycTf+osM6uCKWbEil/ZduO+FSdDrkqKGYYs7+
 xHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqCIwDScet/SSV7xUt/88H3gSHkZyzKqS7t7vQrsTB0=;
 b=mS6bVk7wEt6KunQEYYdKG3VzFq0fLKAc03XaSjKHb5ujHPDXmELh8PxaIm8PQfVSaO
 JihV9pK2STszgSEyptMZx0RNSFWKmRKB104JbXFF1Pg9OnPMyCN7V4nD+ZMzBHryiIgX
 +UgYvc1dOVx6ynrhTx9mvAfz2wpHzBy3FbtXGpasf3H0a+cXEj/8pYxOxkn/5ZDRHOdT
 4K1TQZaCyXhIk4mYsaFmO4pnl/5cuTcORok/naiye9i2rgjmXQUsiLUbZzLJTMdcqTK4
 YYqON/os4jhJkOtiyemE7arq52iGLM3wNr1q0C434fgaRyA3pvlApxWtGB06Yl48f7Zw
 armQ==
X-Gm-Message-State: AOAM532AlOObv961mZxwTOrHv8WwH0oeJW5PyLBTLhdsRwQ8dH8f0QeD
 cBiM29hIlK9t2IgTLBSADlw=
X-Google-Smtp-Source: ABdhPJxvj6eHj14bRlZ8UXcLWORmsvXbQ4IjVD7Lx7pQbAvf1ENVABb/DTOdTOXbWAu51gJLNogFqg==
X-Received: by 2002:a63:3756:: with SMTP id g22mr15811789pgn.304.1590938903649; 
 Sun, 31 May 2020 08:28:23 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:1863:fef5:a170:128b:8ef:499d])
 by smtp.gmail.com with ESMTPSA id 131sm12310443pfv.139.2020.05.31.08.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 08:28:23 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 31 May 2020 20:56:19 +0530
Message-Id: <20200531152621.2886-26-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
References: <20200531152621.2886-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 25/27] tests: Add test case to remove
	a struct end attribute
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

Stuct end attributes are added to the SmPL and C ASTs. Add a test case
to remove struct end attributes.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/remove_struct_endattr.c     | 7 +++++++
 tests/remove_struct_endattr.cocci | 7 +++++++
 tests/remove_struct_endattr.res   | 7 +++++++
 3 files changed, 21 insertions(+)
 create mode 100644 tests/remove_struct_endattr.c
 create mode 100644 tests/remove_struct_endattr.cocci
 create mode 100644 tests/remove_struct_endattr.res

diff --git a/tests/remove_struct_endattr.c b/tests/remove_struct_endattr.c
new file mode 100644
index 00000000..95aa8610
--- /dev/null
+++ b/tests/remove_struct_endattr.c
@@ -0,0 +1,7 @@
+#define __struct_endattr MACROANNOTATION
+
+struct abcd {
+	int a;
+	int b;
+	int c;
+} __struct_endattr;
diff --git a/tests/remove_struct_endattr.cocci b/tests/remove_struct_endattr.cocci
new file mode 100644
index 00000000..c4b86864
--- /dev/null
+++ b/tests/remove_struct_endattr.cocci
@@ -0,0 +1,7 @@
+@@
+attribute name __struct_endattr;
+@@
+
+struct abcd {...}
+-	__struct_endattr
+;
diff --git a/tests/remove_struct_endattr.res b/tests/remove_struct_endattr.res
new file mode 100644
index 00000000..dda83724
--- /dev/null
+++ b/tests/remove_struct_endattr.res
@@ -0,0 +1,7 @@
+#define __struct_endattr MACROANNOTATION
+
+struct abcd {
+	int a;
+	int b;
+	int c;
+};
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
