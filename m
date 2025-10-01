Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AAC2D7DC3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309048; cv=none; b=VNyrs59GbCC9l4UCKjQsXVYRtNnjbkA5hBt/f8FDCnNltdQZ47KLf7A+565fI5LcGHJYjbnTOI4epq1ApcX0+QC7EDdXHn9iELFH+KBpm7IEsEykEGAXTwW6pP9twuD770hT+6X+dk1YqqfLk3Z+w7VJK7Yo9wVczGxf6rhDOTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309048; c=relaxed/simple;
	bh=k9SxVIm4/yH7EwdOtG9iVyaWlVa8cX/lDmaADceMdq0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oCkdSbRGUlFiaDeqc7qsz8CQtIRHQqxQY9dQHZBPYFiXxxgmpYUw5egC9qptSibr7oQG8KoThUw92aLpIfj63r+XKC4P93lRPDPADotDl42tyoeu96uUom/8V7qUFw0RnImL70TeLGdAoSULQ7olxJV/w7L06Ek4tVn6srOw2mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiK5vom4; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiK5vom4"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF72E612DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 08:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnetjrz_x63K for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Oct 2025 08:57:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13AB2612C8
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13AB2612C8
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jiK5vom4
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 13AB2612C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  1 Oct 2025 08:57:25 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-782bfd0a977so3334562b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 01 Oct 2025 01:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759309045; x=1759913845; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRXPyeGU3kLEllAg/cKWCvTTzigpysI7ZlcrsfYX+pA=;
        b=jiK5vom4lGZz/+syuOIM44GDXoeYYvQYAwOy47949ZPUpm6AWl3veFv5FQ7dr+0Bn9
         SUdG5FQLLs+cHLg/DorjHH26hNoMXPDLqZJxZPnTbKy1f6lhIcUfuo3BCC0quHLRM0L0
         rhm1hcVZNjaRtHqnDmrwcZ+ifNp2cNHZgnVG47lnvvhsG2pOM2C/mUyGbdJIyW9cEI9p
         WX0XOOhXLLISuD84tMjyQRCB9KaTNvdr0C7wVOVpQUWaokBl8K/dO2vOM80BUiK/fF6X
         2aV866JECsXBLh7QIFLhPp15BZ8TTrhiRhtyE0nsEVtXwfiSiwXdX49MpTjZITuptBMH
         mnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309045; x=1759913845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRXPyeGU3kLEllAg/cKWCvTTzigpysI7ZlcrsfYX+pA=;
        b=ar7r1IK0dh83V+2Ue9E6wcpniXjXDpL3K0bX4q47tf20qfQeM/uIxu8/SbKrDL9+qf
         XvXRCPREHZbvcywSxGj3OTA1GrPgvyTitkFBN/KPV+hKkIAaXOo5Zl3lq7pK9bi33fg3
         LQQeACuBtlUbNKEP8B9qRunmssnclipl0ON1NgLv4cY6ISQ9IeC6UXkOn5TgZgW24gv0
         mzBogOU7iznJD7Rf3me/M8Z874eiJrBp2wwK35kyt2mYhPNiEl9MFUgBjiULCv2YCLFH
         mfyisgxCcfrfZYULSpbXRC9dvHCPLpuT4Q4yyqfeYjrNay+VhB1ni9xJ4v0GcISkxWhd
         gU0g==
X-Forwarded-Encrypted: i=1; AJvYcCX6OVKurNePIH5TvqoKaHbsReRsxaPg0wC8jb9GWmcXrOzaxbwhLCxNaYk68Ls9+Cu4058KYtA1Ht8f7uAaKtNRElWPBA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyT+ujH+8oXgSFaXFg09Fofi6zAN12PO8nH5rkbdgYDo+VZ8Mkq
	Ji+lQF2NRvrXV79SeIOvFWUPY1ehjb7gvNMlfTVPyU2PWEOmaWsvnrUV
X-Gm-Gg: ASbGnctZK0S+G5KmCu9Yn20Y1bmSNmrWzcaDHJ9GpbPVukfQOFBeaK2A9gAE2pi17bB
	OSC59OpR9hOaG52DtbIBymyVunl3xlwUHmDAdpPO5uYCUizLCvU/7NG6LggW1tZAGHtk/vnBvnN
	BGLxQaDlH9E5xcMoeuA/Aht53MDt7UTSojcSp1yv1FGhAOF5J57sBSRAMmUFyOSZAPE/K6fQs6Z
	ejGxQZaQ+Z4XjBLesZGsUKMWKj+7UeFuuB9q8PPa98gRWfk39S3HvtSzqr/xvSYbfDo5wgBnncc
	KCt/fReltpQ82dG/0ggn6yBGQk8TQbF0cndrHklHNfIfZMap4C/q3QqFdd3lhDckV/7SqgHKABL
	CEJvQ/BwD92IJ83TUCrOBV9WWs/Ip7iQZr9L2mI3eDKuOA6vMVprwXVwCTW+32zUJ6blK14kRI7
	Ln/Rw=
X-Google-Smtp-Source: AGHT+IG61FIjH34dziMXtOWfv5flwguk/t3Ek5Rl9JJ2mkWhY2/XOOReKC9NTp1ictu/iFlnRBa13A==
X-Received: by 2002:a17:902:f78a:b0:266:63de:eefc with SMTP id d9443c01a7336-28e7f29382bmr32482615ad.14.1759309045134;
        Wed, 01 Oct 2025 01:57:25 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.93.46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d43d4sm182186965ad.16.2025.10.01.01.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 01:57:24 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bhanuseshukumar@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: [PATCH] of: doc: Fix typo in doc comments.
Date: Wed,  1 Oct 2025 14:27:16 +0530
Message-Id: <20251001085716.45361-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

synthetized => synthesized
definied => defined
sucess => success

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 drivers/of/irq.c     | 2 +-
 drivers/of/overlay.c | 2 +-
 include/linux/of.h   | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 74aaea61de13..8951a69390b7 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -163,7 +163,7 @@ const __be32 *of_irq_parse_imap_parent(const __be32 *imap, int len, struct of_ph
  * @out_irq:	structure of_phandle_args updated by this function
  *
  * This function is a low-level interrupt tree walking function. It
- * can be used to do a partial walk with synthetized reg and interrupts
+ * can be used to do a partial walk with synthesized reg and interrupts
  * properties, for example when resolving PCI interrupts when no device
  * node exist for the parent. It takes an interrupt specifier structure as
  * input, walks the tree looking for any interrupt-map properties, translates
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 1af6f52d0708..255e8362f600 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -135,7 +135,7 @@ static BLOCKING_NOTIFIER_HEAD(overlay_notify_chain);
  * @nb:		Notifier block to register
  *
  * Register for notification on overlay operations on device tree nodes. The
- * reported actions definied by @of_reconfig_change. The notifier callback
+ * reported actions defined by @of_reconfig_change. The notifier callback
  * furthermore receives a pointer to the affected device tree node.
  *
  * Note that a notifier callback is not supposed to store pointers to a device
diff --git a/include/linux/of.h b/include/linux/of.h
index a62154aeda1b..231093032ce0 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1127,7 +1127,7 @@ static inline bool of_phandle_args_equal(const struct of_phandle_args *a1,
  * Search for a property in a device node and count the number of u8 elements
  * in it.
  *
- * Return: The number of elements on sucess, -EINVAL if the property does
+ * Return: The number of elements on success, -EINVAL if the property does
  * not exist or its length does not match a multiple of u8 and -ENODATA if the
  * property does not have a value.
  */
@@ -1146,7 +1146,7 @@ static inline int of_property_count_u8_elems(const struct device_node *np,
  * Search for a property in a device node and count the number of u16 elements
  * in it.
  *
- * Return: The number of elements on sucess, -EINVAL if the property does
+ * Return: The number of elements on success, -EINVAL if the property does
  * not exist or its length does not match a multiple of u16 and -ENODATA if the
  * property does not have a value.
  */
@@ -1165,7 +1165,7 @@ static inline int of_property_count_u16_elems(const struct device_node *np,
  * Search for a property in a device node and count the number of u32 elements
  * in it.
  *
- * Return: The number of elements on sucess, -EINVAL if the property does
+ * Return: The number of elements on success, -EINVAL if the property does
  * not exist or its length does not match a multiple of u32 and -ENODATA if the
  * property does not have a value.
  */
@@ -1184,7 +1184,7 @@ static inline int of_property_count_u32_elems(const struct device_node *np,
  * Search for a property in a device node and count the number of u64 elements
  * in it.
  *
- * Return: The number of elements on sucess, -EINVAL if the property does
+ * Return: The number of elements on success, -EINVAL if the property does
  * not exist or its length does not match a multiple of u64 and -ENODATA if the
  * property does not have a value.
  */
-- 
2.34.1

