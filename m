Return-Path: <SRS0=uW6w=HT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA327C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Feb 2021 16:54:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26FFB64E3E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Feb 2021 16:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26FFB64E3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D67286F53C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 17 Feb 2021 16:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EY58lB7NNjyI
	for <linux-kernel-mentees@archiver.kernel.org>;
	Wed, 17 Feb 2021 16:54:34 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 08CEB6E4CB; Wed, 17 Feb 2021 16:54:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA3336E4CB;
	Wed, 17 Feb 2021 16:54:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0F35C0893;
	Wed, 17 Feb 2021 16:54:31 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92B0BC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 16:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 87F3F86439
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 16:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xZ54Ch1063ja
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 16:54:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 19D688630A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 16:54:29 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id l18so2012946pji.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 17 Feb 2021 08:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bweBA//jaU5FvEQj4YLm3O5Xa+iWylyOBiGh4/hwgr8=;
 b=NXBCPz8P6qSWS/xS1gARF8RsLiLWsDgj+mFlx77DiGrvHHT8TvGDEWiFZkSmfB1wDE
 NnV6ker/7+k1wowVIY6zc+FW9LWcoJTyGErDhJh6vyA9vtQ+RgFUmPGQ4d5DuWcOe+CA
 VG12qrQhbc7a3nkiOPYajkd9ud8rGyoFDXMDYM/VS+HR5PFZAU6PyFE7hXqjvZsvR3IC
 LP8/Ghy9+xacq8T7X9Sz5EvbH6OzL2WtIrZFdkQmEX3BwDgzX5NUv8WLdRt2HI8TxI/I
 O9c5Or+KgZWqQyGW76r7QbRMP12KK8Wd+xauBPeGQ4DuCvJ/g/bjQcimRcKeVqbNGkeg
 +DhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bweBA//jaU5FvEQj4YLm3O5Xa+iWylyOBiGh4/hwgr8=;
 b=GN5f/59/TNQZaFESo2SSAp4aZrCpyFxWrvNxe4SEuLPpqhkEIckLvmR16cniSHdozY
 5boxyJmxK25wSr6tGsuOQY28x6WIbAF/Zyq2SyiMrhaClOtKWc2J7qjgubtySSwBOkCk
 JBtZylBNHzHbvOd8n3pzuH83BNfOw5kPjTQDF8/WZ6rbegKiujnJrVVO7Bgg0WsK//Gd
 Oh2Ao9gf1JvZvrq3MBOvo47VWRIjrSsvcVPLDjKj3coQM8o9rch7jmyAPVWogxzDkToZ
 aUtS43pzr+nXfihfYhwqime6Q8225zY98S4VOp2FM52S2orcPQE3I8HYi0xD7VjJNo5n
 Safw==
X-Gm-Message-State: AOAM533GWeKnriLhon3Iq1MAsegv9aiA6tFiZR2LQ/GbCixPpFXqhVmb
 7w7DjQgDZjvKhvCGN9rUjzs=
X-Google-Smtp-Source: ABdhPJw9/luIxIYytOSebjA9zZpEP+SGuAjxOeSgZrYX09NrPfLFvwK/rJlb+9dJ4tQg+KDchceI1A==
X-Received: by 2002:a17:90a:e7cd:: with SMTP id
 kb13mr9901806pjb.10.1613580868549; 
 Wed, 17 Feb 2021 08:54:28 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:69b4:3f63:7c5a:6972:6781])
 by smtp.gmail.com with ESMTPSA id t21sm3063897pfe.174.2021.02.17.08.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 08:54:28 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Wed, 17 Feb 2021 22:24:32 +0530
Message-Id: <20210217165434.69298-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v4 0/2] checkpatch: add verbose mode
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

Add a new verbose mode to checkpatch. The verbose test
descriptions are read from the checkpatch documentation
file at `Documentation/dev-tools/checkpatch.rst`.

The verbose mode is optional and can be enabled by the
flag -v or --verbose.

The documentation file is only parsed by checkpatch.pl
if the verbose mode is enabled. The verbose mode can
not be used together with the --terse option.

Changes in v4:
- Change the type description format
- Group the message types by usage
- Make handling of --terse with --verbose simpler

Changes in v3:
- Simplify documentation file parsing in checkpatch
- Document a total of 33 message types for checkpatch

Changes in v2:
- Use .rst Field Lists to specify the type descriptions.
- Add a few more type descriptions to documentation.

Dwaipayan Ray (2):
  checkpatch: add verbose mode
  docs: add documentation for checkpatch

 Documentation/dev-tools/checkpatch.rst | 525 +++++++++++++++++++++++++
 Documentation/dev-tools/index.rst      |   1 +
 scripts/checkpatch.pl                  |  61 ++-
 3 files changed, 584 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/dev-tools/checkpatch.rst

-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
