Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D29DC35240
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:00 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 536502070E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:59:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzePr+ho"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 536502070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0A6E12157D;
	Wed, 29 Jan 2020 16:59:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7fTbCn3ewyF; Wed, 29 Jan 2020 16:58:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2A7002156F;
	Wed, 29 Jan 2020 16:58:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14B35C0178;
	Wed, 29 Jan 2020 16:58:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2C59C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A15A685F82
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id weyUuvnDq9cV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:58:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BC8008554A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:58:54 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id u131so52475pgc.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 08:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eD+vRWY6gNxHaAV067ybERz640J/iRSAZ6Igbxb8aJA=;
 b=LzePr+ho2mkMe7rrNfWRFX+CZgPIUeo9UTtw7QPUjt74C05Xi6AAXoWzxFDL2OQfPp
 XE2FnCXuNWtEkD/9MhuOc0BEN8hJQVcJSk0VoOav/PF4eEwSLVcoaxWJx6WMjSwDBfh7
 biWGjzQFxbwgYH1YlpeSbMZ510lZq8uTMreaXWXUfG/QwipOfChGjk4lc3CX929NjZ8Y
 JJ7yLtWJb94bl2oW/deQvXy+zQbzP2C/lULG6lAE3iD9OUOyeqZ6EC1iegdxOTKyl0xh
 qpbnFODvHEN0BVVdDv3/cBdVL64i/V26f+QaUYHB9aVHPaC2TAo0B9kqXR0nNkOK8MaU
 76+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eD+vRWY6gNxHaAV067ybERz640J/iRSAZ6Igbxb8aJA=;
 b=pwR0975Oa6FCA1rMHvgbrw3cOvIfy+5H3gkjp3qEbew5AjK3i8F2kMGxMJ4AssbtSK
 z/xGwkix+V6QidZSliUBXQJHdgSVMJaVHFwQVlZuQSQpXxXPm6QFwmGC9lpDTSqI//YS
 7BvtqqxGjjvV4O7i8qxdvQpVBn3/w53bHGPYRHCqLqCofKnXrmvonIKbNFejsIKIDgUR
 VEtOEq74p7lNEAEuFB/+IMD5ba81YBAP9anV5oAYqFPaN2wlBe6/WROIdnsWO9BdIRmP
 30XzTNfpbp122Mn+yikT/Ej+ZxbUgJNGRTvfC8vuzHDQPnMc1d451Zc4MlT1EHR6L/Ar
 mA2Q==
X-Gm-Message-State: APjAAAX4hBDlwww701ja8qMMirHRYIZ+X9If3JrM7NgUDNEGX6gqY9ay
 RQfMWG6EL4ntHu3RVpPlvKk=
X-Google-Smtp-Source: APXvYqxs/Jl7PMhYtjwLBwzCSSLuYsfivJj3Uv7KEyLY8Gtm/XNRdAwennWZZ0/+2Dr0Yhxg6rPsYg==
X-Received: by 2002:a65:66c4:: with SMTP id c4mr32175251pgw.429.1580317134361; 
 Wed, 29 Jan 2020 08:58:54 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c92f:3ccd:49ce:a9e3:28b5:cf94])
 by smtp.gmail.com with ESMTPSA id f8sm3223610pfn.2.2020.01.29.08.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 08:58:53 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Wed, 29 Jan 2020 22:28:13 +0530
Message-Id: <20200129165832.10574-1-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 00/19] Renaming some identifiers
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

This patchset renames following nineteen variables in exfat.h
Fix checkpatch warning: Avoid CamelCase
 -Year->year
 -Day->day
 -Hour->hour
 -Minute->minute
 -Second->second
 -Millisecond->millisecond
 -FatType->fat_type
 -ClusterSize->cluster_size
 -NumClusters->num_clusters
 -FreeClusters->free_clusters
 -UsedClusters->used_clusters
 -Name->name
 -ShortName->short_name
 -Attr->attr
 -NumSubdirs->num_subdirs
 -CreateTimestamp->create_timestamp
 -ModifyTimestamp->modify_timestamp
 -AccessTimestamp->access_timestamp

v2:
 -Correct misplaced quatation character in subject line(s).
 -Remove unnecessary '_'(underscore) character in renaming of identifier
  MilliSecond.
 -Drop commits renaming unused struct members.
 

Pragat Pandya (19):
  staging: exfat: Rename variable 'Year' to 'year'
  staging: exfat: Rename variable 'Month' to 'month'
  staging: exfat: Rename variable 'Day' to 'day'
  staging: exfat: Rename variable 'Hour' to 'hour'
  staging: exfat: Rename variable 'Minute' to 'minute'
  staging: exfat: Rename variable 'Second' to 'second'
  staging: exfat: Rename variable 'MilliSecond' to 'millisecond'
  staging: exfat: Rename variable 'FatType' to 'fat_type'
  staging: exfat: Rename variable 'ClusterSize' to 'cluster_size'
  staging: exfat: Rename variable 'NumClusters' to 'num_cluster'
  staging: exfat: Rename variable 'FreeClusters' to 'free_clusters'
  staging: exfat: Rename variable 'UsedClusters' to 'used_clusters'
  staging: exfat: Rename variable 'Name' to 'name'
  staging: exfat: Rename variable 'ShortName' to 'short_name'
  staging: exfat: Rename variable 'Attr' to 'attr'
  staging: exfat: Rename variable 'NumSubdirs' to 'num_subdirs'
  staging: exfat: Rename variable 'CreateTimestamp' to
    'create_timestamp'
  staging: exfat: Rename variable 'ModifyTimestamp' to
    'modify_timestamp'
  staging: exfat: Rename variable 'AccessTimestamp' to
    'access_timestamp'

 drivers/staging/exfat/exfat.h       |  38 ++---
 drivers/staging/exfat/exfat_super.c | 232 ++++++++++++++--------------
 2 files changed, 135 insertions(+), 135 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
