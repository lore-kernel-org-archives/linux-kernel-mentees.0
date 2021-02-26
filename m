Return-Path: <SRS0=B4mk=H4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266D7C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 09:38:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E52F64EED
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 09:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E52F64EED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B226F6A5;
	Fri, 26 Feb 2021 09:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BDLrxhKCb2IA; Fri, 26 Feb 2021 09:38:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E17B6F48E;
	Fri, 26 Feb 2021 09:38:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB78AC000B;
	Fri, 26 Feb 2021 09:38:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F0A0C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E912642FB2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQItJYuUmMmX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:38:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F91E431CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:38:31 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id o6so5750959pjf.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 01:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zPJxlvDtqyS+QVulOcRddj9Qq62vU/rkbUisQE4o2V8=;
 b=UBJJEceql1d/vuTPvNuSeQPwIKFdI4tM1iC/6Um9d7d1TeInPATInyvQ6w7FVqBgZQ
 A2tDUzL7uzjVQzeEd/9yTNWQ7vj/Mb3lAPx2ygqidht6DmG6ys24Wo57CQvfBkUCuOUF
 TfD4DsZJCyhnHQm8l53gXO90THkIDTtnUHXf8OObtHfetF7aWku5lHlBoB8oJGI4opR7
 53yPZRuq1wDObpb85lhfAa6xBPf47D28ukEs9BBwmM89A5gwLu2SlJZIO6XAJldIO+aj
 ErRobQmFosUeF0Yy0vwXJlqgZKhcJH6Y7JupgHFJ+oB9Tfoozb0CoBt8E5zijT4nWopc
 qsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zPJxlvDtqyS+QVulOcRddj9Qq62vU/rkbUisQE4o2V8=;
 b=fcmlD8UITOYdV+UcgVkKRBDDqtpEFpNbIMitz4NwJwb+r7jybrbgAMXY2dQfg8fSqQ
 7V3MAOfECGnzoI3Cs1VHfirEGUtcjV4INbS01RTrGezsmsRP3v+YizfzhxTaxqpnJTzg
 fMbNZZPZ+8+exBcXs12JKODgMnCK4L8VOi9U0fEfg7wV8ocFU0uowE0wqg1z2CJC5geV
 kKfw7t8G6zdeHIYozIJrn6rCdtw8CuJGYlEdRD5URS6rH2foMawZTVw08CRF7G1mVham
 V2V/JYRZA0mmQFVw67DZG0l/U7qvoBrzyHqO5JeVb9q0McZw4B1a/2XhE4eIyO1jxmXg
 a65w==
X-Gm-Message-State: AOAM530AuxBuo2VEZ8iiRdiekl5pVTJUcGCF0opa9V4aQdDoBtlv7Ht9
 hjcoBOibx1cuY8nrC6cFpTk=
X-Google-Smtp-Source: ABdhPJxn1at9tHb3fbqBCb35cWozOLn/ktt9MhDH3+IDPw7urhhpsmoSL1D/qIsPxttvfeW0T5NJfw==
X-Received: by 2002:a17:902:b781:b029:e4:545d:77 with SMTP id
 e1-20020a170902b781b02900e4545d0077mr2259006pls.59.1614332310589; 
 Fri, 26 Feb 2021 01:38:30 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6adb:2468:cd7e:b0b6:7857])
 by smtp.gmail.com with ESMTPSA id n1sm8548833pgi.78.2021.02.26.01.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:38:29 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com,
	corbet@lwn.net,
	mchehab@kernel.org
Subject: [PATCH v8 0/3] checkpatch: add verbose mode 
Date: Fri, 26 Feb 2021 15:08:24 +0530
Message-Id: <20210226093827.12700-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
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
descriptions are read from the new checkpatch documentation
file at `Documentation/dev-tools/checkpatch.rst`, which
is also added by this series.

The verbose mode is optional and can be enabled by the
flag -v or --verbose.

The documentation file is only parsed by checkpatch.pl
if the verbose mode is enabled. The verbose mode can
not be used together with the --terse option.

Changes in v8:
- Remove custom table of contents from checkpatch rst

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
  docs: add documentation for checkpatch
  checkpatch: add verbose mode

Lukas Bulwahn (1):
  MAINTAINERS: clarify responsibility for checkpatch documentation

 Documentation/dev-tools/checkpatch.rst | 513 +++++++++++++++++++++++++
 Documentation/dev-tools/index.rst      |   1 +
 MAINTAINERS                            |   9 +
 scripts/checkpatch.pl                  | 133 ++++++-
 4 files changed, 636 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/dev-tools/checkpatch.rst

-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
