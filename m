Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB2849899
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Dec 2023 15:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBYUHxUe"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CAA1400D1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Dec 2023 15:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CAA1400D1
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XBYUHxUe
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4TvR4iMfIgcT
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 18 Dec 2023 15:32:16 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 37CBB400BA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Dec 2023 15:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37CBB400BA
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d098b87eeeso27136125ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Dec 2023 07:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702913535; x=1703518335; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPnry4ABNCRoEF7YlhZVOqsWCrakY3lvjh/I9JX4fyE=;
        b=XBYUHxUe75r5GULWrATAyzaYcG63k2rJ9EWk2WnmkmMaa1QaDW1JCQRXx2qP6iYTTK
         2HE1Xz9l/OQjR+6OLg8BbQG/xlW6QL0dZmZ+ic2moLDkVQH5tbGU17gfweT87x6mhIJI
         +Sykk4vIu6cCQF6DnVVuCoLNqQNVTNyEvzzbeH9oUHuoEuWMVi/CzPXGFwul7GZVU4bX
         OdusGIOFg4j6+mf3GqqvymiyosvzgayDY1c01EVprQOCpnnQnSjXAr9NxYr/Nmcs1QDt
         +XDfBdmDNuuA+W5AkDHC6XIb9P5iJtNMwJ5lAecuXwatmjoyRvmS5M7+azrG7hWHnP2x
         BJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702913535; x=1703518335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPnry4ABNCRoEF7YlhZVOqsWCrakY3lvjh/I9JX4fyE=;
        b=FmfFRRY1qI0nKZCewbzkEfICNwPwFPWtrORi3aHUu3wZFXrsV0mceg3L3J5RPXsntw
         pBpTWe7Dp+zuXblNF0wrIunXKEkEeJoEPjpjFG8uvrpqb6LzfX5TAZ6uZaxF3ll2mnpT
         2k1r0DJ/6KtVx8k1eZQeDR1Df5A2Ck6+RCWRFD7g8Y5ObmbgtPkKMjTiyvMjEqhOX/nd
         D5TsQ9nMe+oeYCU8AIeInvpGQ4bsfppc15dGOq97stsY1sMC9rKLJMckw/GudNEGajy6
         VyggfrCEgznJ19l6fGEf91iYJ66b+OFzSpQXNyNyF25f8VBecHjEekVCksC8TDxEFN3E
         M7KQ==
X-Gm-Message-State: AOJu0YyhLe+DGxzAlUOcmNx1bAyEPIDaFqzJdmkgbokO6jZnKfBXrG32
	d2yLJy0qKO6glpgO7nnj/D0=
X-Google-Smtp-Source: AGHT+IGR6fcR7dY6sUS+4s0yRsbTxaaJhn99EhB3+ag/KdKrhMD/ddYr9LLElMWyaO+iubF7GhPEWA==
X-Received: by 2002:a17:903:2b0e:b0:1d3:6b17:5eb with SMTP id mc14-20020a1709032b0e00b001d36b1705ebmr10352773plb.49.1702913535439;
        Mon, 18 Dec 2023 07:32:15 -0800 (PST)
Received: from ubuntu.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id g3-20020a170902740300b001d39d4fa323sm4358415pll.55.2023.12.18.07.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 07:32:15 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] drivers: staging: media: atomisp: pci: Fixes a spelling mistake in sh_css_defs.h
Date: Mon, 18 Dec 2023 15:32:00 +0000
Message-Id: <20231218153200.450148-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script checkpatch.pl reported a spelling error
in sh_css_defs.h as below:

'''
WARNING: 'upto' may be misspelled - perhaps 'up to'?
/* The FPGA system (vec_nelems == 16) only supports upto 5MP */
                                                    ^^^^
'''

This patch corrects a spelling error,
changing "upto" to "up to".

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_defs.h b/drivers/staging/media/atomisp/pci/sh_css_defs.h
index 7eb10b226f0a..2afde974e75d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_defs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_defs.h
@@ -131,7 +131,7 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
  * invalid rows/columns that result from filter initialization are skipped. */
 #define SH_CSS_MIN_DVS_ENVELOPE           12U
 
-/* The FPGA system (vec_nelems == 16) only supports upto 5MP */
+/* The FPGA system (vec_nelems == 16) only supports up to 5MP */
 #define SH_CSS_MAX_SENSOR_WIDTH           4608
 #define SH_CSS_MAX_SENSOR_HEIGHT          3450
 
-- 
2.34.1

