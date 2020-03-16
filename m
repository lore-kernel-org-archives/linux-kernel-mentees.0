Return-Path: <SRS0=1bif=5B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A064FC0044D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:05:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 760EB20663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Mar 2020 10:05:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIiGBhuu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 760EB20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 69926220A9;
	Mon, 16 Mar 2020 10:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19XDl3gXr6dH; Mon, 16 Mar 2020 10:05:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DB1CD20134;
	Mon, 16 Mar 2020 10:05:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4957C1D88;
	Mon, 16 Mar 2020 10:05:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E6F3C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EDA2F20134
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1wIj6J420GiG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:05:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 7C0BA274B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 10:05:05 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z4so3693414pgu.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Mar 2020 03:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tmcsVGk4SUFgwf9gcnr4bcFVeXLGhm9CDcwKlVjnNSU=;
 b=TIiGBhuumZo/dz3cJHU8eYlIatN3z3q3nYAUCY/+rUqntuYEpTQoOw0XCDm22XzRgT
 Y7zxMhUW4BZToJw9peZLabfqXd4KlctfILGC33XhLj+GF52lW5yF9dziMp8Ax8CbVqEP
 Sjo6nxfuVHjm6EgLa5nqgFjFa5MTbhWMh45vi1I5aqnfXHAuGOsbZi1yVAV1rxCjc11h
 iSQUEfMGKyTFIlgsRElxjthIsF7DyOASsCm76b12MVg5/S9i69BQY2kdzGwJ4/IQ4rsU
 xvYAP8P16ds4W0trA9YENnDy0N7gmThBr26ccFA6wlmlUqy0yFIpVZfGnkwV2WDjzcZo
 CjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tmcsVGk4SUFgwf9gcnr4bcFVeXLGhm9CDcwKlVjnNSU=;
 b=Cb1h1hgxY7MOQBjvjLGajsIUYz5pt8Ko4x49VEz04dh2jTjFgjCswOmqPRa/oJnX3B
 Il7Ga6Z/MfgGIwtF97LO3yiX9ps5wyJPq24VeTPu0/radVp7JNPwOgtW0bvoJeYB7sbS
 AmxFhVb16wZEJ/7YAgK0vQQ9IEgtRFOVEJh2ij6FBZ/eHCtrMT7TW239RZA1DRBuewNJ
 ysKPckgETJeUF7YfVxxmvDBSpg+hDu21KbPgxVHEWo5xJ6gybjKuO5iPUEyDhYRWvM3c
 TgxabmNBe8oes5x0UhUfa+k7nnOZ2iqzP4SMe5VIxfNjpSG44jvNWKDI9FDdUPPefZvY
 Obuw==
X-Gm-Message-State: ANhLgQ1LnA5yPJW8122VqSvZW4jcAxpGSFK9bDnw5TjsQINxRrXGnQmy
 acLZfAnBRA4aH1k9vdnd3vs=
X-Google-Smtp-Source: ADFU+vtKPbUpMfGCiBIE9hewJE/DuoruuHCZ+nnlW+kJwa1e4aw50p36XEbaqlap18zXyvyIjJnOgg==
X-Received: by 2002:a63:e14c:: with SMTP id h12mr26269333pgk.393.1584353105046; 
 Mon, 16 Mar 2020 03:05:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:284:a4f2:cc63:b7fc:551c:dce5])
 by smtp.gmail.com with ESMTPSA id
 u3sm19803374pjv.32.2020.03.16.03.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:05:04 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Mon, 16 Mar 2020 15:33:19 +0530
Message-Id: <20200316100319.27935-27-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
References: <20200316100319.27935-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 26/26] tests: Add test case for array
	of function pointers
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

Add a test case to match against an array of function pointers.
This would previously not work due to differences in the C
and SmPL ASTs.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/funptr_array.c     | 1 +
 tests/funptr_array.cocci | 9 +++++++++
 tests/funptr_array.res   | 1 +
 3 files changed, 11 insertions(+)
 create mode 100644 tests/funptr_array.c
 create mode 100644 tests/funptr_array.cocci
 create mode 100644 tests/funptr_array.res

diff --git a/tests/funptr_array.c b/tests/funptr_array.c
new file mode 100644
index 00000000..dac29ac6
--- /dev/null
+++ b/tests/funptr_array.c
@@ -0,0 +1 @@
+int (*x[2])(int x);
diff --git a/tests/funptr_array.cocci b/tests/funptr_array.cocci
new file mode 100644
index 00000000..8027bcf4
--- /dev/null
+++ b/tests/funptr_array.cocci
@@ -0,0 +1,9 @@
+@@
+type T;
+identifier x;
+@@
+
+T (*x[2])(
+- int
++ char
+  x);
diff --git a/tests/funptr_array.res b/tests/funptr_array.res
new file mode 100644
index 00000000..72e1a14a
--- /dev/null
+++ b/tests/funptr_array.res
@@ -0,0 +1 @@
+int (*x[2])(char x);
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
