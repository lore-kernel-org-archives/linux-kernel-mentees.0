Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0C21C5D55
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450420; cv=none; b=jqXwQ78L1tnKlxNRxe06euZXr1ixJHIEvTmpeiCJexJms9zSaXuGUF6Jv6dfXAlOi5+t+yrbEj+NaBU1iXRcqEW5fmSCUc/7/Mx+tE8tRIUpMxdaboAUjjbUXnu6vFopRF7h5f3LLcVok2kRr2tZ1jBJYhOa/xe08K4s9jR2m7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450420; c=relaxed/simple;
	bh=Br2XmsbFFY0zRV3hTNp7XyuQxAzrFE+0awVd1x/aXmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NeoNbVJGFBoKGKyGnkmGJjgtR3grGdSYwSVCBrmOJfAH9jX7T2EqwApVRRK82Fh6edrh0J9g0JNR0qQ+iYNqMqtTum8YDWjP4kXoWk7XdE3Js09kseyjxi0BgC7jfjfi05Hww246j6b0aBxXzfHIkly1p2jlqU0A4TbP7hGRPgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuSO0/70; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuSO0/70"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7301F40365
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-4heID4c6oM for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Aug 2025 17:06:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB3DC4003A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB3DC4003A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PuSO0/70
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BB3DC4003A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:06:58 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e43ee62b8so1283111b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 10:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755450418; x=1756055218; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pOMnQXG5ToDuQ3ZSfzmc5ovOIBEU0+927ucpZsBYdcQ=;
        b=PuSO0/70fLALtF8acU2vQlP3/nReL1MbgIw/YkCRdtfJ2RR3nUAcVUn8SGKx0UKTh6
         +osw9zjR/l3uk6Ewz0TpYJD8VNlWpZL0Mik0LiFZwaOveG5txD6VWFm/Zn4K0yLEVND1
         RQOY1eT/0bPCo60u58GXD4usXpNUdZDLMvr+ZSV8xGg/7mmEQXiVTP3VhQnNt55Lp38f
         na3v4LXx3dJxpFXTVgd8j/4Q/SGyFDxclUp7Q9ad/2i2pm6s9S1755Fkjbfhc+MM04IE
         jN/R32Sj8v0wtyGjVMzEbzDxGe/8tyFRo2+6HXShuNmrpzLmvDchIs07gQ6LphoQtHGT
         2yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755450418; x=1756055218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOMnQXG5ToDuQ3ZSfzmc5ovOIBEU0+927ucpZsBYdcQ=;
        b=TZnjNgVu7l20oNj2yN14PjPOq0u44eZlJdemtY3SiqKyOW2HfPvRjUCfbtZwDHzwbR
         TShvHFarX3MSxY4+P7OR0+syU5aTZ/HFwViuaQ8k92QOsJ/D6+o2L5dDiaAG8E+CDfNm
         iDvdrKQbO614pxbkG3OmpRgOxIGnXhOnEN+u6L+Pp3JvS/GcYetvq66y76jzQpTmXD/A
         rodzrAn8WcDwHqSa5IApRqkh2mhJdoY4yuGVnR/P0VJJ56XYldMN9iA0GHSNqoM/aM3E
         6FvSNJ5EDfhKVqUN54vIPZlMePdwtfmeZUi0ogsKmpolr/6QtRUfNB0Gm2ZwN5+nItq5
         KxUw==
X-Forwarded-Encrypted: i=1; AJvYcCX+VrQ3xBG1XgvlCKeIXktvdDKWlNURto42fTuwuAtRP0CkYbR3n3xj3X/cwRtxKoqluDebYoq30yVZx3Fh6lzlPxTflA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzSuil/jxWg7elW6NKxyrN0QY4VaTaT2sB2M6uvfpijEqx8KByQ
	NnHnwaQbIQkQuaxyNrS4Q8nyMpC5hOtF6041sdcbSL0L83Vokv+4s9Gb
X-Gm-Gg: ASbGncsRnTbXNEQPQ8UOcFaVYCCLamXQ8ERiSDlxWvGPjNUseSUuEmo4h1ET95oDKPe
	C0j8jzH6RvXXBHZCoRI4qKSEwRSdZJBt/oPQdaaZei5GNa0C1Y01w6UdVZ/qXipIq2tdn9eTzYu
	J5Up7L3wrOkeZFs048a6v/Xr4NuatiGWTAbS9yA9mcreSd/lUtwyjWO+2djRlKcX9KvIAF6K1o1
	9qZ8cdLk9GRRgbkwi23WAj6wFqrhCDI6e43LTaLwhhmQzLAa6lpxr/5B57OW2KicfBPp2qKAjTM
	T4idQ7H3GRD6C3G3ApXW4JHxa+13ZEDIb2SEcE59nAKC0ixwPpLzAjwcg8kKowjVEXtUNYc2VTD
	OFZat/LG39CcBMJAE3yw/QO4FD04jGfo=
X-Google-Smtp-Source: AGHT+IFrsgMBF20YmP7f5fA/MTut1KvrUzN3v+vLQcjv2m2+ehZODrCaZOHa6JaN1YrvWQDzjy0Jjw==
X-Received: by 2002:aa7:8886:0:b0:748:f750:14c6 with SMTP id d2e1a72fcca58-76e447cd64cmr11457485b3a.14.1755450417575;
        Sun, 17 Aug 2025 10:06:57 -0700 (PDT)
Received: from lkmp.. ([157.51.84.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e4526e368sm5408210b3a.8.2025.08.17.10.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 10:06:57 -0700 (PDT)
From: rakuram <rakuram.e96@gmail.com>
To: linux-doc@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	W_Armin@gmx.de,
	corbet@lwn.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	rakuram.e96@gmail.com
Subject: [PATCH] Documentation/wmi: Fix Typo in lenovo-wmi-gamezone
Date: Sun, 17 Aug 2025 22:36:43 +0530
Message-ID: <20250817170644.5855-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed the below typo error

freqency ==> frequency
in Documentation/wmi/devices/lenovo-wmi-gamezone.rst

Signed-off-by: rakuram <rakuram.e96@gmail.com>
---
 Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
index 997263e51a7d..22040250a97d 100644
--- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@ -153,7 +153,7 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
     [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
     [WmiDataId(3), read, Description("Default value.")] uint32 defaultvalue;
-    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 OCOffsetFreq;
+    [WmiDataId(4), read, Description("OC Offset frequency.")] uint32 OCOffsetFreq;
     [WmiDataId(5), read, Description("OC Min offset value.")] uint32 OCMinOffset;
     [WmiDataId(6), read, Description("OC Max offset value.")] uint32 OCMaxOffset;
     [WmiDataId(7), read, Description("OC Offset Scale.")] uint32 OCOffsetScale;
-- 
2.43.0

