Return-Path: <SRS0=WAM0=4R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABBBC3F2CE
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 29 Feb 2020 10:43:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C25F2246A2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 29 Feb 2020 10:42:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwdZdO/n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C25F2246A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8BCA52036C;
	Sat, 29 Feb 2020 10:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCrgTjS-qbYU; Sat, 29 Feb 2020 10:42:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 02A5F2014B;
	Sat, 29 Feb 2020 10:42:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE2B3C1D84;
	Sat, 29 Feb 2020 10:42:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2502DC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 10:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0E7CD86D05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 10:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P+VdLfPo-zDy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 10:42:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6DE9A8461B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 10:42:57 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 2so3063795pfg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 02:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JCesXVwgXHb5ysMOKa3arGKHG24qGlhlxiB/OtEgvZ8=;
 b=ZwdZdO/nDC9JjIPq/kA/CQcDrMdhk55v8dnqmA9JCB1vJPO/lOiPQP2zTxjKrwJbFh
 SHBi1bf9PGIP/8Bk18jMq0bQCVjegFaPs5NqKW6obgE+61dgqhzXfOzaywGsLU34WMO9
 ATs5M+Z6NwtHljIOZ9og7Hx8L3rL8bOrTBI5kWAGZAkRQpFi8UNh8OuIpMWkVgqrnLuO
 zZ40Ut3FP5XKRGuxSZchM+GQwnuwULQju0TYddy72o57FaiCSlBIAqVUrsTxnrqbCP64
 9B4QIbptSGNy0QTKWwd8dwymPptJo3MzieLQcS70Afah853h6cA3LshxvZdjxz0+7AFY
 mAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JCesXVwgXHb5ysMOKa3arGKHG24qGlhlxiB/OtEgvZ8=;
 b=ZjxxN8d9c24Jji/7yrm16ghxUObOECdholfn6FwkZX01JYp9+vdZt9F0vwzusmfqJC
 8fUPUucH1bPy1riHwKLjick27k53ak1DCV+4AQWJCFkFSQW2dtaNINLOZxiu0XlbBbj1
 hUIo7ihrHSdpkNBivSH+1IwJgciT4z24Ul+lz6a18nHMHgwhlio/2xvPPcZCdOkMglTP
 dPpXasLFEe7ozq9gVuGfkpIB/QARzz0QrdSi655U+9iTsDiGcH1R1mX5IzeQZBF3i4xu
 ttSlZPuzhtO7VvQT5mpwXosrrEpoDIkk/e5aRRJTLtVQJ9BF0FgD0ZnLuoGZccV0GatT
 TfRg==
X-Gm-Message-State: APjAAAV1wVk13UL7CZK+yEdL/AxbYW5X1SJAkaCBULfnL7NqmlyYcyR+
 qdixX0niCuWCNw4WiVs524o=
X-Google-Smtp-Source: APXvYqzNVd/OTG0XSQOf+jpOh+PomOMbO47cm+UgaAPw76N9ZYgrPlOHGfoOWH3+n1IU2iMBNfRZFA==
X-Received: by 2002:a63:4a47:: with SMTP id j7mr9059102pgl.196.1582972976941; 
 Sat, 29 Feb 2020 02:42:56 -0800 (PST)
Received: from localhost.localdomain ([103.118.34.152])
 by smtp.gmail.com with ESMTPSA id v7sm13685735pfn.61.2020.02.29.02.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Feb 2020 02:42:56 -0800 (PST)
From: Pawan Kumar Meena <pawank1804@gmail.com>
To: paulmck@kernel.org
Date: Sat, 29 Feb 2020 16:12:40 +0530
Message-Id: <20200229104240.1002-1-pawank1804@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] Documentation: RCU: lockdep.txt:
	Convert to lockdep.rst
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This patch converts lockdep.txt to lockdep.rst and adds it to index.rst.

Signed-off-by: Pawan Kumar Meena <pawank1804@gmail.com>
---
 Documentation/RCU/index.rst                    | 1 +
 Documentation/RCU/{lockdep.txt => lockdep.rst} | 2 ++
 2 files changed, 3 insertions(+)
 rename Documentation/RCU/{lockdep.txt => lockdep.rst} (99%)

diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index 81a0a1e5f767..109dea13f165 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -10,6 +10,7 @@ RCU concepts
    arrayRCU
    rcubarrier
    rcu_dereference
+   lockdep
    whatisRCU
    rcu
    listRCU
diff --git a/Documentation/RCU/lockdep.txt b/Documentation/RCU/lockdep.rst
similarity index 99%
rename from Documentation/RCU/lockdep.txt
rename to Documentation/RCU/lockdep.rst
index 89db949eeca0..4e71f77bdd28 100644
--- a/Documentation/RCU/lockdep.txt
+++ b/Documentation/RCU/lockdep.rst
@@ -1,3 +1,5 @@
+.. _lockdep_doc:
+
 RCU and lockdep checking
 
 All flavors of RCU have lockdep checking available, so that lockdep is
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
