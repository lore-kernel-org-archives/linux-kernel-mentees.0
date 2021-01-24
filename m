Return-Path: <SRS0=cPcG=G3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A26C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 15:19:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9A3722DFA
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 15:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9A3722DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 72CFD86665;
	Sun, 24 Jan 2021 15:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id thpKA8Cl+-hv; Sun, 24 Jan 2021 15:19:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DC39E868B1;
	Sun, 24 Jan 2021 15:19:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5E83C08A1;
	Sun, 24 Jan 2021 15:19:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 805BEC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 15:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6467320400
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 15:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-Om5hsTUbz7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 15:19:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by silver.osuosl.org (Postfix) with ESMTPS id 4B60A2033E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 15:19:35 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id e9so6059820plh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 07:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kmk0NywNWMGCIJKlBdGbK8NNH6YZcD50wh4CDMm4iDE=;
 b=HH/6hmdHPSd9wj3xhJk7UyeZ1K8VmguurUFuc5GspBYB88BYrtCsU3F72iK7b2KJUr
 0/tKVxGA4CZA6mB/6Zhn7fDCrFScRHyKax21kxvAIqFDY4SAxo6rcIrV5kLTzVUghDGS
 0iamNhl09lIQtuQAFkplJeoA8VmLc5kmuKLzrw9G08Y/OgfyvP20cBsh/xdnP6M42L0k
 +wkO9YznCe7Mo5N6/TQhgli8VLqdvLb4JlkDClNEID4kW8GO+jIfE2ggyuKjQS42qhjs
 cEVGMEV1nA0RAUqGFNwJbevKnZCZwVgLKndJeyeMRkCPbrV651/XtEaOBOGV9nH03Fnv
 IiWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kmk0NywNWMGCIJKlBdGbK8NNH6YZcD50wh4CDMm4iDE=;
 b=qV9bOgrJ4c1Shv+QXBtO6Vgpp+oV8akQOXJoo1aG7hE5RTYtwThtEEB/WIM8kZ4tBq
 ON1GjpTYiaVuCPKHubW4iH/vQdP6I5RoYL5jx5twwPJVgsBmnW/HU+sSClOnROSGA3TO
 IAQO2z5pks8oU0mPHbfh1Y3mSz+Ztxb7IB+jaY6H4gjrZJmgyVnteKxKlasxuU2K/g1V
 1ExhjCNS9mT4wJ2hccH7VgrjgHt6bM76BkW8Wx37EfhUih2B+vJUQ+nJ9DzcoyYPUIOH
 3IgiEB1WcofRRQHqlWq9dlHJ8KA5oE6LULmOtzhdnbCoA/W9DgapM00ONrQGEI+kANg6
 caRg==
X-Gm-Message-State: AOAM533leAm9uNRKqqrNi8e2FrmgsQdtYrtnHv/VVoDRBr4bRyY0oEEx
 ew5nmSpXK2CZ7AnylSki7p4=
X-Google-Smtp-Source: ABdhPJwfsxPAbs+1UmfgxEMmDN3sCkj7FcH4ipxFXPLP00UEcUY7I1FBDfp4oub4ssaEvKpEIU4RsA==
X-Received: by 2002:a17:90a:8594:: with SMTP id
 m20mr16849020pjn.215.1611501574816; 
 Sun, 24 Jan 2021 07:19:34 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:694a:4908:5c97:3b7c:64fb])
 by smtp.gmail.com with ESMTPSA id gk2sm15687328pjb.6.2021.01.24.07.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 07:19:33 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun, 24 Jan 2021 20:49:30 +0530
Message-Id: <20210124151933.19696-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC 0/3] docs: add documentation for
	checkpatch
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

This patch series serves to introduce a documentation for kernel script
checkpatch.pl (scripts/checkpatch.pl).

A top level tools directory has been created in docs which shall contain
the documentation related to the kernel tools and scripts.

This documentation shall be progressively updated by future patches to
document all the message types in checkpatch. Consecutively this
documentation itself will be parsed by checkpatch to generate verbose
messages.

Dwaipayan Ray (3):
  docs: add documentation for checkpatch
  docs: add documentation for checkpatch
  docs: add documentation for checkpatch

 Documentation/index.rst            |  11 ++
 Documentation/tools/checkpatch.rst | 271 +++++++++++++++++++++++++++++
 Documentation/tools/index.rst      |  10 ++
 3 files changed, 292 insertions(+)
 create mode 100644 Documentation/tools/checkpatch.rst
 create mode 100644 Documentation/tools/index.rst

-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
