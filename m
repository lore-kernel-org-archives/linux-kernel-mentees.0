Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE44C142E7C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 30 Mar 2025 05:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743314127; cv=none; b=V36fDyODTZHYd64pD5bP92HKtI0WMZl/ea/jn7JMCCK0BZEl0W19uEYSG8jwSlJJyfgDlEylnQ/C7jAYfkS2ceVUARjknLlwTHzU+tjAoWeGI/Ud8TC+yb4tSsJcskNlvpgpPe1qM6wcT18OIFcDUQvue+LIbKFh6LgI6upciZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743314127; c=relaxed/simple;
	bh=jq+T0KY3Uy+rx4nE/vr2dkayKbNzmAXvHQY/LI1TJw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtK9xnxDCn/SgUkqYeoN4cGHnwRb2yAg2E2VsMlL14cvVa2kPmQMkI6rg2Mf4EW/gcYeeCOT8IpWXLgnTRr7wJqC2xg9VyQuhJ3cquGaX61ugXTqovvrGcrOnlXR1doOZf+FOYhVYhNcd8W/Uh4v16QzTT822ZzGmO1xuPDp9ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qrn8WjQb; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qrn8WjQb"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D9BC608C4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 30 Mar 2025 05:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LD5z1jjd21ct for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Mar 2025 05:55:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=x0rw3ll@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 56B9660752
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56B9660752
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qrn8WjQb
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 56B9660752
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 30 Mar 2025 05:55:24 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-abf3d64849dso532922466b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 29 Mar 2025 22:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743314122; x=1743918922; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6PpTlh5KVVgsGhCGF4y/CrrtuRXsy3r6ZCRQJL7GKJ8=;
        b=Qrn8WjQbkYJNaJrQr1EEbSOxP87AdO4phcsG1qxOaSgsStBjCn9TiIH1G8mKt7xjPV
         H3Je5eJIIQV3GZq1N/OEqpDhC+bsmh7nfOHwWLHi+Uw35tKqULI9qEaK7uiyUcLKg9NC
         erPy1oz9Jn2GSsnIbyA75XmIjo7prjFleQJAOYnpiqP0AiJEMCBPOsmuzsN56u6MOKBv
         hExUPMlHitEM2isjSkvanCrAKQ3VP6dk4pXABR+pSsN9ANRx/rIpyyLf7gkHrZbsyWwI
         6T/xlOm6cpm+8h+WqAxWHJinz1UFGv9txihEMMpuCqXect48uKv96AxX3EQl3XhYG+Tm
         iyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743314122; x=1743918922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PpTlh5KVVgsGhCGF4y/CrrtuRXsy3r6ZCRQJL7GKJ8=;
        b=oUP7kIq6P4zNfF83E2pbp9sAXNMTyoCmXCL79jJILw3qqbTIeWAFJGi1RpJUlHdMrf
         r8BWZfFph7BE5wO6b8elQDPvG4iHDkoGk3hV3Sn69vLF1ctObTZxorASDgTpvsMyTaN5
         xzH2WTgtF8BFIDVONdrVa8b8su48/wmDIG7esZ6hM3N8IO2yN5K/jvHh/ypcl8y2fm9Z
         9vqWi4uuLX6GlME3+2ZLTDz18lrPjhFTvPq52Do/keSAtYmjbGiwErtgp0pp5Sj/VVK4
         S8r+14p0NCZZXBLafFNPJLZfIoTnh0ifruRxgTO9MPtqC9smG8TS0GcE9ejbuPGWiGZN
         nd9g==
X-Forwarded-Encrypted: i=1; AJvYcCVDe24ZWiC1AqKLL79kSGTTgXH6UB+G9ERkMiKI9s7YuJgRL132/HpR2axtmrM8bPeoOsGMnlXJd8j0/Q/0Neh2nM5h3A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyVkS/N6LZFe83yJH6rf6e5qoUfDavSB/dfdw8Wuq4STD1bolMy
	/e2S9O97+qQyj0vMgUyt84GMXv5TCFL15Bsr0EjS2g7yzx0tv70e
X-Gm-Gg: ASbGncsugwpMRupqk9vCoWbHPpCJEzzF6de0vezy5dvh8Qw+zaO7eVNcs6t7lAh16Y9
	XjJdMWeU+76kndoLuMmTiYCNTb8eeM113KxNU188Lb8/IpAWq3WXYtUNroyWziTR9lwsbtvqBhc
	4sL22IB/SGy3rCixfF/0MCeMysvK7nSJ9ZCq+aiPp4f1/PmxPzNH1ry4ODnieBAX2+P8SioQmxY
	OtNxw7BkfD0fBqgovFYwXL7GutSJncJj8ls+hfmtQunGhxLjMCjEfUEPERRj+yYKE+YlfXuRK/H
	IBCefVRLVKkVlpkq6f+i2+YWq8r+09JOVanJ0Iu0Z7ioDmhUuVeLyWgU
X-Google-Smtp-Source: AGHT+IGos8Q7srbIrNbIAkO4sMWeffy1fVcgAryd53kfETkDp506bEMrCTcyjRgqYm0R6nLDH4kAow==
X-Received: by 2002:a17:907:6092:b0:ac3:8aa5:53f6 with SMTP id a640c23a62f3a-ac738a0c683mr434267666b.24.1743314121909;
        Sat, 29 Mar 2025 22:55:21 -0700 (PDT)
Received: from localhost (44.tor-exit.nothingtohide.nl. [192.42.116.218])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5edc16aae7asm3872618a12.2.2025.03.29.22.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 22:55:21 -0700 (PDT)
Date: Sun, 30 Mar 2025 07:55:18 +0200
From: Ahmed Salem <x0rw3ll@gmail.com>
To: robert.moore@intel.com, rafael.j.wysocki@intel.com, lenb@kernel.org
Cc: skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] ACPI: replace deprecated strncpy() with strtomem()
Message-ID: <6c1a263a89712b5cdc2a6752a91bb9f71f379a2a.1743313252.git.x0rw3ll@gmail.com>
References: <cover.1743313252.git.x0rw3ll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1743313252.git.x0rw3ll@gmail.com>

strncpy() is deprecated for NUL-terminated destination buffers[1].

Use strtomem() for ACPI_COPY_NAMESEG() as destinations are length-bounded,
and not all of them require NUL termination.

Also replace strncpy() with memcpy() for copying header.oem_id
and header.oem_table_id

[1] https://github.com/KSPP/linux/issues/90

Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>
---
 drivers/acpi/acpica/tbfind.c | 4 ++--
 include/acpi/actypes.h       | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/acpica/tbfind.c b/drivers/acpi/acpica/tbfind.c
index 1c1b2e284bd9..35f72dffc250 100644
--- a/drivers/acpi/acpica/tbfind.c
+++ b/drivers/acpi/acpica/tbfind.c
@@ -57,8 +57,8 @@ acpi_tb_find_table(char *signature,
 
 	memset(&header, 0, sizeof(struct acpi_table_header));
 	ACPI_COPY_NAMESEG(header.signature, signature);
-	strncpy(header.oem_id, oem_id, ACPI_OEM_ID_SIZE);
-	strncpy(header.oem_table_id, oem_table_id, ACPI_OEM_TABLE_ID_SIZE);
+	memcpy(header.oem_id, oem_id, ACPI_OEM_ID_SIZE);
+	memcpy(header.oem_table_id, oem_table_id, ACPI_OEM_TABLE_ID_SIZE);
 
 	/* Search for the table */
 
diff --git a/include/acpi/actypes.h b/include/acpi/actypes.h
index 80767e8bf3ad..b85dec57f00d 100644
--- a/include/acpi/actypes.h
+++ b/include/acpi/actypes.h
@@ -522,7 +522,7 @@ typedef u64 acpi_integer;
 #define ACPI_COPY_NAMESEG(dest,src)     (*ACPI_CAST_PTR (u32, (dest)) = *ACPI_CAST_PTR (u32, (src)))
 #else
 #define ACPI_COMPARE_NAMESEG(a,b)       (!strncmp (ACPI_CAST_PTR (char, (a)), ACPI_CAST_PTR (char, (b)), ACPI_NAMESEG_SIZE))
-#define ACPI_COPY_NAMESEG(dest,src)     (strncpy (ACPI_CAST_PTR (char, (dest)), ACPI_CAST_PTR (char, (src)), ACPI_NAMESEG_SIZE))
+#define ACPI_COPY_NAMESEG(dest, src)     (strtomem (ACPI_CAST_PTR (char, (dest)), ACPI_CAST_PTR (char, (src))))
 #endif
 
 /* Support for the special RSDP signature (8 characters) */
-- 
2.47.2

