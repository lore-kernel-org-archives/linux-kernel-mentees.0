Return-Path: <SRS0=0ifB=HX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A80CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Feb 2021 11:58:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E63C964EEF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Feb 2021 11:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E63C964EEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29442831BD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Feb 2021 11:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMH4ZmHNwikn
	for <linux-kernel-mentees@archiver.kernel.org>;
	Sun, 21 Feb 2021 11:58:05 +0000 (UTC)
Received: by smtp1.osuosl.org (Postfix, from userid 1001)
	id 36487831F2; Sun, 21 Feb 2021 11:58:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E53A831BD;
	Sun, 21 Feb 2021 11:58:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63CE7C000B;
	Sun, 21 Feb 2021 11:58:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D02DC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 11:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B2276009C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 11:58:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wLkodxkpuEqe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 11:58:00 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 3DD666E6E7; Sun, 21 Feb 2021 11:58:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 149F06009C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 11:57:58 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id 17so2591908pli.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 03:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PuTW0NO8el9VftnBi7d1E863EASjdSSJ/VHcBqzraRk=;
 b=ifgjMjriBGhWNkwI70jM7BEA8mKVNwjvolh720mk9gkYK9Pry2OQxlbUQej+U6FCGd
 Ayi3c0LWnxZU8fmgzEeEwoTDK2amBuB+ydWVvrC6kfSEz0zirAHdFPaO4GP/bks/3wgM
 PCD4sVI/B70XLuHMJp6CojQLAcvONx3cjRNdzki7jBJr5clFENs6H6MIcOCE0Cw1wsZM
 ZgEmBpwQ3SlfZTibAEVy5dWyGf7UbGk/DrCvWqAMakHvP+X6TLGCfpBw947ChEsuZay6
 Ly5SWiJjX1plOAOn53KQMQ11lgOuzeWVCc28slpgmAzIxZzJ9D1Bn3VCC4codXHPtuiI
 FKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PuTW0NO8el9VftnBi7d1E863EASjdSSJ/VHcBqzraRk=;
 b=SW3j+o7HZQTR9jXY1yuiiUtsiZDob8nj17rN9U1TygNcmAwoamNwhRG92ueB3ThzsB
 LlBjkADyHnoeBhzE9j6YXeiD/VJHiYzzoEGRctj0XDMNnqztJj51LNw/7Gl2Kd05JSEb
 xUzGBHYI5UcafEm3azt6aB+1SE5zcELCEkzis18LrBYy69vbn9/8xg+VQJ098BFWJaYX
 Ir4ciot1L4U98QQb+Yk2fApZYR89zwgClHCW4i+K18rVq8X2Ndd1cbsiFL0iP3eAuR4d
 +XH9EvFKTgdfga5VVVa7AVbG5PpyRRLmaaNEwMaL2dC18lhfYvEDmDQIPYsbZXO92fcU
 Q+6g==
X-Gm-Message-State: AOAM531UP0ZWOT4guMDY3+LI8BSsLjV95NuP88utiS5P2KEoR9yCzhEA
 D7jhvbdOQOFsI1Q3dfKf3Ts=
X-Google-Smtp-Source: ABdhPJykIeFlEGm/sq5p7mYj4xIHPcrhKnS/hfWZK7Ap/CtJ67E+DYJA1l7ROHSy2eDW68FQgIZMkQ==
X-Received: by 2002:a17:90a:af93:: with SMTP id
 w19mr18543481pjq.46.1613908678244; 
 Sun, 21 Feb 2021 03:57:58 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6950:6d00:817e:a84c:30d2])
 by smtp.gmail.com with ESMTPSA id r5sm15694563pfh.13.2021.02.21.03.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 03:57:57 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sun, 21 Feb 2021 17:28:00 +0530
Message-Id: <20210221115802.19788-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v6 0/2] checkpatch: add verbose mode
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

Changes in v6:
- Allow using verbose mode with --list-types option

Changes in v5:
- Change the reference format to use absolute links.
- Print verbose descriptions only for the first time
  a message type is encountered.

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

 Documentation/dev-tools/checkpatch.rst | 526 +++++++++++++++++++++++++
 Documentation/dev-tools/index.rst      |   1 +
 scripts/checkpatch.pl                  |  68 +++-
 3 files changed, 592 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/dev-tools/checkpatch.rst

-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
