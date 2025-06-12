Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2EB2BD00C
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 17:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749281; cv=none; b=hMUWgPG3yUd81l2TTQ9d9AafM8LXMmjYBfWfLK/l2GYd+Pyq3qwqEuwuN0E305wNUCUy25V5WGStUUyllzdJfLotMPKd6fAZrpJooS9FhwJkrBv7bQZpjy5GFd3GkaQ0QyE7sLfAmO4Ynr5DS6QfOeXGh5qPvUMnMGNmOeuWSLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749281; c=relaxed/simple;
	bh=rQzMv7zMW+V8xJgEwDRoJJEYf7Gnl8DxCH5zWo5O9oc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W1dJi/zptIKTbvynhN1TG94l9hF8xZYZcvUtHkbd7PG4mYIgON6nvm9Tikkdyij9eBxFYxihNRiPsyWWMPNFMo4i9Bi5cuFC1HNvkoty+GZXJaSu55UN1d+nhD0k4G7iciPDZ+1NndTHDLsddXbS+IDCamQnI2YZatclqSDurpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HieVXh0l; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HieVXh0l"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55351af2fc6so1345328e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 10:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749749276; x=1750354076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNWv1Vkdp6Tz4ugdH9sHsD45TiS1risRm/SEcmxn+Qw=;
        b=HieVXh0lx1EMJb2hFhBac+QLDfK3dWJldFvco8jHVwEQDVbZGGq1UGtpgjVs7S0RYm
         30LRwdsiY2zX144L0dMjroZ3xduw5G8mP4bg6nbmWnbxJGLQKaEBc7buh1Rd+pe8J9uU
         U+20/2XS0/UYCa7bEUgJOiSSsRujg9hptnFcnZUIfNUtJ5DX+e5WuxTBrh2aiRW95qAq
         71emRFbVpYpqv7MdtDKLG6LHOM+SGpUFUwy4abe6COASabHqXJul+pBaqQ7i4fs/YXoO
         pjyE7v1IrfBN18K4aVye3l6Ic3WmxycMj6rjw+dubM89ju/dmmVb/Ofk46nML1RzH4G4
         OC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749749276; x=1750354076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNWv1Vkdp6Tz4ugdH9sHsD45TiS1risRm/SEcmxn+Qw=;
        b=DTkb9OKAxhGkANm74XymHAti5Sset5xKAg+6KgjC3EqfG4k6Swze+LtlDqiXJElyx1
         bI3HJRaKtfHwFcH3tQKp5Lb+vF/VYFilpcL3cBloSHAXzIhlHrjrtYeAYulJV/QRei/H
         oSyNNzg1MF5WfpRvRsQAf0cnOdTYGOKAQcbSJZ26Lrh6QTOjSkzBBDW5I+oKLUWVrVeN
         6jvLgefT/FEF2eVeZk7FC64WfrEpXa1HydhC4jWTxXkvglbKUaYf1KNYEEMH3LZTtCG0
         9ATdWDJ87050WoapY2psGzLLU//fT/BsY2Q3BsnmAQyslXtUA0wfAbPyTFubLGk6V81v
         VTMA==
X-Forwarded-Encrypted: i=1; AJvYcCXdQhZeNwUG6RKb3xsF0Vof80QlUbZAzs1+Sr0gv9ZJv4pnB8ADCIZvMhWp0c8bKzQyJmIP5UxNJ/9Ww8SVUYMn+kSdnw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6+x12EaoF3sSJmcD0wz3PvaA0UikNRqbM7eO6f5eNTE7ciovR
	qLIQYPFn5UY3Aean8ZlVQb8WUjRkR872Mw0YJ8od+MRof9oYDA2GCm0o
X-Gm-Gg: ASbGncvuUSB/znsPQLyjo8K+DRFl3D2W4mdsbsW+BBWuottQRy3WREhnXgSIYRxeRlq
	kikbKHCRJLeVwRK+I2X6Rw2ijQdRJyH5xrtDQ8vlNq/B4CNRBw6TCFr5reQJ9jES/ydqm055TIn
	IBh5WmzJwuGUltjoJF9hZltorGBhEiFTBm32fgX1onzCT/+MwBBMHIF9ZLzg3d4jYsYSg7fnp9b
	flaZ4wlZm1U0rO/TSV3rJmHm8VhPWePTGEjDkoPrnzXuVkks6fFqGfZPwjovqIpdxo3dVaCJkmX
	WfCKB+/UNWXrSCsV/f7Cf38BkauMWFt56pAYjGHlgxLYT9BQw5c/uil6xPaU6czJ0AA76bkcM3L
	ayYjwt2rqHnX11nsAfu/UlfZynYT9UmoPk//QBObGuTJ3pKFkLdtpnvSKvA==
X-Google-Smtp-Source: AGHT+IHQDLn3RPUl3OK0txE6hw/CRkdzygyWof51VXKj3tR67bEBhRnJ1A1cgWFxPHAjPiJ66jaa4w==
X-Received: by 2002:a05:6512:b1d:b0:553:3073:c38b with SMTP id 2adb3069b0e04-553af932938mr381e87.1.1749749275765;
        Thu, 12 Jun 2025 10:27:55 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-6e-3100-4ba3-46aa-7f0f-54f.rev.dnainternet.fi. [2001:14ba:6e:3100:4ba3:46aa:7f0f:54f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c24fbsm170358e87.164.2025.06.12.10.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:27:55 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: mchehab@kernel.org,
	hljunggr@cisco.com,
	ribalda@chromium.org,
	hverkuil@xs4all.nl,
	skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH v3 2/2] docs: Improve grammar, formatting in Video4Linux
Date: Thu, 12 Jun 2025 20:27:03 +0300
Message-Id: <20250612172703.32293-2-hannelotta@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250612172703.32293-1-hannelotta@gmail.com>
References: <20250612172703.32293-1-hannelotta@gmail.com>
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
    <corbet@lwn.net> and Bagas Sanjaya <bagasdotme@gmail.com>.
    
    v2 -> v3:
    
    Shortened the patch series to two patches, as parts
    3/4 and 4/4 have been applied.
    
    No changes in content.

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

