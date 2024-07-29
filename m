Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD415F303
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 16:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722271676; cv=none; b=XL94xrwXh3Z3RCXC2jKradwaNdg9BlYNizjUhp685Vu9kix67hcj0aiefdbIKpvnN6C6U8HuRW0ohmp8faM0PbfWp70+vHWstP+cxK9OTJjHqcptbrFj1jICN1Epno3dxzHXvbPnR21goD3fcmN6JQYuufYqmrEtrwWYEv3nGgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722271676; c=relaxed/simple;
	bh=J0gsZdvM4TTjvgwxecx1IeUq/HrBdJag42zJRTAFvQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Umq5N4os2rXDe+WulFTshu8LELJxwBDiJNvpZyQ7WD/C3EtDoJ/KFWo2zfRkW8F+Ny0ikTbwA+kxXm/NrptLzmhaAgNQsUucimhkVem+/CNB/gu+A2sko0pyYvQpMCXa29ElOspb+5A464VSMq8MkycqpqgkjHQLjbTpFC85+cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ineyV0+w; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ineyV0+w"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA6D880FAD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 16:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFPz3_iBh-iw for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jul 2024 16:47:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE95780FA9
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE95780FA9
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ineyV0+w
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BE95780FA9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 16:47:53 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-65f9e25fffaso23960457b3.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722271672; x=1722876472; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9gwTCEqRccgI7/MSiW2vw7+v9RTbvBSGbIl8hm42GSQ=;
        b=ineyV0+w/3EOMZtcxiTSKz9HiahBoT6ygUh7OQOWGXvQxjwPaQ02qgU7CjjdN8QyRx
         dosm6k2x4PzJqXBev1bHq85ADm4eQ6AzEbxlXxd1h0tBsaW1meDIFOfwJBzx3hh44vAg
         W5tTqVhlmf3IulLL/V4Hmmz6y+FqDShMaGrpwu5V5NjD8EsuQjs3t7Lh8yf85phVYpPO
         PsT76kSNSacIdlA4hEKyanlw+XhwncEdIocUBQoO/FRZkamz/e5BegJk3m+0szq8w/J5
         65+KdGx03oI88H4Ybj78q5MFIkUdvrEnRKenhG0VOQvQoJZHmAbe/gC8oLGbwxiJ1vst
         E8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722271672; x=1722876472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gwTCEqRccgI7/MSiW2vw7+v9RTbvBSGbIl8hm42GSQ=;
        b=UCrUs84TsOrNs3ELGIUFhRNVKYgMRN3eXCHMf+0fvt8tpPjkifM8ksv0PP6NQYrEFb
         DC06hiFaCxo7DAJdzoFFUF4zbnONx4jZ4CNoy48RzUjrjNEDFh+W4zbXOYckEG2CL/iv
         vGrF0B3oMH1ErBhsOzbTYE6TddUlQxaEVqP0Onn21GxjyFpX4b2dGjgvLTh0kUAJy2vE
         qN0cGqkxqPYzSqbIqsiPUciZeEFQtd2taneQ6nCc4k9G0ZQWfvWWjkekyWoQhwATtQDV
         cbEiNfMPD38qSDtvMkeidRmzyyVtgwE8WNk3XrYwpgIaacAo1dGwRopg/nl7QT3ufqXl
         sb5g==
X-Forwarded-Encrypted: i=1; AJvYcCVrtHfZJV0ZU24XrYWUgsDzflOEYecqsZQbbAm5NUBfyxoRj/Xc7hStBSqAulTWFNreIzX+itv8l7kJPj79wmjw51H3F4N/odF1F39bL3MvoXwwbDwMS+XdITTAvTCz
X-Gm-Message-State: AOJu0YxiHZtfPr5DjJebBH6q6oaE9H4jWQ8ZG+C2hruj3Cjx+TyM1ff2
	GfwGSgFVLXCaWEx/tAQC95V3vwm4zkRzw572BacW87Kkn9VJrcrG
X-Google-Smtp-Source: AGHT+IE5UVYmoHRsexfFfroI43G1rYzF/zk88j0ZYLtr35hJAqGMYetGXwFHEEgR28JfJC7Iu/v8cg==
X-Received: by 2002:a05:6902:260e:b0:e06:d61b:2c17 with SMTP id 3f1490d57ef6-e0b545adb76mr9313644276.40.1722271672362;
        Mon, 29 Jul 2024 09:47:52 -0700 (PDT)
Received: from x13.. ([157.23.249.83])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b4ebc5d8fsm1237833276.3.2024.07.29.09.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 09:47:52 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: W_Armin@gmx.de,
	corbet@lwn.net
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] wmi: Fix spelling
Date: Mon, 29 Jul 2024 12:47:18 -0400
Message-ID: <20240729164721.125708-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
 Documentation/wmi/devices/msi-wmi-platform.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/wmi/devices/msi-wmi-platform.rst b/Documentation/wmi/devices/msi-wmi-platform.rst
index 29b1b2e6d42c..31a136942892 100644
--- a/Documentation/wmi/devices/msi-wmi-platform.rst
+++ b/Documentation/wmi/devices/msi-wmi-platform.rst
@@ -130,12 +130,12 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
 
 Due to a peculiarity in how Windows handles the ``CreateByteField()`` ACPI operator (errors only
 happen when a invalid byte field is ultimately accessed), all methods require a 32 byte input
-buffer, even if the Binay MOF says otherwise.
+buffer, even if the Binary MOF says otherwise.
 
 The input buffer contains a single byte to select the subfeature to be accessed and 31 bytes of
 input data, the meaning of which depends on the subfeature being accessed.
 
-The output buffer contains a singe byte which signals success or failure (``0x00`` on failure)
+The output buffer contains a single byte which signals success or failure (``0x00`` on failure)
 and 31 bytes of output data, the meaning if which depends on the subfeature being accessed.
 
 WMI method Get_EC()
@@ -147,7 +147,7 @@ data contains a flag byte and a 28 byte controller firmware version string.
 The first 4 bits of the flag byte contain the minor version of the embedded controller interface,
 with the next 2 bits containing the major version of the embedded controller interface.
 
-The 7th bit signals if the embedded controller page chaged (exact meaning is unknown), and the
+The 7th bit signals if the embedded controller page changed (exact meaning is unknown), and the
 last bit signals if the platform is a Tigerlake platform.
 
 The MSI software seems to only use this interface when the last bit is set.
-- 
2.45.2

