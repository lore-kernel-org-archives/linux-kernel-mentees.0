Return-Path: <SRS0=TF4G=HP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_RED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911EAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 Feb 2021 13:15:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21E1764E43
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 Feb 2021 13:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21E1764E43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E077287460;
	Sat, 13 Feb 2021 13:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ErdqnZX8QOWM; Sat, 13 Feb 2021 13:15:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EA5AD873A5;
	Sat, 13 Feb 2021 13:15:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D817AC0891;
	Sat, 13 Feb 2021 13:15:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99585C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 13:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 870A96F5B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 13:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GoEICI0wEqZr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 13:15:09 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id A9FF96F5CA; Sat, 13 Feb 2021 13:15:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69FF66F5B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 13:15:08 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id cl8so1161358pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 05:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cn+ObC8FkHI1hXVsmi4O7zBtv2tqUAnYZVVASPYbG78=;
 b=Q/O0U2qxvyScJpNSCcH9bMDBaAgpuKjf4PYuf3L9D7a38xWtwY1s4ZpqRu3OfAmtb0
 IYKyZCMkI+4pvDLUeZEs4NfITlAYBCFQzRz/zm0xKcUOhKirSwRYOO/JKlUcDuwtT/mm
 UuoKxl6fCpqLw2SpPZjxdm7t4pWM/f9+iI4GksF6q70qp7PFovPVSDLAv0vc+3/tWEzY
 yvbIIV6HNVry5UjT/11HzwcnHZHcaXDEAEOIL8b2NKJ2lagNqoG4WXWbBJp3MYZiq+pc
 Sw+77COZxg/MiaEu4O6gdqxM06o9EprxWUaJ85woe8oMRIlBRk5oRStW0beEKozYF7kk
 ZxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cn+ObC8FkHI1hXVsmi4O7zBtv2tqUAnYZVVASPYbG78=;
 b=HjGsbULsdJHKSPzQdctdBMVRc06rBUhe4xtYH7chy8M9UEJnQA/x7O5GMgEV4nH2eD
 2MzPAvSomWXZYl7lsQgJgas2mTy5TUnXXNNbKHKX0Bprt9+FuLe50viKhzsIInJl5Ofv
 8R7JQLd/8WTwB7lW+OCkgYOAAxxlHhr9SSIbaBB/Y1CU426tugJ/DgEU1So406wtrDpA
 uTPI+1wCviGb5vCA1vqZqeWj5X3WfddeIgJpkHvIxj6YrSgXjwHZuNmo4r0mOls6tZoK
 8uzfYTYrNKT4tyqTdn7+nVGf8qhZ40UsfTR129W0me+XcPZR/fBfy0Zl4GgBdbkOx6E4
 98/A==
X-Gm-Message-State: AOAM530VwGrjvYBGElLNfsEoX2MCcSPgK22/dZFv7/53gbmSkWUyOf6N
 jaDI2xwLzsrcXGAXWf9JuSk=
X-Google-Smtp-Source: ABdhPJwd77/eDp3WtWfgfrvnO+EJmxx+mN8I88ZjGkp7BnLxSYYuuo8U2G7rTG+LRZ+05Tym2GY1zw==
X-Received: by 2002:a17:90a:d3cc:: with SMTP id
 d12mr7164295pjw.202.1613222107708; 
 Sat, 13 Feb 2021 05:15:07 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6ab4:5c97:80e6:be35:2e49])
 by smtp.gmail.com with ESMTPSA id p11sm833533pjb.3.2021.02.13.05.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:15:07 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sat, 13 Feb 2021 18:45:10 +0530
Message-Id: <20210213131513.51386-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH RFC v3 0/3] checkpatch: add verbose
	mode
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
if the verbose mode is enabled. The verbose mode is also
suppressed when the --terse option is specified.

Changes in v3:
- Simplify documentation file parsing in checkpatch
- Document a total of 33 message types for checkpatch

Changes in v2:
- Use .rst Field Lists to specify the type descriptions.
- Add a few more type descriptions to documentation.


Dwaipayan Ray (3):
  checkpatch: add verbose mode
  docs: add documentation for checkpatch
  docs: add documentation for checkpatch

 Documentation/dev-tools/checkpatch.rst | 494 +++++++++++++++++++++++++
 Documentation/dev-tools/index.rst      |   1 +
 scripts/checkpatch.pl                  |  55 ++-
 3 files changed, 549 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/dev-tools/checkpatch.rst

-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
