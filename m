Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F428F6C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 08:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYQjuCRw"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EA1D60AC0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 08:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EA1D60AC0
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NYQjuCRw
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZ_yNHn1k6KY
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 23 Dec 2023 08:32:06 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 39D0C60AA8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 08:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39D0C60AA8
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-28be1240414so1953201a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 00:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703320325; x=1703925125; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltOi6r7fK9bfySPLwaQJXbTwu4MoVyIkyF1mw73/wow=;
        b=NYQjuCRwPz0t8gZSpMbxh9PIfNQSTM/JBNnAWYi/XSiBIo+L/d9bzFCAB7VOxgSG/W
         6QGj+IEn6ccsis3/cqdzkuYIMznDxs3hKPNW2Iwekpn5zWqKl4CccMtQroKO11r9iat5
         AoTNabP/RuOpE6DTvMdTQiD/1Gw+9lIpIFBQZAKUL1lV6KvZOoGTt6T5SBn+Oq972gzG
         VZ31dg02Wbh7rL9kjcd+SZx8FrMz9uT8jcKFrPv3m6lRTF4sFRLdNIq++vE4FcfidL0N
         Dbq8YISieMVqDNSMsn0T72IgrGQSKIgpqJqsgVGiRJ9SNYbh2fYIqBv/ylGUb569vq12
         6YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703320325; x=1703925125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltOi6r7fK9bfySPLwaQJXbTwu4MoVyIkyF1mw73/wow=;
        b=YZ80yuVMSwJsxei8U9AZAIErj4e6c974RByxbr2iFr9vNO/meGbIUo2kG4VdtAsrgJ
         4yLWYxv9iwZY5eZFRQZqAekqRP85Xd1uLIcY/SfFJrCxIwZj6bCZigKqRqe1ocDFRi9l
         39vMO5mARXZ8KauXM8vPyRLX2H/nqIyV9/UOCfiPZAxoU96kyQFsxDY/QzP1Vjoq9gkZ
         nBmtEeWkhBLwpsBE2LPIqd/v671QrDkwMFGMOoBB3bJRM7HGhAiUXmvm755JDAspkxG6
         t+B5P8A7pVVdmYWJ5FXUZ+uU0hStaUamN8O2X0bjeEdlOfvvjnDNE6gXpRYM5RNb9Iia
         0fNg==
X-Gm-Message-State: AOJu0YysW9ZiPAFWxJWhj2cGIGyBtfr5wLova60Dk99UP5DUYR2PjMU+
	hFzvOZN1MXSa2nb72QPqux0=
X-Google-Smtp-Source: AGHT+IF9s6B9AwwFBmikLvuFCZBc0WaXkD1epFSbGhnrvs9lMnWisGnxqwIEE/DC5z5Sax9vGjvWhg==
X-Received: by 2002:a17:903:41c9:b0:1d0:6ffd:9e06 with SMTP id u9-20020a17090341c900b001d06ffd9e06mr2270306ple.88.1703320325330;
        Sat, 23 Dec 2023 00:32:05 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id g15-20020a1709029f8f00b001d3e33a73d5sm4558658plq.279.2023.12.23.00.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 00:32:05 -0800 (PST)
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
Subject: [PATCH] staging: media/atomisp/pci/isp/kernels/hdr: Fix spelling mistakes in ia_css_hdr_types.h
Date: Sat, 23 Dec 2023 14:16:57 +0545
Message-Id: <20231223083157.84090-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in ia_css_hdr_types.h below:

'''
./isp/kernels/hdr/ia_css_hdr_types.h:60: paramterers ==> parameters
./isp/kernels/hdr/ia_css_hdr_types.h:62: Currenly ==> Currently
'''
This patch fixes these spelling mistakes.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
index 175c301ee96a..ecc98686f5cf 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
@@ -57,9 +57,9 @@ struct ia_css_hdr_exclusion_params {
 };
 
 /**
- * \brief HDR public paramterers.
+ * \brief HDR public parameters.
  * \details Struct with all parameters for HDR that can be seet from
- * the CSS API. Currenly, only test parameters are defined.
+ * the CSS API. Currently, only test parameters are defined.
  */
 struct ia_css_hdr_config {
 	struct ia_css_hdr_irradiance_params irradiance; /** HDR irradiance parameters */
-- 
2.39.2 (Apple Git-143)

