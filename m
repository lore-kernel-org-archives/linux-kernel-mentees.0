Return-Path: <SRS0=w6iK=37=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC4EC47409
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:40:24 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2593C20842
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 11 Feb 2020 12:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlZ44Cp4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2593C20842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0AF558739E;
	Tue, 11 Feb 2020 12:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BlO79bVIDuGu; Tue, 11 Feb 2020 12:40:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A09AD86EA3;
	Tue, 11 Feb 2020 12:40:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9165CC1D88;
	Tue, 11 Feb 2020 12:40:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1749C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8EFF58733F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W+NloMGVUnxs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 89D5586EA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 12:40:19 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id y5so5439946pfb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yA+BWfC41v7sN7/FMQVxmCc56IvmN2Onydier90xRBM=;
 b=AlZ44Cp4EzAxC2mEOY/YZHa3XOpAJLbuIfGtgIWpvcF6J6Ed06XGvOKNAg+HmDfEb1
 qUNtu3CuK7ekpsHnvbJ/EKmMkYE3dd6Qyilg4++kHOZa6yX4vsq80LhXrVA9Hrgv+WwT
 hmiweLgrtE36m/JxfHudCMLI8DkJParLFafOqEVjd45z8UoGY/DzyHAl5UaC2sdpeg9u
 nQXKDH6a2KI29Z0+SUEKcMeRBvztYJpYY88lXBOIhoSg6+jKPbQ3S1S58uPhtMZ2qyy1
 2LEJ7J5sXeb22E4gMDVYcDZpav8MkkdRjorrTrz+UC+YoqAa+SwcQt83Hcr5Ggk1SgNP
 80yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yA+BWfC41v7sN7/FMQVxmCc56IvmN2Onydier90xRBM=;
 b=j/sySOw3iqqRKpN7FmAOhafxCA+eSgNI0Me2iEbJDeFwU4koyVQLo7BI/Bxk5XVaim
 aWIiYYa+QEUeuQRc1pYe17RA0eZ9tLIJca2Ngmpr7TVgHo5Q06I+gXjz2mnC6I1tCYff
 /8dIkWmBinFlKisa+B/qpNfjtrZ0ohHmN1KsZDh6YYH6oH8Acc/ABA1N5GsortNeo+21
 9v680C11zUBi2zlHLFLhbzc1AM9v7EzuePqOKL0kTs+d/I3a+o53jbnr04wpk2yFjprj
 VCF/FmomLCJLzAMQF6ydvKERfVKsnEOkiRQM1BXzdax/GQFbK0uLtAu1lywxLgntM3B+
 9b/A==
X-Gm-Message-State: APjAAAVLefh5y1Jp1m9htn2oY0iB6mdaBZn2g+7qP3wGk2K2yg08M0xU
 mQ0M6ISUtOWXQzRy9ZloTGY=
X-Google-Smtp-Source: APXvYqyjoLPV52xzZXhOjrAFGK0sL31ZJwLKBgzsG7aHUr7465yvu6d8LIlHbK/SEBvE4Ee5t1FJmw==
X-Received: by 2002:aa7:8755:: with SMTP id g21mr6303821pfo.36.1581424819139; 
 Tue, 11 Feb 2020 04:40:19 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:69c:214f:144f:bb39:afc3:51b0])
 by smtp.gmail.com with ESMTPSA id d1sm3876789pgj.79.2020.02.11.04.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 04:40:18 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: gregkh@linuxfoundation.org,
	valdis.kletnieks@vt.edu
Date: Tue, 11 Feb 2020 18:08:41 +0530
Message-Id: <20200211123859.10429-1-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: devel@driverdev.osuosl.or, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 00/18] Rename some identifier and
	functions.
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

This patchset renames following variable and fucntions in source
Fix checkpatch warning: Avoid CamelCase
 -ffsUmountVol->ffs_umount_vol
 -ffsGetVolInfo->ffs_get_vol_info
 -ffsSyncVol->ffs_sync_vol
 -ffsLookupFile->ffs_lookup_file
 -ffsCreateFile->ffs_create_file
 -ffsReadFile->ffs_read_file
 -LogSector->log_sector
 -ffsWriteFile->ffs_write_file
 -ffsTruncateFile->ffs_truncate_file
 -ffsMoveFile->ffs_move_file
 -ffsRemoveFile->ffs_remove_file
 -ffsMountVol->ffs_mount_vol
 -ffsReadStat->ffs_read_stat
 -ffsWriteStat->ffs_write_stat
 -ffsMapCluster->ffs_map_cluster
 -ffsCreateDir->ffs_create_dir
 -ffsReadDir->ffs_read_dir
 -ffsRemoveDir->ffs_remove_dir

Pragat Pandya (18):
  staging: exfat: Rename function "ffsUmountVol" to "ffs_umount_vol"
  staging: exfat: Rename function "ffsGetVolInfo" to "ffs_get_vol_info"
  staging: exfat: Rename function "ffsSyncVol" to "ffs_sync_vol"
  staging: exfat: Rename function "ffsLookupFile" to "ffs_lookup_file"
  staging: exfat: Rename function "ffsCreateFile" to "ffs_create_file"
  staging: exfat: Rename function "ffsReadFile" to "ffs_read_file"
  staging: exfat: Rename variable "LogSector" to "log_sector"
  staging: exfat: Rename function "ffsWriteFile" to "ffs_write_file"
  staging: exfat: Rename function "ffsTruncateFile" to
    "ffs_truncate_file"
  staging: exfat: Rename function "ffsMoveFile" to "ffs_move_file"
  staging: exfat: Rename function "ffsRemoveFile" to "ffs_remove_file"
  staging: exfat: Rename function "ffsMountVol" to "ffs_mount_vol"
  staging: exfat: Rename function "ffsReadStat" to "ffs_read_stat"
  staging: exfat: Rename function "ffsWriteStat" to "ffs_write_stat"
  staging: exfat: Rename function "ffsMapCluster" to "ffs_map_cluster"
  staging: exfat: Rename function "ffsCreateDir" to "ffs_create_dir"
  staging: exfat: Rename function "ffsReadDir" to "ffs_read_dir"
  staging: exfat: Rename function "ffsRemoveDir" to "ffs_remove_dir"

 drivers/staging/exfat/exfat_super.c | 114 ++++++++++++++--------------
 1 file changed, 57 insertions(+), 57 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
