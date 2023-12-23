Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA4863D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 06:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oq2qplgb"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37FA742C21
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 06:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37FA742C21
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Oq2qplgb
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BQAShKpxlGc
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 23 Dec 2023 06:04:32 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7643F428C5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 06:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7643F428C5
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6d940d14d69so1699116b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 22:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703311472; x=1703916272; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FXkJe47tIZ6CS0rCi+p/41rd9M+SnrlGZxxaIAMxpHI=;
        b=Oq2qplgbDB1prYAsUy4EOGmtJCn/vheEnHEGsFr5vCnvucLFEwUa1TjNQo6A0YYXU0
         qb+6p4oIONad0Lhyt6lWHjgu5v/Hke7BVfVs59hI2xm1C7AzJmeRP4BbYJZ69tqeXCtL
         CnBQOwLm88dTFz2KKXMeFL/yUemalWbHqAW53onXT7U9jVQ3ElMjDjPTHs3SaDh/6Wgn
         toP/vKBhVezVaxIYEcNidFO8x7/VyzfQvFlJ+iq33/czhcp/SX0FVAoT4codVyBPYDKg
         ++VZErur1gEn789FfMfz5SYyZKUHHQd/162aisP8PXJ0Guhqy+iGanIYouT8tuh3qy4Z
         ijkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703311472; x=1703916272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXkJe47tIZ6CS0rCi+p/41rd9M+SnrlGZxxaIAMxpHI=;
        b=W64GuYW7MFO2MRrUVvVC5iOSVphxTORG3r7uL/Rx1xJBYBsadEtZZe0D8fRMZ0FOi4
         UMhprmuituDt8sNOAl4TIBcS+6NUr4n3LyB24U8CfPVve4GM/wwK7gAWu3imec4eqojf
         VZeqW19k0TYh0ImAnU0t+NclQXmQTwBdUw7qhodZT3BakKXFAQhokgStBePZlKF9UYm2
         fC+eUkWR0sfURqqSKklMIIW+v3ifWicmxDjQ5q9yShcSjpd/Q7mbhaTGshZm75pLvrfY
         qQ/JkQcpGTKZ+cekOJHXu25DrJUTwzGRE7lai8Y/nzKUT52hIV4p+mvQgDCrLQFP20Hu
         g/fQ==
X-Gm-Message-State: AOJu0Yzi+R7qsVHG9N7/Q1DNnaYjuM/y3rroIkfd+ttDCqFrw5U5baIU
	Xh/y9D0F9olo4UTya091U38=
X-Google-Smtp-Source: AGHT+IHOyCwfs7Vf2ci1UdE0M1SAzA3hPLcfvCDSsqlTXNEfg/W3ZBqqM/SLwNDrMh5AOSpPF80Png==
X-Received: by 2002:a05:6a20:4e11:b0:195:79a:a29c with SMTP id gk17-20020a056a204e1100b00195079aa29cmr1354700pzb.96.1703311471697;
        Fri, 22 Dec 2023 22:04:31 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id g22-20020a170902869600b001cca8a01e68sm4335750plo.278.2023.12.22.22.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 22:04:31 -0800 (PST)
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
Subject: [PATCH] staging: media/atomisp/pci/base/circbuf/src: Fix spelling mistakes in circbuf.c
Date: Sat, 23 Dec 2023 11:49:22 +0545
Message-Id: <20231223060422.77789-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistakes
in circbuf.c as below:

'''
./circbuf.c:27: whehter ==> whether
./circbuf.c:132: offest ==> offset
'''
This patch fixes these spelling mistakes.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
index d9f7c143794d..2f484ef9d4b5 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
@@ -24,7 +24,7 @@
  **********************************************************************/
 /*
  * @brief Read the oldest element from the circular buffer.
- * Read the oldest element WITHOUT checking whehter the
+ * Read the oldest element WITHOUT checking whether the
  * circular buffer is empty or not. The oldest element is
  * also removed out from the circular buffer.
  *
@@ -129,7 +129,7 @@ uint32_t ia_css_circbuf_extract(ia_css_circbuf_t *cb, int offset)
 	u32 src_pos;
 	u32 dest_pos;
 
-	/* get the maximum offest */
+	/* get the maximum offset */
 	max_offset = ia_css_circbuf_get_offset(cb, cb->desc->start, cb->desc->end);
 	max_offset--;
 
-- 
2.39.2 (Apple Git-143)

