Return-Path: <SRS0=c16L=HY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BDBC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 07:52:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DE0664DDC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Feb 2021 07:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DE0664DDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C98585B81;
	Mon, 22 Feb 2021 07:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ycz6BFcbIXAj; Mon, 22 Feb 2021 07:52:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 27B52859FC;
	Mon, 22 Feb 2021 07:52:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09E20C000A;
	Mon, 22 Feb 2021 07:52:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CC72C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 07:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3568A6F530
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 07:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XeVqdRzrUYso
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 07:52:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 292846F525
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 07:52:02 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id j12so6072347pfj.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 23:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRdSl2m/DMw9bKAYBWJVHZp5b5x9JGXOXuV0kEEo+DU=;
 b=V7GyxQv+4AvJQ6fvEkKee4b+z+sdzaBU7VwJ3OuVYzc/xPDATqo+h+7sikRDqoFqnx
 nzN09NkHOknF9HZpI/SmcRKsdVLqj6sDI3jtcdwYqqm4zTZ+86fsGerBsanQZ9vo1U2i
 nJocEX7YK8zCMUN/2qmn5gPG13d7Thj+YdpuANMSfwZPi/guEs5ZKbMq2qt58VbzD6OF
 MzjQozqZyBKLw3zPiQH1PE9DETFFPZp7dyV9w3G7SKfdFujZ92SeWWy3q7hiWjsJVfac
 nayaFLfI2iUAmAG6uYqQ8qrtiLYKh4a6iMFyqctv05VEOdOF9FAMTW+rJwzjEO93iuOR
 sjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRdSl2m/DMw9bKAYBWJVHZp5b5x9JGXOXuV0kEEo+DU=;
 b=V6fctexvbK5AfC3V+0guxjeGe64kFHIJvnpT7Tuloc9OncgP84IHTj8vyt2Rqr3Bzj
 cSbrhjUpUJPgLST/KLBqToVAHD1UrngxKXBA6EhfDRnBWqAbeLhTliOGK/7ei17j3HJr
 zrcGNykOqoYaiSemYM5DF3w4o2zO2cI0SisKGIoa44hqwbJPByqPKssMcYwn/BsnX1f7
 MVqlKRL1Zk3Tv/kVSDGzp82aXGmfccCgFe6xbjG5fleiR3MeRDtNgtiNghixcqeB6Cjb
 O2E1beP8kVH19V+tovPcH+B9Gcp5Jg696+Vz6lKSOCCR2X6KeHXHSYpod3NfiJPLekWS
 WMIg==
X-Gm-Message-State: AOAM531tqdgBLPddCL0Zguf5gkJKt1z+jCNyFKvuEWOUbiSDbEZJd7WA
 by3AWDzUdHqAD3UMfOV0QNc=
X-Google-Smtp-Source: ABdhPJyaCJTv0MM/9NNtnTu5jhVRvMA+OT2i3iufHlLkw+IkvGydM5/vNLM0LErty1D3EoVLhuJ25A==
X-Received: by 2002:aa7:80cc:0:b029:1da:689d:2762 with SMTP id
 a12-20020aa780cc0000b02901da689d2762mr21072088pfn.3.1613980321393; 
 Sun, 21 Feb 2021 23:52:01 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6a36:aa32:eebb:1da7:c90b])
 by smtp.gmail.com with ESMTPSA id br2sm2651665pjb.40.2021.02.21.23.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 23:52:00 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Mon, 22 Feb 2021 13:22:03 +0530
Message-Id: <20210222075205.19834-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v7 0/2] checkpatch: add verbose mode
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

Changes in v7:
- Add color coding support to --list-types option

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

 Documentation/dev-tools/checkpatch.rst | 525 +++++++++++++++++++++++++
 Documentation/dev-tools/index.rst      |   1 +
 scripts/checkpatch.pl                  | 133 ++++++-
 3 files changed, 639 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/dev-tools/checkpatch.rst

-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
