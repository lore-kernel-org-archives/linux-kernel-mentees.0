Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2397C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Nov 2022 11:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8336D40423;
	Mon, 14 Nov 2022 11:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8336D40423
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XSsHqQQF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eS7wY8ukRRUX; Mon, 14 Nov 2022 11:53:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7990E4019D;
	Mon, 14 Nov 2022 11:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7990E4019D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55D20C0032;
	Mon, 14 Nov 2022 11:53:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29800C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Nov 2022 11:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC1B480C2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Nov 2022 11:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC1B480C2B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XSsHqQQF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VmEN3xxKnkqT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Nov 2022 11:53:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26DB080BFE
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26DB080BFE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Nov 2022 11:53:35 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id c2so9819452plz.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Nov 2022 03:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hk+Ng6HzdEIcxEdrVoC5xdXSCCrpPQX/sVOx2Fc1RIU=;
 b=XSsHqQQFR8a+jzglZGxrXAFL9CywFjxS/ReTLiwH6YBiTS4TZcDe60UCsGDeSSmFoz
 /WGYg9BAcVn9Ndl0EcjAiPgjot0FOIB/o/4N8SJEjNA1mQddh93SbRNfGxsOQgOozsFD
 E18Ch1DrCYA92fARFXicfyxie5L6+hsQ/F2p6uDe9R1bpEPDBoo6UtVCgZzs3juahDPa
 OkCGZCRdUUQ8rQAypKWsERASJNPyKtM5X9BohXZ2E3XYIHfuzJwmDJCiCHrJE5cNx3Ra
 nE98MaN7VB55HtQBLUSQqEpilE0hKSY5MfbPDIdklhLd8q+c8rkDlP60Qyi/3bQTHIni
 Di9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hk+Ng6HzdEIcxEdrVoC5xdXSCCrpPQX/sVOx2Fc1RIU=;
 b=oup7u5LSDZiyfVIlDayDwct2ujiFvtxub6yPPwx/Wh+az9a239V5Sb4LWL/2k5EPj/
 VIjalGMX2wIgGh0ou3CM6mcdPpOfWQd+65I/Y3zz230dRm5jIEkNDm80bZhmSSfCeqtW
 lHZIAMUACTwWFZajBzoRviY/BnbY07dQi3OHVNmzbUrB/wDsq/3WApYs0xi9YjH4uU8o
 iD7poa4BtK3CwwhL4+dHs8okcKmIgS+3KkKxNFr4yjlPg+/94Kde4tKb+R1pIy1peP1/
 EKUk/c7N0tx9B+gV5a+7jqmTYwWhJVZ9pqL8GgBV3CJ2fL8NtIBkLM4zTcAUdhh4iYsN
 JSKg==
X-Gm-Message-State: ANoB5plwP+qGD8+jp4Nr9irF2AHqys4dD+KeDjqlL3WkITASppwU/C//
 jePV/OgJVcjR1vqF10R+JS8=
X-Google-Smtp-Source: AA0mqf59B2DO9ZPDLarWALVCW0QEKktkW/UTpAJO53Bv+6cCEY7rNVHY9Wxfvns5lFF5/ZGBg8dXtg==
X-Received: by 2002:a17:90a:a391:b0:212:fe4a:c378 with SMTP id
 x17-20020a17090aa39100b00212fe4ac378mr13592444pjp.82.1668426814474; 
 Mon, 14 Nov 2022 03:53:34 -0800 (PST)
Received: from localhost.localdomain ([103.158.43.16])
 by smtp.googlemail.com with ESMTPSA id
 d4-20020a170902654400b00188a23098aasm7248907pln.69.2022.11.14.03.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 03:53:33 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Subject: [PATCH v2] fs/ntfs3: Validate attribute data and valid sizes
Date: Mon, 14 Nov 2022 17:23:14 +0530
Message-Id: <20221114115314.183818-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com, ntfs3@lists.linux.dev,
 linux-kernel-mentees@lists.linuxfoundation.org
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

The data_size and valid_size fields of non resident attributes should be
less than the its alloc_size field, but this is not checked in
ntfs_read_mft function.

Syzbot reports a allocation order warning due to a large unchecked value
of data_size getting assigned to inode->i_size which is then passed to
kcalloc.

Add sanity check for ensuring that the data_size and valid_size fields
are not larger than alloc_size field.

Link: https://syzkaller.appspot.com/bug?extid=fa4648a5446460b7b963
Reported-and-tested-by: syzbot+fa4648a5446460b7b963@syzkaller.appspotmail.com
Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---

Please apply this instead of my previous patch.

Changes in v2:
 Correct the format used for the Fixes tag.

 fs/ntfs3/inode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 970bb7c357c7..763dd982a43a 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -132,6 +132,13 @@ static struct inode *ntfs_read_mft(struct inode *inode,
 	if (le16_to_cpu(attr->name_off) + attr->name_len > asize)
 		goto out;
 
+	if (attr->non_res) {
+		t64 = le64_to_cpu(attr->nres.alloc_size);
+		if (le64_to_cpu(attr->nres.data_size) > t64 ||
+		    le64_to_cpu(attr->nres.valid_size) > t64)
+			goto out;
+	}
+
 	switch (attr->type) {
 	case ATTR_STD:
 		if (attr->non_res ||
-- 
2.37.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
