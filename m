Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AF08F6C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nw57n8H2"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1F0C42204
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 08:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1F0C42204
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Nw57n8H2
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5GNRnHDrZbe
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 23 Dec 2023 08:14:05 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0300D42127
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 08:14:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0300D42127
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d3eb299e2eso15974425ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 00:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703319244; x=1703924044; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWY/DrbKpHrD7fzJ1z2jZBqElDolNrxGwdlBP2/yWF8=;
        b=Nw57n8H2lrhRmq3P5cOLzPM/wttrsjAhmfHIfPTauYI7gqh9kQQjGVxiMIh5jSDLAx
         uxYUw/npI8eYXWJOzRmMNW0F6JZAzlwJLjIFbzmvKfzr0sUqSdUuhMKyDBW4/cyYnsus
         U1XHF0bWGrOXH1Pu38lmpWuge3KBA5xNz3fSXR776tPEZzM4zp+kzjWSKTo3nGg3VOUT
         oITDp+/RRKbsOVyw29ITd1ktJ5GTRKmFbNPqtpQyFn280sAbVcOStrC5xchexW6wkFG3
         WyFk5M7qn3jVgg4OVMGdY816BrLz5ekikIniwZJPTtv9FUI0QyCaLIRd7e8y6Pa6Zneu
         MN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703319244; x=1703924044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWY/DrbKpHrD7fzJ1z2jZBqElDolNrxGwdlBP2/yWF8=;
        b=ZPPAmUrcO06GTt2ARe22vh8f4sgcTQyBhxVRMAV63jI4gNLz5YgrAkcr6nYYnwn7Jo
         qmNfB31qsI15u3HaB0fUc6m4gzREdTwh576xWnxzuQB+tX29uXoRIuWgkVrlOofDq+B9
         PxV7JgjHZa/Ps5WnH0bBbWPrQ5KUCEeuDy7/84cho/QLywyUq3ts/fiEqFevKSXMeoIq
         LKgBxooaj7KIunpLJOVpJfcCc4WQo5WCwppJ0k9C4ZS9x7xixkyrc/47ewiyBintpbFR
         1uq6uFfRLgUxaAq04Q3R8SR5vw3zwUPuudWcLs+2IPmAiiPk1rsFAaWEuW2pAQiWF1yb
         bPBA==
X-Gm-Message-State: AOJu0YzS3nw/oCy9af2rL4wZLeOcU/X6S8zRUYp6K01igBGwDGTAAdX/
	w1BOwRm/DTYl6FThT+Gmb0A=
X-Google-Smtp-Source: AGHT+IEbzbGvxC0VlmUd4kvcsYMPpJni2HxqelHej4BgKav2uvZ4yLinClyCCZgffXUfCLVIYLFwuQ==
X-Received: by 2002:a17:90b:f0c:b0:28c:2b2c:1bf4 with SMTP id br12-20020a17090b0f0c00b0028c2b2c1bf4mr115808pjb.15.1703319243544;
        Sat, 23 Dec 2023 00:14:03 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id pb11-20020a17090b3c0b00b0028c2e36c449sm750776pjb.51.2023.12.23.00.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 00:14:03 -0800 (PST)
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
Subject: [PATCH] staging: media/atomisp/pci/isp/kernels/macc/macc_1.0: Fix spelling mistakes in ia_css_macc_table.host.c
Date: Sat, 23 Dec 2023 13:58:54 +0545
Message-Id: <20231223081354.83318-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in ia_css_macc_table.host.c below:

'''
./isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c:22: matix ==> matrix
./isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c:39: matix ==> matrix
'''
This patch fixes these spelling mistakes.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 .../pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c
index 946b074e8288..d25bf59273ba 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/macc/macc_1.0/ia_css_macc_table.host.c
@@ -19,7 +19,7 @@
 
 /* Multi-Axes Color Correction table for ISP1.
  *	64values = 2x2matrix for 16area, [s2.13]
- *	ineffective: 16 of "identity 2x2 matix" {8192,0,0,8192}
+ *	ineffective: 16 of "identity 2x2 matrix" {8192,0,0,8192}
  */
 const struct ia_css_macc_table default_macc_table = {
 	{
@@ -36,7 +36,7 @@ const struct ia_css_macc_table default_macc_table = {
 
 /* Multi-Axes Color Correction table for ISP2.
  *	64values = 2x2matrix for 16area, [s1.12]
- *	ineffective: 16 of "identity 2x2 matix" {4096,0,0,4096}
+ *	ineffective: 16 of "identity 2x2 matrix" {4096,0,0,4096}
  */
 const struct ia_css_macc_table default_macc2_table = {
 	{
-- 
2.39.2 (Apple Git-143)

