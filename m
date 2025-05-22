Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C704B288C36
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 11:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914805; cv=none; b=JD1IZut4C2DasUBHeQhnZovuASu5tFZwaPxr2HK+IIdiHcO1ovYVYJ6L+ndjbTqG3bvUf7EoLP/iR5md8X8a2UclBFnKDOZti72/p4H4e95j1dvaLFCXDkv/W6sCry/VAZTs78hBY33QroKJB+OUlgoXWYyI2ku4ULBCyGqlzk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914805; c=relaxed/simple;
	bh=mC2NX5Ld0kmQE028hPgdun3VOJQNhT5Wj8QUYegZWRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OG1iBhnNbuhmAsmGYpEkU8xB0XbMexedHDAG4zPfF0mXoAL846m+YiqTwA4+080yK8uhiLDLmgtrDhd1NXrpOP8kdj3JrnwjEGWtkAFsVb0aO+NHM0Ui9a8kDh8HOfls74FGCZi7Ka1LC7xCLBZxG0M/3nY7T8c6EIapPxYqjWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQ2hd7/L; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQ2hd7/L"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-551f0072119so5431182e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747914802; x=1748519602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPcSJ2spCqExVjK74bSjE8iGNCUYyEjiFyXAqBK4zj8=;
        b=aQ2hd7/LEinHxcD0J9ebNIRC9n480PWxexPERgLTjhNgu3vPRtA/iNkcYUhAtsOLQF
         Lx79C85CMKAqpi4WvZuedzquHC3nKta3TXUvgkG1XXHRR2lzEOXho42QM4/kO78JakAL
         uTUa4NmxID20ImhcUtYBMhwkubVqmFEy1Thd7uN6ox8pz1o0eTfhzn9xkQzWFui+EIZw
         Qk5wx90X2494utui12KNvGHAtzT01uyeVkvk2lfCgwDnjj5ozM5BYLEjb2oEOD9dfmmq
         kaRFm1oTwfF2uOkqnOp4SwkI4vmiEXudUzPSVQ98r0/CM6LNaKkx0sd5BxaawXhVOiIX
         +s2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747914802; x=1748519602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPcSJ2spCqExVjK74bSjE8iGNCUYyEjiFyXAqBK4zj8=;
        b=naeXRprrPjFk3oR2bUr51snFBjCoZkPr1pNgOurD5MCS1qj2cW7t+p9Qz1RmpeLUaR
         ZBFvDJXvNXYHC+1olEcWKIuHZxcB/g/XGHkU1C2CXZE6Jt+FYGcjXt0qi19ZUbgMowXD
         uSrPi0QWJUJdzDZGesm/jwwm2H+zuyN0tRrHKa486NaGiwR2dFlCbLrxCQqATDwDGdzs
         Odz3DJAHK1tZNd/YdJ3uvjDkMQeBvoajY7mAxESKMBcUC7lULGvH2pDmYzrrc8P4Hrg2
         hRUHvU3FZnbT+yGzxS/DfNDi+EJ6i+Cl4t4WcwlNxUrTKcHnQnmtjeByzik6NakGTrJ4
         gfCA==
X-Forwarded-Encrypted: i=1; AJvYcCXuBxSFPbnTCY3Qb1Y7t74HlSJvV/jX8xKh33jNm26nT9VH6jVfU3kyVaEsPTRpBwm2Dd3VktQCm33BKHDQvIMP+KtQBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDzececrT8FTxbW9TtKtp3Xx10ZYHewfVmpq48uIIWJc4l3cU4
	DQ0puqao/KhW01sV+SeD0p4BoTgG4ozmcYr9apdNZZi1/EAEphMvnl6U
X-Gm-Gg: ASbGncvbre/3aqStIkY2lnwx779woG5Q0kcclzYT8wxRasiOuMBYXJYrrylAMRmaBz2
	tw0thgxLLSkfOiSn5Dd+05MSoMXaHD10YqU8sQnRZrhZLFF+JITGqxI9N/2vkNinXcLIthr/piK
	bAXC1IfXT2VwOcHKfcAZbU8O2sUSeT4M89EQoaC1rSuCWB0c5DypcF3qOKYc2+fl551QMwzLR2R
	aZbB9+xsMilQdZZv3LPHBCb68G7kEZ/EBAS7+iFnKRSEB+fKeubxYA1gNT4BYmypI+QeEUPlUVM
	rClV6eVO/EK3EsnJVQ6AuF/QtB8yHwlfzA1LIDC8ZshAWB+9cl5jpdHhnKV1XgE3noW1A1FaF3v
	TD7nG22ktxqAvBcXLk5f9JvDPMmNPMDdlp3GjVDB43glbDJHk40TVULV9
X-Google-Smtp-Source: AGHT+IGyl7U2kjS4B+fPmIEXgaGCAUqNftsDBqA591csvR7/RNfy6A+8c/67EAFT4dWAXSPWwEhHhw==
X-Received: by 2002:a05:6512:4508:b0:54e:8189:2ec9 with SMTP id 2adb3069b0e04-550e750b3d0mr7360828e87.21.1747914801460;
        Thu, 22 May 2025 04:53:21 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-53-1500-7c4-bcaf-182a-540c.rev.dnainternet.fi. [2001:14ba:53:1500:7c4:bcaf:182a:540c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017e79sm3343760e87.154.2025.05.22.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:53:21 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: mchehab@kernel.org,
	ribalda@chromium.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	hljunggr@cisco.com,
	dave.jiang@intel.com,
	jgg@ziepe.ca,
	saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com,
	corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	W_Armin@gmx.de,
	mpearson-lenovo@squebb.ca,
	skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH v2 2/4] docs: Improve grammar, formatting in Video4Linux
Date: Thu, 22 May 2025 14:52:53 +0300
Message-Id: <20250522115255.137450-2-hannelotta@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522115255.137450-1-hannelotta@gmail.com>
References: <20250522115255.137450-1-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix typos, punctuation and improve grammar and formatting
in documentation for Video4Linux (V4L).

Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---

Notes:
    v1 -> v2:
    
    Left out changes based on feedback from Jonathan Corbet
    <corbet@lwn.net> and Bagas Sanjaya <bagasdotme@gmail.com>

 .../userspace-api/media/v4l/biblio.rst        |  2 +-
 .../media/v4l/dev-sliced-vbi.rst              |  4 ++--
 .../media/v4l/ext-ctrls-fm-rx.rst             | 11 +++-------
 .../media/v4l/ext-ctrls-fm-tx.rst             | 21 +++++++------------
 .../media/v4l/pixfmt-srggb12p.rst             |  4 ++--
 .../media/v4l/pixfmt-srggb14p.rst             |  2 +-
 6 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/biblio.rst b/Documentation/userspace-api/media/v4l/biblio.rst
index 35674eeae20d..856acf6a890c 100644
--- a/Documentation/userspace-api/media/v4l/biblio.rst
+++ b/Documentation/userspace-api/media/v4l/biblio.rst
@@ -150,7 +150,7 @@ ITU-T.81
 ========
 
 
-:title:     ITU-T Recommendation T.81 "Information Technology --- Digital Compression and Coding of Continous-Tone Still Images --- Requirements and Guidelines"
+:title:     ITU-T Recommendation T.81 "Information Technology --- Digital Compression and Coding of Continuous-Tone Still Images --- Requirements and Guidelines"
 
 :author:    International Telecommunication Union (http://www.itu.int)
 
diff --git a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
index 42cdb0a9f786..96e0e85a822c 100644
--- a/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
+++ b/Documentation/userspace-api/media/v4l/dev-sliced-vbi.rst
@@ -48,7 +48,7 @@ capabilities, and they may support :ref:`control` ioctls.
 The :ref:`video standard <standard>` ioctls provide information vital
 to program a sliced VBI device, therefore must be supported.
 
-.. _sliced-vbi-format-negotitation:
+.. _sliced-vbi-format-negotiation:
 
 Sliced VBI Format Negotiation
 =============================
@@ -377,7 +377,7 @@ Sliced VBI Data in MPEG Streams
 
 If a device can produce an MPEG output stream, it may be capable of
 providing
-:ref:`negotiated sliced VBI services <sliced-vbi-format-negotitation>`
+:ref:`negotiated sliced VBI services <sliced-vbi-format-negotiation>`
 as data embedded in the MPEG stream. Users or applications control this
 sliced VBI data insertion with the
 :ref:`V4L2_CID_MPEG_STREAM_VBI_FMT <v4l2-mpeg-stream-vbi-fmt>`
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
index b6cfc0e823d2..ccd439e9e0e3 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-rx.rst
@@ -64,17 +64,12 @@ FM_RX Control IDs
     broadcasts speech. If the transmitter doesn't make this distinction,
     then it will be set.
 
-``V4L2_CID_TUNE_DEEMPHASIS``
-    (enum)
-
-enum v4l2_deemphasis -
+``V4L2_CID_TUNE_DEEMPHASIS (enum)``
     Configures the de-emphasis value for reception. A de-emphasis filter
     is applied to the broadcast to accentuate the high audio
     frequencies. Depending on the region, a time constant of either 50
-    or 75 useconds is used. The enum v4l2_deemphasis defines possible
-    values for de-emphasis. Here they are:
-
-
+    or 75 microseconds is used. The enum v4l2_deemphasis defines possible
+    values for de-emphasis. They are:
 
 .. flat-table::
     :header-rows:  0
diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
index 04c997c9a4c3..cb40cf4cc3ec 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-fm-tx.rst
@@ -104,7 +104,7 @@ FM_TX Control IDs
 
 ``V4L2_CID_AUDIO_LIMITER_RELEASE_TIME (integer)``
     Sets the audio deviation limiter feature release time. Unit is in
-    useconds. Step and range are driver-specific.
+    microseconds. Step and range are driver-specific.
 
 ``V4L2_CID_AUDIO_LIMITER_DEVIATION (integer)``
     Configures audio frequency deviation level in Hz. The range and step
@@ -121,16 +121,16 @@ FM_TX Control IDs
     range and step are driver-specific.
 
 ``V4L2_CID_AUDIO_COMPRESSION_THRESHOLD (integer)``
-    Sets the threshold level for audio compression freature. It is a dB
+    Sets the threshold level for audio compression feature. It is a dB
     value. The range and step are driver-specific.
 
 ``V4L2_CID_AUDIO_COMPRESSION_ATTACK_TIME (integer)``
-    Sets the attack time for audio compression feature. It is a useconds
+    Sets the attack time for audio compression feature. It is a microseconds
     value. The range and step are driver-specific.
 
 ``V4L2_CID_AUDIO_COMPRESSION_RELEASE_TIME (integer)``
     Sets the release time for audio compression feature. It is a
-    useconds value. The range and step are driver-specific.
+    microseconds value. The range and step are driver-specific.
 
 ``V4L2_CID_PILOT_TONE_ENABLED (boolean)``
     Enables or disables the pilot tone generation feature.
@@ -143,17 +143,12 @@ FM_TX Control IDs
     Configures pilot tone frequency value. Unit is in Hz. The range and
     step are driver-specific.
 
-``V4L2_CID_TUNE_PREEMPHASIS``
-    (enum)
-
-enum v4l2_preemphasis -
+``V4L2_CID_TUNE_PREEMPHASIS (enum)``
     Configures the pre-emphasis value for broadcasting. A pre-emphasis
     filter is applied to the broadcast to accentuate the high audio
     frequencies. Depending on the region, a time constant of either 50
-    or 75 useconds is used. The enum v4l2_preemphasis defines possible
-    values for pre-emphasis. Here they are:
-
-
+    or 75 microseconds is used. The enum v4l2_preemphasis defines possible
+    values for pre-emphasis. They are:
 
 .. flat-table::
     :header-rows:  0
@@ -166,8 +161,6 @@ enum v4l2_preemphasis -
     * - ``V4L2_PREEMPHASIS_75_uS``
       - A pre-emphasis of 75 uS is used.
 
-
-
 ``V4L2_CID_TUNE_POWER_LEVEL (integer)``
     Sets the output power level for signal transmission. Unit is in
     dBuV. Range and step are driver-specific.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
index 7c3810ff783c..8c03aedcc00e 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb12p.rst
@@ -6,7 +6,7 @@
 .. _v4l2-pix-fmt-sgrbg12p:
 
 *******************************************************************************************************************************
-V4L2_PIX_FMT_SRGGB12P ('pRCC'), V4L2_PIX_FMT_SGRBG12P ('pgCC'), V4L2_PIX_FMT_SGBRG12P ('pGCC'), V4L2_PIX_FMT_SBGGR12P ('pBCC'),
+V4L2_PIX_FMT_SRGGB12P ('pRCC'), V4L2_PIX_FMT_SGRBG12P ('pgCC'), V4L2_PIX_FMT_SGBRG12P ('pGCC'), V4L2_PIX_FMT_SBGGR12P ('pBCC')
 *******************************************************************************************************************************
 
 
@@ -20,7 +20,7 @@ Description
 These four pixel formats are packed raw sRGB / Bayer formats with 12
 bits per colour. Every two consecutive samples are packed into three
 bytes. Each of the first two bytes contain the 8 high order bits of
-the pixels, and the third byte contains the four least significants
+the pixels, and the third byte contains the four least significant
 bits of each pixel, in the same order.
 
 Each n-pixel row contains n/2 green samples and n/2 blue or red
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
index 3572e42adb22..f4f53d7dbdeb 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb14p.rst
@@ -24,7 +24,7 @@ These four pixel formats are packed raw sRGB / Bayer formats with 14
 bits per colour. Every four consecutive samples are packed into seven
 bytes. Each of the first four bytes contain the eight high order bits
 of the pixels, and the three following bytes contains the six least
-significants bits of each pixel, in the same order.
+significant bits of each pixel, in the same order.
 
 Each n-pixel row contains n/2 green samples and n/2 blue or red samples,
 with alternating green-red and green-blue rows. They are conventionally
-- 
2.39.5

