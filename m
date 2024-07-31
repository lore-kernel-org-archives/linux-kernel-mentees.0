Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFB24437
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 00:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722384972; cv=none; b=pzAfmBGTOTCXJszeQnuzhb1xMPxlBUEWIIMFIS3LBVW8fXmGpOvISjk/r7zUbPhZkSdOdsU5eu8jFTKVR4NDc7+0je3QlSW3gcqkm/k+FrohqW+pCgXKKkia7cJIEoK8U0kazJqymaP3U6cVIgRb5/nqwM0CiYN549AvC2gt24g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722384972; c=relaxed/simple;
	bh=IgqLaxo/OHEm/D75VDf/y0x0DQoL9NGxFSzNrXGPcEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pz+aKumSce51vhgVSPfnpXZrW9uIPc1z15BTdE1aLrCDt+geCb7XJcsl2jsq9mkGOIG8wIp2Zhr/JBjEQEjEHFFeT5ucCzBwrzKcEGc9m6CFVrNpOj5OWkOKpr0jWEJxjSNqeeNj1Wj802D04fZZMXqGmnWiKxaVIWBwZSmrDI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLSpzStl; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLSpzStl"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 942A560A71
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 00:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qCi3Jg2IVNH for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 31 Jul 2024 00:16:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8031D60A6B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8031D60A6B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MLSpzStl
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8031D60A6B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 31 Jul 2024 00:16:09 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6694b50a937so46516727b3.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 17:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722384968; x=1722989768; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwdnCsCQMNgwGC4xpVHvPeVi+xBLWUp6NbXom0FK2po=;
        b=MLSpzStlKze0QVmkfmEBlVruyri7DFOm9PJit8wHLk5dm5+cg71Vmolw/1ZKd1syUu
         aHprYGNgkXA3bJnHIH/h3MiuVz1VGaLcBRF158vnILO2qTBZb8bNhxAy909syerajfJ/
         OyN789KUcXgYcWW819kCJhIPgC7YyraAFMQkq7Vpdnqqbx+cCQs3H+SPDPakwnt7L07I
         wTw/PhttsD5tm7Rq1TgNT1khO+eZC1HgKeFYY3VNMxHU/zFjN+wvTEhRn7pDtZOMi031
         +7+JHSIsVRp9xdG0o6a/byQulySh6CGgWxjpkLUO6sygNaLa0+bzD4mtLOnoOO7SDCYy
         qq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722384968; x=1722989768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwdnCsCQMNgwGC4xpVHvPeVi+xBLWUp6NbXom0FK2po=;
        b=mn+m0C+zR2Tz9vLjdlbUfr2eF1e/k7sJxLV5PJRcgtFFyvIMo6r7G1ckxgF1LrvPIG
         40cD32/AOSiHyveO7zCmDmb1PJnABJxjOUts4av93wYcIuLpcvjEnw7GLZpctAPkken9
         NeYD9kxeM0M1cwXk7l6EK3+yTI8tjCX4sapd+SjsgSggakzISIg/Lw3Hl7LyeFKpuwuU
         9sPaZWAF/rP6Q+M8O5gNLta/ROBphY67R3e26StDnUaS7DTUP6lstzVdAbGP68Io2c2c
         LGLQCHRyr4H+wKQEdkzVm4KhPGGIWJPlC4bYK/UBkIFYF1CqxXf37c4oLpAtiZxTxBJq
         2zdg==
X-Forwarded-Encrypted: i=1; AJvYcCXxy/Mnxerqhua0y6rEbPFGzCiNvCEZKaqpjr0NIXNUAmQx5YIrdnx1/6HxYbEgsVBYYntTlVBZVOW4l3UMWEGMqIBoQ7cBa1HVqqIBO8cOl8qaW5gfSZL8uhzkV7Mu
X-Gm-Message-State: AOJu0Yywuhl0UO1I/8VvyGRPvaUoCcMMrj5f9rsXYvdCbGep38wnnrwt
	Dyratjias1Y6hT1p4eJeKHXb03RCZk5YfQJDYiCj0Ur/NoNXAVmu
X-Google-Smtp-Source: AGHT+IGxDCZIaBjQmG19x/rKvVdHhTyCGMhA3BdgvEkyguTA/p6nT7eLwvjd542OAvXKDGX+06G6uQ==
X-Received: by 2002:a81:a20d:0:b0:62f:aaaa:187a with SMTP id 00721157ae682-67a0672bd91mr138831297b3.14.1722384968043;
        Tue, 30 Jul 2024 17:16:08 -0700 (PDT)
Received: from x13.lan (2603-9001-2ff0-a230-0000-0000-0000-1896.inf6.spectrum.com. [2603:9001:2ff0:a230::1896])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756b303ec6sm27468397b3.81.2024.07.30.17.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 17:16:07 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: W_Armin@gmx.de,
	corbet@lwn.net
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: [PATCH v3] platform/x86: msi-wmi-platform: Fix spelling mistakes
Date: Tue, 30 Jul 2024 20:15:59 -0400
Message-ID: <20240731001602.259338-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There were a few instances of typos that lead could to confusion
when reading. The following words have been corrected:
Binay -> Binary
singe -> single
chaged -> changed

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
Changes in v3:
- Address review feedback regarding subject line 
- Link to v2 https://lore.kernel.org/all/20240729223649.135639-1-luis.hernandez093@gmail.com/
- Addres review feedback regarding empty commit message body
- Link to v1 https://lore.kernel.org/all/20240729164721.125708-1-luis.hernandez093@gmail.com/
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

