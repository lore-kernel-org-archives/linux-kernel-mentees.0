Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAADD2DCF7B
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  8 Jul 2025 15:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751989947; cv=none; b=GKKH3kmJT9BVj3CXz9JtGbVoeDbB1TBAa+vIbPKtBP9AeBY6S7POqnn88qXB7o5OtKdR67N4diFKw5vUG2VXVSW/9UlsPBWrcHxRfsgPSRFuvFYBZbwfJXTs/YhHTbF9S5snHXeWAqTO4g/i2mdNtPwjDxePLNN74j4h/2Xyzts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751989947; c=relaxed/simple;
	bh=+D5A4PuW8x5tixefVlky3Tm8gVQ5A1rN1sYTliWM8a8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b9xVpkp+nLoAfewzZbPojnHCAEo1mKoA3sEMvbZ6Y8rBPyGJeJdqndKpxUfWBt/qBk1945OjmVnt2A0nRH9jW/vFFv95awkh/gvALESElI90GMZ71/OI04DFgOATrk2J3y0+6rEBqXpeli8oVQYoS118jidmUjgkrqh/t8Klxxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJ4FGYri; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJ4FGYri"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32f1aaf0d60so37319051fa.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 08 Jul 2025 08:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751989943; x=1752594743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmSkHJCz+i+8oNuJ7dtPiAVYrxKnL1IVG/oZZEY1wHc=;
        b=gJ4FGYriCDEGtDZh5DPrRMcylezQDU0EHOkDveLlME+Z0E6Y+ca+/jpXZ+HeTGgBW3
         4caRTqKk06bDPUQerr1Pg47XxMV0sKLDT3gAgcs1Qf9FFMCrL7M/Ew2dguFkbEm3m1J6
         MLKDpa3tlcDskGKdI3mh1H+7QHbWkOM2BcR0dxWzXovpCarzgq9QHlxAsNfz1p+7PuGE
         3hFs8cciWMlpYl3uKCgj9slNiCdUUkqSQg2LJw/ZW/l9dCNxtFK2vopW6lURSqmXhNpx
         kEvqUKf3F1LZYoLiBUhjI2EeyV7B5xQU4oEB8jIs3XA+FyWASEoP0rmBM9kQJGTI4AfF
         2O/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751989943; x=1752594743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmSkHJCz+i+8oNuJ7dtPiAVYrxKnL1IVG/oZZEY1wHc=;
        b=MT9rfK+HaDBJhZNIkDVN9b0568IHRr06lq/7Rhvr4TybXe8Bk7Vrrs8WliLQ7dzKKA
         SRT0gEVtTGrfZscYb6NDZgexuTf13tmOBN1xjyA8KMGMQ2RD+qVV4pDfo6hzypE9Dp49
         0zCuartXoGqcshhZgeMtJQMbtSpPyw7Pe2z++u1qiXuNAPmUQ++29R0tl8BmsyQErZ0l
         sEAI3zT98V82/pey9VJVZzFznwSYh9mJ219rPgLn7+jF1g0l1MoFHmJCZrxebrvmc+0W
         g/c+zfdiWzjhO8dn3VHtWhl05TxGiFdlp8aC12UhgjPN7Ru2Zryi/njTafsKyD6FGj/h
         cGsg==
X-Forwarded-Encrypted: i=1; AJvYcCWI+JbeBlG2qq+QvlWeO5nmHIXFddH3TNp2KvWECJinf281qGizkGLhj+6rv7/xxRmy8wT/4zZfSjXbfjTOlQ1QVmjrRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwipLdDPrqVmcQ0wFhRceazMJ8bKU/na3kRXSN43yNdiEmNO0uH
	YWyu+J2+NcNBkauxSsreJj7bIqjpMAP7VzbsEAAC/S8gq1oq/Tv1KRdt
X-Gm-Gg: ASbGnctLmxWIkEmsZmrbbtNJRzUHfp5kBEmDsCkianrQzLQyFhvENKOKWkkaEn22wHN
	rBC8rHKVn6Dab/qXaarOS3bTXq4y7J5ZwYPtCybEEh+gdhhrpsZqdejoTXqUykBnOBYH4+xiFSp
	F/wLeTVgJ4xDE9o48Cw+bD20GdussEspBAsldwm3H31nuZOyPJ0+6lHq4rq9aKbqVLaMN6xE7OK
	L4yn86go1ypbDODvDZqnCTeZlbLINYuhtmmZzg0RSio2CbT51T2X1UI0480AcAP4vcJMajwhoOU
	x3tT0NBcQII0i0GOGkGXe3GTq/j6wT8AFmEYIu+y3zAI0hjCpyF51vbpRnDYnVJ4w/FWHt2B7nk
	7D/VPWpMhTsmggMXIIMBe2mxLE32r/ryyk56rYwVM5TykPUiipSH9VRQ=
X-Google-Smtp-Source: AGHT+IGObFuGXvT2GzyTk2CgC72i5HKiSRkLhd9+Z4VW0day2YqiJnhXKIGGedkBXsduKaq6TDUcnw==
X-Received: by 2002:a05:651c:409c:b0:30b:d656:1485 with SMTP id 38308e7fff4ca-32f39af8edfmr9210121fa.32.1751989942306;
        Tue, 08 Jul 2025 08:52:22 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-6e-3100-b168-44b6-f1aa-76.rev.dnainternet.fi. [2001:14ba:6e:3100:b168:44b6:f1aa:76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1b1418c6sm16309481fa.75.2025.07.08.08.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 08:52:21 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH v4] media: Documentation: Improve grammar in DVB API
Date: Tue,  8 Jul 2025 18:52:06 +0300
Message-ID: <20250708155206.91281-1-hannelotta@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix typos and punctuation and improve grammar in documentation.

Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---

Notes:
    v1 -> v2:
    
    Left out changes based on feedback from Jonathan Corbet
    <corbet@lwn.net> and Bagas Sanjaya <bagasdotme@gmail.com>
    
    v2 -> v3:
    
    Switched word order in DTV_BANDWIDTH_HZ description based
    on feedback from Bagas Sanjaya <bagasdotme@gmail.com>.
    
    Shortened the patch series to two patches, as parts
    3/4 and 4/4 have been applied.
    
    v3 -> v4:
    
    Shortened commit title and message.
    
    Converted from a patch series to one patch, as other
    parts have been applied.

 .../media/dvb/fe-diseqc-send-burst.rst        |  2 +-
 .../userspace-api/media/dvb/fe-set-tone.rst   |  2 +-
 .../media/dvb/fe-set-voltage.rst              |  2 +-
 .../media/dvb/fe_property_parameters.rst      | 23 +++++++++----------
 .../frontend-property-terrestrial-systems.rst |  2 +-
 .../userspace-api/media/dvb/intro.rst         |  4 ++--
 .../media/dvb/legacy_dvb_audio.rst            |  4 ++--
 7 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst b/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
index 8fb73ee29951..6ac1e5cd50ce 100644
--- a/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
+++ b/Documentation/userspace-api/media/dvb/fe-diseqc-send-burst.rst
@@ -26,7 +26,7 @@ Arguments
     File descriptor returned by :c:func:`open()`.
 
 ``tone``
-    An integer enumered value described at :c:type:`fe_sec_mini_cmd`.
+    An integer enumerated value described at :c:type:`fe_sec_mini_cmd`.
 
 Description
 ===========
diff --git a/Documentation/userspace-api/media/dvb/fe-set-tone.rst b/Documentation/userspace-api/media/dvb/fe-set-tone.rst
index 9f44bf946183..41cd7111a243 100644
--- a/Documentation/userspace-api/media/dvb/fe-set-tone.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-tone.rst
@@ -26,7 +26,7 @@ Arguments
     File descriptor returned by :c:func:`open()`.
 
 ``tone``
-    an integer enumered value described at :c:type:`fe_sec_tone_mode`
+    An integer enumerated value described at :c:type:`fe_sec_tone_mode`
 
 Description
 ===========
diff --git a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
index c66771830be1..4d09ca5876f0 100644
--- a/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
+++ b/Documentation/userspace-api/media/dvb/fe-set-voltage.rst
@@ -26,7 +26,7 @@ Arguments
     File descriptor returned by :c:func:`open()`.
 
 ``voltage``
-    an integer enumered value described at :c:type:`fe_sec_voltage`
+    An integer enumerated value described at :c:type:`fe_sec_voltage`
 
 Description
 ===========
diff --git a/Documentation/userspace-api/media/dvb/fe_property_parameters.rst b/Documentation/userspace-api/media/dvb/fe_property_parameters.rst
index 1717a0565fe8..ce962d4a02c0 100644
--- a/Documentation/userspace-api/media/dvb/fe_property_parameters.rst
+++ b/Documentation/userspace-api/media/dvb/fe_property_parameters.rst
@@ -72,11 +72,11 @@ DTV_MODULATION
 ==============
 
 Specifies the frontend modulation type for delivery systems that
-supports more multiple modulations.
+support multiple modulations.
 
 The modulation can be one of the types defined by enum :c:type:`fe_modulation`.
 
-Most of the digital TV standards offers more than one possible
+Most of the digital TV standards offer more than one possible
 modulation type.
 
 The table below presents a summary of the types of modulation types
@@ -143,9 +143,8 @@ ISDB-T			5MHz, 6MHz, 7MHz and 8MHz, although most places
      (DTV_ISDBT_SB_SEGMENT_IDX, DTV_ISDBT_SB_SEGMENT_COUNT).
 
   #. On Satellite and Cable delivery systems, the bandwidth depends on
-     the symbol rate. So, the Kernel will silently ignore any setting
-     :ref:`DTV-BANDWIDTH-HZ`. I will however fill it back with a
-     bandwidth estimation.
+     the symbol rate. The kernel will silently ignore any :ref:`DTV-BANDWIDTH-HZ`
+     setting and overwrites it with bandwidth estimation.
 
      Such bandwidth estimation takes into account the symbol rate set with
      :ref:`DTV-SYMBOL-RATE`, and the rolloff factor, with is fixed for
@@ -200,7 +199,7 @@ DTV_VOLTAGE
 Used on satellite delivery systems.
 
 The voltage is usually used with non-DiSEqC capable LNBs to switch the
-polarzation (horizontal/vertical). When using DiSEqC epuipment this
+polarization (horizontal/vertical). When using DiSEqC equipment this
 voltage has to be switched consistently to the DiSEqC commands as
 described in the DiSEqC spec.
 
@@ -280,7 +279,7 @@ DTV_ISDBT_PARTIAL_RECEPTION
 
 Used only on ISDB.
 
-If ``DTV_ISDBT_SOUND_BROADCASTING`` is '0' this bit-field represents
+If ``DTV_ISDBT_SOUND_BROADCASTING`` is '0' this bit field represents
 whether the channel is in partial reception mode or not.
 
 If '1' ``DTV_ISDBT_LAYERA_*`` values are assigned to the center segment
@@ -331,8 +330,8 @@ broadcaster has several possibilities to put those channels in the air:
 Assuming a normal 13-segment ISDB-T spectrum he can align the 8 segments
 from position 1-8 to 5-13 or anything in between.
 
-The underlying layer of segments are subchannels: each segment is
-consisting of several subchannels with a predefined IDs. A sub-channel
+The underlying layer of segments are sub-channels: each segment is
+consisting of several sub-channels with a predefined IDs. A sub-channel
 is used to help the demodulator to synchronize on the channel.
 
 An ISDB-T channel is always centered over all sub-channels. As for the
@@ -728,7 +727,7 @@ DTV_ATSCMH_RS_FRAME_ENSEMBLE
 
 Used only on ATSC-MH.
 
-Reed Solomon(RS) frame ensemble.
+Reed Solomon (RS) frame ensemble.
 
 The acceptable values are defined by :c:type:`atscmh_rs_frame_ensemble`.
 
@@ -954,14 +953,14 @@ DTV_ENUM_DELSYS
 
 A Multi standard frontend needs to advertise the delivery systems
 provided. Applications need to enumerate the provided delivery systems,
-before using any other operation with the frontend. Prior to it's
+before using any other operation with the frontend. Prior to its
 introduction, FE_GET_INFO was used to determine a frontend type. A
 frontend which provides more than a single delivery system,
 FE_GET_INFO doesn't help much. Applications which intends to use a
 multistandard frontend must enumerate the delivery systems associated
 with it, rather than trying to use FE_GET_INFO. In the case of a
 legacy frontend, the result is just the same as with FE_GET_INFO, but
-in a more structured format
+in a more structured format.
 
 The acceptable values are defined by :c:type:`fe_delivery_system`.
 
diff --git a/Documentation/userspace-api/media/dvb/frontend-property-terrestrial-systems.rst b/Documentation/userspace-api/media/dvb/frontend-property-terrestrial-systems.rst
index 8cd461ceeea7..8aad9ea817f2 100644
--- a/Documentation/userspace-api/media/dvb/frontend-property-terrestrial-systems.rst
+++ b/Documentation/userspace-api/media/dvb/frontend-property-terrestrial-systems.rst
@@ -52,7 +52,7 @@ DVB-T2 delivery system
 ======================
 
 DVB-T2 support is currently in the early stages of development, so
-expect that this section maygrow and become more detailed with time.
+expect that this section may grow and become more detailed with time.
 
 The following parameters are valid for DVB-T2:
 
diff --git a/Documentation/userspace-api/media/dvb/intro.rst b/Documentation/userspace-api/media/dvb/intro.rst
index 6784ae79657c..854c2073e69a 100644
--- a/Documentation/userspace-api/media/dvb/intro.rst
+++ b/Documentation/userspace-api/media/dvb/intro.rst
@@ -1,6 +1,6 @@
 .. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
 
-.. _dvb_introdution:
+.. _dvb_introduction:
 
 ************
 Introduction
@@ -125,7 +125,7 @@ demux, CA and IP-over-DVB networking. The video and audio devices
 control the MPEG2 decoder hardware, the frontend device the tuner and
 the Digital TV demodulator. The demux device gives you control over the PES
 and section filters of the hardware. If the hardware does not support
-filtering these filters can be implemented in software. Finally, the CA
+filtering, these filters can be implemented in software. Finally, the CA
 device controls all the conditional access capabilities of the hardware.
 It can depend on the individual security requirements of the platform,
 if and how many of the CA functions are made available to the
diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
index b46fe2becd02..81b762ef17c4 100644
--- a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
@@ -195,7 +195,7 @@ Description
 ~~~~~~~~~~~
 
 The audio channel selected via `AUDIO_CHANNEL_SELECT`_ is determined by
-this values.
+this value.
 
 
 -----
@@ -413,7 +413,7 @@ Constants
        -  ``AUDIO_CAP_MP3``
 
        -  The hardware accepts MPEG-1 Audio Layer III.
-          Commomly known as .mp3.
+          Commonly known as .mp3.
 
     -  ..
 
-- 
2.50.0

