Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8728046A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 05:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqiAAQHr"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA4E482A0E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 05:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA4E482A0E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iqiAAQHr
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPqQVx9W0onh
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 23 Dec 2023 05:11:26 +0000 (UTC)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 09DE7820C4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 05:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09DE7820C4
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3ba52d0f9feso1906077b6e.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 21:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703308285; x=1703913085; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6EkT/azvdp1IApYTuFWMWihPRdkqSk2ylPHg0StEj/w=;
        b=iqiAAQHr81J2gE8CW4SDlSIaUJTJlwG0+mV11pdOjc7adknPhT4WbVf/KSgrmLy5Jq
         /VlLk+D/6OVq90arC4DPpKGOmOqOnL7GSfIIaIN9RdZlmlZ/oBnzNdmakuNAR7eKNFJc
         gG0iPUgpvOOToVv9KareHRtq4fgJA6bUb4kRZG6zPgREbussxyPZCPjyiSAPm/8w9W5u
         jzgusUTgBwcuFPbutOmbEUzDqHbKD89Utncvnh/Ce45ewRL7w+wBwft8DNqy5oZJII/m
         meZLrS/hzIrkt2LtXRPUJPg239J5Jen7SQZlCrDLPqD1t2xG91dYW9b8mud8ox2+9HQB
         oY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703308285; x=1703913085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EkT/azvdp1IApYTuFWMWihPRdkqSk2ylPHg0StEj/w=;
        b=D1GBknv5D5v8ivzfrkp19irdmgAJ+5aYmUjtx33CbM41uQIII0vizQJndzjdNmJEET
         F4L8x/n1+OHI2RIlVSzSX36h9JMs6Y0xFLmEhsflQCZCMXY8AIuOUoKbr0ILCAtzJ/po
         FoWwpc3dNGF0MQt3xN5wR0pxes5XJqx3IePhqVK6Pv6y/dk5MnegQAeKoI7S72GVYPbL
         g4GsjqIkmRK3c2AswFvDI3slQR+VZdp7aIF17za0AROyWLXyMezj0CgjRUF5OSnFNhSL
         LaElyGNhodjwhJ6eW045yU1qRVuomwOultVmWNxXiKu7Kaa0Nl3SXR8AZsdyiyDewY8n
         Rg9Q==
X-Gm-Message-State: AOJu0YwRQWirAsTBzHkHwqD/UB6WNsA1iFWqXvOiLNJdA0ghA9LR2Vpl
	ySfT/2FbMF7Z4fWJQL62OaA=
X-Google-Smtp-Source: AGHT+IG1PNTUKwu9bMQXjBLLbcz31IATHPAu7BsHiv2B1Wuu7Dhgv6JkzOan1nOid89nmtN0Z5yAxA==
X-Received: by 2002:a05:6808:169e:b0:3ba:1417:43a with SMTP id bb30-20020a056808169e00b003ba1417043amr3234390oib.42.1703308284964;
        Fri, 22 Dec 2023 21:11:24 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id p26-20020a62ab1a000000b006d9415b769csm4246653pff.169.2023.12.22.21.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 21:11:24 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] staging: media: atomisp: pci: Fix spelling mistake in ia_css_acc_types.h
Date: Sat, 23 Dec 2023 10:56:08 +0545
Message-Id: <20231223051108.74711-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported spelling mistakes in
ia_css_acc_types.h as below:

'''
ia_css_acc_types.h:87: cummulative ==> cumulative
ia_css_acc_types.h:411: descibes ==> describes
'''

This patch fixes these spelling mistakes.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
v2:
 - Previously only corrected spelling  mistake reported by checkpatch.pl.
 - All spelling mistakes reported by codespell are fixed.
v1: https://lore.kernel.org/lkml/20231222200350.2024-1-kdipendra88@gmail.com/

 drivers/staging/media/atomisp/pci/ia_css_acc_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
index d6e52b4971d6..1dc2085ecd61 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
@@ -84,7 +84,7 @@ struct ia_css_blob_info {
 		memory_offsets;  /** offset wrt hdr in bytes */
 	u32 prog_name_offset;  /** offset wrt hdr in bytes */
 	u32 size;			/** Size of blob */
-	u32 padding_size;	/** total cummulative of bytes added due to section alignment */
+	u32 padding_size;	/** total cumulative of bytes added due to section alignment */
 	u32 icache_source;	/** Position of icache in blob */
 	u32 icache_size;	/** Size of icache section */
 	u32 icache_padding;/** bytes added due to icache section alignment */
@@ -408,7 +408,7 @@ struct ia_css_acc_sp {
 };
 
 /* Acceleration firmware descriptor.
-  * This descriptor descibes either SP code (stand-alone), or
+  * This descriptor describes either SP code (stand-alone), or
   * ISP code (a separate pipeline stage).
   */
 struct ia_css_acc_fw_hdr {
-- 
2.39.2 (Apple Git-143)

