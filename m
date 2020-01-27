Return-Path: <SRS0=mlYZ=3Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C234FC32771
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:14:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880242087F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:14:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIaT3JXI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 880242087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7577B83616;
	Mon, 27 Jan 2020 10:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 41Qp8FuDjpee; Mon, 27 Jan 2020 10:14:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1705283608;
	Mon, 27 Jan 2020 10:14:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03552C0177;
	Mon, 27 Jan 2020 10:14:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A740C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2EBC820026
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1gtaR671n2k3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by silver.osuosl.org (Postfix) with ESMTPS id 12E492037E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:14:23 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id gv17so2922206pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 02:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rjuMryPmuzxZLUVwYOvSS2lNQu9Hy6NwM2Wa5WwZ6xE=;
 b=aIaT3JXImsy3aXbKYi0Fcxeg5tlE90D5qQ+/NZKcO4TVgWecuPHqGJsUbrSmKtDgGB
 GetCxUnOH3jlCLK4X3IZVxO2+rwAljH3wYN8claKhhKoEfKvyQ2kgliBNpVQN7TYV2JV
 xrxKK+jQhyRHl8kZ+CIjgyS/RorI4GS22dGYldq66JErRq5/IZAm4PRPL0OpGKT+JDQm
 a+eMP1kKjByOma4Qmcqgz19PYqNT+KUhiuZOESUYJ8hV+yFDASSNLRToNzMo4DV1w0eT
 G4h2KrrFInoOG33Zs5vYQlHLDUIdllq8ub6NbvbqgCVVllVA1H3JUNf7ecxYslItKpvL
 89YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rjuMryPmuzxZLUVwYOvSS2lNQu9Hy6NwM2Wa5WwZ6xE=;
 b=n/Hq+3lUHoECsc70C6tEgrQFVqRorR7wmziV4Ix7ddjBiftDRu3TlXJaMgbIjX9zhZ
 bzgwdBli7nL2xdeBpzaHL3mEm72RnjvuqUJANUuXSQ0qaste2h+En7YH/7uKorMOXx9h
 LW3dL4to99ljDnhgbTlyng4q0ybccDV5cy9N6AVVZVmUJLwzPZQpo6lzI7aR4ZYZMYz+
 W0/zJaw15RhtganBRtyWY0a0Mh2Log8xP4+CQZWaWoYZ6FcKqMIOGCQRloGgcltXdGKn
 g/I0AUaRrCfWMfp2A7j3rfG6i6Atn5d/o4oC1lDiEZ7NLWj0ykisAq+GouVy/OnTkE+S
 CTpA==
X-Gm-Message-State: APjAAAWLbwhgk3SfptSeA4tB0RgkzMEskrLp3b4zTybtNlK5250mbNXL
 eK4t0YQ20C6ozPtNldiorx0=
X-Google-Smtp-Source: APXvYqz6f38Z1esCAAN37J4nFDTF0Db9fcFJcPrHXU/kX5lJJbqNF/Kia27iIdRvwyJKHx5omIfHsQ==
X-Received: by 2002:a17:902:8d83:: with SMTP id
 v3mr17289956plo.282.1580120062576; 
 Mon, 27 Jan 2020 02:14:22 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c902:a5e9:3956:8df2:aee5:9cf6])
 by smtp.gmail.com with ESMTPSA id s15sm15504138pgq.4.2020.01.27.02.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 02:14:21 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: valdis.kletnieks@vt.edu,
	gregkh@linuxfoundation.org
Date: Mon, 27 Jan 2020 15:43:21 +0530
Message-Id: <20200127101343.20415-1-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 00/22] staging: exfat: Fix checkpatch
	warning: Avoid
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


This patchset renames following twenty-two variables declared in exfat.h
Fix checkpatch warning: Avoid CamelCase.
 -Year->year
 -Month->month
 -Day->day
 -Hour->hour
 -Minute->minute
 -Second->second
 -MilliSecond->milli_secnod
 -Offset->offset
 -Size->size
 -SecSize->sec_size
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


Pragat Pandya (22):
  staging: exfat: Rename variable "Year" to "year"
  staging: exfat: Rename variable "Month" to "mont"h
  staging: exfat: Rename variable "Day" to "day"
  staging: exfat: Rename variable "Hour" to "hour"
  staging: exfat: Rename variable "Minute" to "minute"
  staging: exfat: Rename variable "Second" to "second"
  staging: exfat: Rename variable "MilliSecond" to "milli_second"
  staging: exfat: Rename variable "Offset" to "offset"
  staging: exfat: Rename variable "Size" to "size"
  staging: exfat: Rename variable "SecSize" to "sec_size"
  staging: exfat: Rename variable "FatType" to "fat_type"
  staging: exfat: Rename variable "ClusterSize" to "cluster_size"
  staging: exfat: Rename variable "NumClusters" to "num_clusters"
  staging: exfat: Rename variable "FreeClusters" to "free_clusters"
  staging: exfat: Rename variable "UsedClusters" to "used_clusters"
  staging: exfat: Rename variable "Name" to "name"
  staging: exfat: Rename variable "ShortName" to "short_name"
  staging: exfat: Rename variable "Attr" to "attr"
  staging: exfat: Rename variabel "NumSubdirs" to "num_subdirs"
  staging: exfat: Rename variabel "CreateTimestamp" to
    "create_timestamp"
  staging: exfat: Rename variable "ModifyTimestamp" to
    "modify_timestamp"
  staging: exfat: Rename variable  "AccessTimestamp" to
    "access_timestamp"

 drivers/staging/exfat/exfat.h       |  44 +++---
 drivers/staging/exfat/exfat_super.c | 232 ++++++++++++++--------------
 2 files changed, 138 insertions(+), 138 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
