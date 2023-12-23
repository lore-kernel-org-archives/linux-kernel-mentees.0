Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7384DF4F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOoh8qHS"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33D9F60E5F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 14:12:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D9F60E5F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IOoh8qHS
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VGw7BXZhIogO
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 23 Dec 2023 14:12:08 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 49D8F60E53
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 14:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49D8F60E53
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6d92e736787so1450003b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 06:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703340727; x=1703945527; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RcWAiO/J2RUT1lMSrBsyv6HQ++CXdRmemGMqnXk/qZ0=;
        b=IOoh8qHSIzp+hwv0uqiAIV8Dow5QQemxqNsITl4ibhPIP7PJ9iyTipmcfxYS7kx+su
         XTORHug4+KtbL+XqJzUSrk81DU+CG6jNTXGreEp3SZKkq5YDsmuOorhsYxAFl9PiakEF
         GUZOPrx71d5D71jMppnQcQFuQhM/49R3NaTuFBYoVnelspFm6mLbjfGhpfgi78ac2PRV
         1P2O74npi6aIdyS0k8On3ZTXC7BpH+Nbwr9IMBHQtoJYb5MD1vATCocLWN1IZoRAYTIZ
         Tu94rYVfXkwGJSlL0MUQefLXZbB7pYGtmkvXJBni3w6MnoznJxd+uVYpm+XyNBzuD63u
         zvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703340727; x=1703945527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcWAiO/J2RUT1lMSrBsyv6HQ++CXdRmemGMqnXk/qZ0=;
        b=oKIj4fIAPt3y382GYYLHw5YTS2RfLuVUsqkIqmgQhai/WPa+b+6wqgkUm/D2emf8eZ
         o7GTC/zmJAk/NiVV9rgQck5/vul+Nobql4EUW1RRvpCXmZoyFS/FftG924LtXUQfdjy+
         IhvpHQ5PHeoHVASqLbIxOf6BpsT1hLePLcow0MxATmjF+CIYiL73CyqD/hH/VzUsiRKL
         FxHpBEzV8Hvff5g0RqxMlm0hjovJlvY9uU3f1e3WwRwpEkrbK9u/7nZHgBGIy3fzaIU/
         zmIa8ShqPtGfwM0oPNxe970UJq6CGyWoawDXIlUEFK83Bryz6skrI8TbcSriCYV3eub7
         YrLQ==
X-Gm-Message-State: AOJu0YzL1fekvuoWduar47v1yAkCnFsUknrs7JV704yYKRRYO7/5rBVZ
	06OMV21qtnOa2VRIRT9p8gs=
X-Google-Smtp-Source: AGHT+IFYeAJzjCtGqN8pOQ6BiQqvnuF6hC6mBzUQbrAwNGmTM/JKG4w2VvmT8t710VhK8KX2XEIbCg==
X-Received: by 2002:a05:6a20:4c92:b0:18f:cc29:3d9e with SMTP id fq18-20020a056a204c9200b0018fcc293d9emr1513778pzb.119.1703340727582;
        Sat, 23 Dec 2023 06:12:07 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id f17-20020aa79d91000000b006d9accac5c4sm260594pfq.35.2023.12.23.06.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 06:12:07 -0800 (PST)
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
Subject: [PATCH v3] staging: media: atomisp: pci: Fix spelling mistake in ia_css_acc_types.h
Date: Sat, 23 Dec 2023 19:56:57 +0545
Message-Id: <20231223141157.95501-1-kdipendra88@gmail.com>
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
Word "cummulative" is changed to "accumulation"
and "descibes" to "describes".

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
v3:
 - Changed "cummulative" to "accumulation" as suggested by Randy.
v2: https://lore.kernel.org/lkml/20231223051108.74711-1-kdipendra88@gmail.com/
 - Previously only corrected spelling  mistake reported by checkpatch.pl.
 - All spelling mistakes reported by codespell are fixed.
v1: https://lore.kernel.org/lkml/20231222200350.2024-1-kdipendra88@gmail.com/

 drivers/staging/media/atomisp/pci/ia_css_acc_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
index d6e52b4971d6..f6838a8fc9d5 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
@@ -84,7 +84,7 @@ struct ia_css_blob_info {
 		memory_offsets;  /** offset wrt hdr in bytes */
 	u32 prog_name_offset;  /** offset wrt hdr in bytes */
 	u32 size;			/** Size of blob */
-	u32 padding_size;	/** total cummulative of bytes added due to section alignment */
+	u32 padding_size;	/** total accumulation of bytes added due to section alignment */
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

