Return-Path: <SRS0=tq4P=G5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91D3C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 18:35:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D0B2223D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 18:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87D0B2223D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 18F76866F0;
	Tue, 26 Jan 2021 18:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H326mYn1Joft; Tue, 26 Jan 2021 18:35:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A4DB88666F;
	Tue, 26 Jan 2021 18:35:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86FAFC0FA7;
	Tue, 26 Jan 2021 18:35:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD33BC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D868286672
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnoJh1xxmcas
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2A3AE8666F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:21 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id b17so3713466plz.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 10:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=52fk0kbTrSyL0AV53feeXDmkSTW51BS9ESJn2yxoUuM=;
 b=BXnVKBBewzcmU+iInQU6fc2SRb1zGGDmJYV7q/3MuDLdwJOU29DFVx3acEOV8hTGmM
 7JlY+CBo3+V/aBej5Sv9kWso4Uyj/+NpTWoNudQw/1uvF+Pzym5KeQMvoD0OtWBGEuN9
 HkVxGuHu+SbfoxTR39spoz6B78B9VUUEvTR2ULAJnwnKeST9hjcjyCy/vQ9hfIqJtuBF
 Ptn6YNlj8DgAGEH6QjYecrtXf6nnQWaIp2GSmRBsm03XyOHhQK1BqNbSWY9rlUvx4OT6
 0lWRTKEq9RBxbTLWWN/5hSe/Tuw7URFdgFe48IIrYBy9z5HuDERH0vlLcOHP+Pid5aCM
 OJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=52fk0kbTrSyL0AV53feeXDmkSTW51BS9ESJn2yxoUuM=;
 b=K7sfUmVuK0ARKy0qabmeCUDId5WniY1cVJ1sKetPLwH67/KnIaYttKbATrJGqNW+JO
 19Un2OqB5EswQ4hQPAk7UOKJJf7cVuw7LejvfaEDcyNhmVjLHSvZ3Xq8Drukr5WPVqs4
 2J6VSeU9KHgfx+nTutrQ0/4zXC7MoLzOj53LMi5LhICvWRNeOWmkmfNuO7Sxl+pOho2S
 2MUsioKxPCYz9dRdTT4dD0ZN0n/pofCSqjU0dJ7a1f5sVPrrnElE4l3PzOYE+zGto8dp
 4fa7Fua6HfuK8oyw8jG7EAUBQs3zapD/JRpe1CSnd7eYuL4y8wfsYNNTWBkC0bIRsULb
 KtKQ==
X-Gm-Message-State: AOAM531I5pSe6f1XVjLnDfGSQjRQZ32gtctVbF/VWa8QuWVi8ByaTIjs
 5rk2KYS5OEnliaTvdMZmGTw=
X-Google-Smtp-Source: ABdhPJzj/wTR+p6KFUxo/iXhBe+SKn79OGD4mI7OeiNEsMrK7LnfYumb2eGNfQ8MfKUikPNJQos0tw==
X-Received: by 2002:a17:902:ac87:b029:e0:17b:68d2 with SMTP id
 h7-20020a170902ac87b02900e0017b68d2mr7404713plr.0.1611686120618; 
 Tue, 26 Jan 2021 10:35:20 -0800 (PST)
Received: from localhost.localdomain ([49.37.2.129])
 by smtp.gmail.com with ESMTPSA id a31sm19713654pgb.93.2021.01.26.10.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 10:35:19 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Wed, 27 Jan 2021 00:05:18 +0530
Message-Id: <20210126183521.26535-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH RFC 0/3] checkpatch: add verbose mode
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

This patch series adds a verbose mode to checkpatch.
The verbose test descriptions are loaded from the
checkpatch documentation and parsed by checkpatch.

The documentation itself needs more work. More input
on the usage and test descriptions are needed.

Also the visual aspects of the verbose mode needs
some work put into. The usual printing of verbose
descriptions can cause confusion and maybe hard to
distinguish from the actual warnings.

Please note that this is only an initial attempt
and any comments are welcome.

Dwaipayan Ray (3):
  checkpatch: add verbose mode
  docs: add documentation for checkpatch
  docs: add documentation for checkpatch

 Documentation/dev-tools/checkpatch.rst | 283 +++++++++++++++++++++++++
 Documentation/dev-tools/index.rst      |   1 +
 scripts/checkpatch.pl                  |  55 +++++
 3 files changed, 339 insertions(+)
 create mode 100644 Documentation/dev-tools/checkpatch.rst

-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
