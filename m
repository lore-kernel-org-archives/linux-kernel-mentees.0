Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3587EC43465
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06FF62072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sor0wqfV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06FF62072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB584876DA;
	Mon, 13 Jul 2020 13:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vFqtjcDkptyN; Mon, 13 Jul 2020 13:23:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9BC87876C5;
	Mon, 13 Jul 2020 13:23:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B896C0888;
	Mon, 13 Jul 2020 13:23:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A73D6C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9C2DF231E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9NkQ4d1WLR8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 8F49B2002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:08 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id l12so17130187ejn.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EKTGQqjFsfzqPPjmNL4aUYY57OLmCsGI5alt5eIAZQo=;
 b=sor0wqfVidp46y23ExI3rsc2tAIgirfY+l2lliUu1vrr+cY4AhVxnL0vWpCtDi/pa5
 0P/FVcGFyX2Y+3pe62aArh19MEj55T95wEF+4oO9/2bmfXNg6ZpcRhj2+xOarQfnO3Yi
 ClS6N9vgqqhyfuzzULu1HTxbdxjEJ3PCZ1/fQN6Vq9ipdpD8QA7XBzpGnmHXYxqzfHy7
 Im6YnfbXdPENwK0Tv/Tr3ewida6YiRbYRqw18+LV8NcOyemhUVamZyfUC87ZztrdJOXo
 rpPZAOHjeXFIcgipzq9CQ0IbGmW/5P7Avm2qQZKpCVxQroZ2vCz5Rp2R9aSL5UYVBjCw
 lWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EKTGQqjFsfzqPPjmNL4aUYY57OLmCsGI5alt5eIAZQo=;
 b=nCh3mNOHgHORck3UqOqNr2rrAfrdgx+qwsZiYV8MBXp1dVwJ4fzbB5ohnl8pJ20HPP
 mw42cPwBLbc+OmS0UsN7UqzZHexUgZOvxqRLek3EGrRJ/0M8AINgXDk9zuM7bIVrlLQW
 q1DNJu1BsSYg3oiF3vuRzfKoCELUxHLOAiWgyo7/kNFOaIxKiwo0ZDsSH93XudEu8csn
 LO/QClRKuisp8470tSGuMg9EBguas6T5kYQJws+57EspcF5+jlkzbsBAYnsGw5P32tNH
 lFKDwPoyLt3JHbzVJ8KkxnKE/R8p69496ZKa2jTNwWaMKa/HFbSoxM2tzX0yN6jgPQHR
 Ifnw==
X-Gm-Message-State: AOAM532EbYyEmiCVZkFiP4jftw4DqWAl0zV7BpNRMIaYNccvzz8eV1rr
 bKRnxN1PK5C34eXycF9JAbY=
X-Google-Smtp-Source: ABdhPJzOwIZGspjLgMaEq365pJ5/qMDFTMQ2+msioD//dAatGjVwqe5nQfPgFpq7fjw/LM34pCqEZA==
X-Received: by 2002:a17:906:3c42:: with SMTP id
 i2mr78330767ejg.14.1594646587072; 
 Mon, 13 Jul 2020 06:23:07 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:06 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
	Guan Xuetao <gxt@pku.edu.cn>
Date: Mon, 13 Jul 2020 14:22:34 +0200
Message-Id: <20200713122247.10985-23-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 22/35] unicore32: Change
	PCIBIOS_SUCCESSFUL to 0
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

In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
Their scope should be limited within arch/x86.

Change all PCIBIOS_SUCCESSFUL to 0

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
 arch/unicore32/kernel/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/unicore32/kernel/pci.c b/arch/unicore32/kernel/pci.c
index 0d098aa05b47..401ab356c814 100644
--- a/arch/unicore32/kernel/pci.c
+++ b/arch/unicore32/kernel/pci.c
@@ -37,7 +37,7 @@ puv3_read_config(struct pci_bus *bus, unsigned int devfn, int where,
 		*value = readl(PCICFG_DATA);
 		break;
 	}
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 static int
@@ -58,7 +58,7 @@ puv3_write_config(struct pci_bus *bus, unsigned int devfn, int where,
 		writel(value, PCICFG_DATA);
 		break;
 	}
-	return PCIBIOS_SUCCESSFUL;
+	return 0;
 }
 
 struct pci_ops pci_puv3_ops = {
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
