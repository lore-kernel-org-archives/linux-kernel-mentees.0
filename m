Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017815FB95
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 01:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730943545; cv=none; b=cmh6BoKDHchQAaYYsVAdkbOIh+pcrVpF8iXM+fWq7vBL3WCkoD8+/EDjfDgH3EfUPuxftsgMdrea/WhoFXQ6cmlC7/rF2dWnHO7E8snZOjwpEa9/3BEevSWxqDOx5HwzkmcEi6N5CrO9CbmkK6d58Zeme4pX7CFLkpdQI/PTfsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730943545; c=relaxed/simple;
	bh=qcmO3butkyf9S9hDvHNO6PAqc4S2Y1RMp5t9xb/uy+g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MNbfAMlz4/hlLMJeDInAoWrNgSEVtg4t3u9ZzbHwoqbOS63pwsMc5fUfovfdmduRi1RBrJVyPYdydxSRNt0YE2eKJUCrv/zxj3NugbdnFJEB+swrsL6884qRxj5k2IAKe1voQfdw7bXsENR7hGdG3/zbkI9NBIGosxBEj8Va+Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNpoPqG3; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNpoPqG3"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F5E6401AF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 01:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Km-TIrzjyTA7 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  7 Nov 2024 01:39:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=xandfury@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79DCD40120
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79DCD40120
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iNpoPqG3
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 79DCD40120
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  7 Nov 2024 01:39:02 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2110a622d76so3540205ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 06 Nov 2024 17:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730943541; x=1731548341; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fdhiRbRVANeH5DxJ2qjyPpR9WFDsKtpXSkfdoqxRRKQ=;
        b=iNpoPqG3KtvdN1adYmXm4eLGnTZLYDAsq9uhOocDK8E9SRORO0bqh221I29EOTF8hN
         hndGT0W6TZSVTMCKSHSeWjuQ3kDhHpriGU4xP+NunyI+OoBrxZNVU08S6SrjWtMkQAmN
         l5ohSeDXF8MftvGDSqU3tQdNUxloxbMW3DZ/sUNPmc2LRWochN5Mn6oIVcCZuziXM9Ar
         kW5t/m1O2xvtuIoceSFajdsoOe6/ubXOiX+sENwoPv4CQHih6ndNVNdr6wyDx7ge7MgO
         w5vmcZErsI9twoWvAHW7K8KcYluG+uDfrc3YRI76QC53PB9eIT2ntnq1S2kIX/1AsA3u
         U/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730943541; x=1731548341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdhiRbRVANeH5DxJ2qjyPpR9WFDsKtpXSkfdoqxRRKQ=;
        b=NDL9521YS43JcLcoutGFsPMU7eoH+ZVx5x3wUNNiTsFQ3KNR40Be5brtjvEMOP0eea
         jM6CWTiw0MAKFN9qpfdTlmoE6DzvPQ14F1aw4PsfJotuYDSSNzfR+F4GKvgAb/OLwEDd
         ukNj4bsjMbV7k6hHpkwm5sxS2R2NBmt3WYvstpCODoGfqbrvSR1RV6UXGGROkEnqUt9+
         4YdIB/ACQOC9AZpTpqm3eBj945NLN1WlKM4ElgSndreGa7j5MSoe5dLQ6T9hitWSOXr5
         h9ncMrOsbfFTuY0eDg5k6t5kj2pMiFQ8qgE22u7n/0thops3Qs9vaDoJxoOu3SZxES5b
         Ij8Q==
X-Gm-Message-State: AOJu0YxSf526EiQMqtNzJ+TNmXUGvt7A6Z4UcMyl84gM6ETXaxDXvWsI
	tV6A4qMru22taHwSG1hHY0eWgbTh9B+5w3Q/lXkYIpmvQID2rbHWNKCt9B0p
X-Google-Smtp-Source: AGHT+IHuTqOh4eTJddN7RSk1s0qxdkb7hTuRGT/uf32xnm0L9Kp3Vgyr8KgWO9NbuFzi+vHhn7dc3Q==
X-Received: by 2002:a17:903:230e:b0:20c:bf43:938e with SMTP id d9443c01a7336-210c68d3ee4mr597180145ad.15.1730943540680;
        Wed, 06 Nov 2024 17:39:00 -0800 (PST)
Received: from 1337.tail8aa098.ts.net (ms-studentunix-nat0.cs.ucalgary.ca. [136.159.16.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e41890sm1172905ad.147.2024.11.06.17.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 17:39:00 -0800 (PST)
From: Abhinav Saxena <xandfury@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Abhinav Saxena <xandfury@gmail.com>
Subject: [PATCH] hwmon: Documentation: Fix grammar in fan speed trip points explanation
Date: Wed,  6 Nov 2024 18:38:49 -0700
Message-Id: <20241107013849.47833-1-xandfury@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several grammatical issues in the fan speed trip points documentation:
- Replace awkward "which % the fan should run at at" construction with
 clearer "that specify the percentage at which"
- Fix incorrect "is chip depended" to "are chip dependent" for correct
 verb agreement and adjective form
- Improve readability by reorganizing first sentence and separating the
 complex explanation into simpler parts
- Add hyphen before "see" to improve readability
- Remove redundant "at" in temperature description

No functional changes, documentation only.

Signed-off-by: Abhinav Saxena <xandfury@gmail.com>
---
 Documentation/hwmon/f71882fg.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/f71882fg.rst b/Documentation/hwmon/f71882fg.rst
index 38e30fbd4806..53d32bf06b70 100644
--- a/Documentation/hwmon/f71882fg.rst
+++ b/Documentation/hwmon/f71882fg.rst
@@ -178,10 +178,11 @@ Writing an unsupported mode will result in an invalid parameter error.
   available on the F71858FG / F8000 if the fan channel is in RPM mode.
 
 * 2: Normal auto mode
-  You can define a number of temperature/fan speed trip points, which % the
-  fan should run at at this temp and which temp a fan should follow using the
-  standard sysfs interface. The number and type of trip points is chip
-  depended, see which files are available in sysfs.
+  You can define a number of temperature/fan speed trip points that specify
+  the percentage at which the fan should run at each temperature, and which
+  temperature sensor a fan should follow, using the standard sysfs interface.
+  The number and type of trip points are chip dependent - see the available
+  files in sysfs.
   Fan/PWM channel 3 of the F8000 is always in this mode!
 
 * 3: Thermostat mode (Only available on the F8000 when in duty cycle mode)
-- 
2.37.3

