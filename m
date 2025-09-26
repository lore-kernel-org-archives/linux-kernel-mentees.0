Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C36D27E
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Sep 2025 00:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758847188; cv=none; b=iUepg45ZIvV0DibfuYtz/Q+CQ+/FAsId1RFpEDYex89+1rk2NhllzrD33g4aFj7MBbi0jTY3dfEdfnDBLjlPkIfoO0JpBjsCvBNmXaJ0Si0AKUfDQv8P0StdNFnW2RWPqvSiZaCeGw2BHaPaqrn8EQCyBUjpNjb9UNvJK8bxQVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758847188; c=relaxed/simple;
	bh=nZu0dQTnI7c0vHRG4WuLt6WI+WkHJQUfIyCJZQwhANk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gmHHJPPi07Kr5mCerQn4+S/1ZXcDMzDV7dRotlgKE2tRZ471ZBcT5AKZMUR6R3x6i3jRyaGY4aHYXu0rccNhayG2SRlZ9n0pjuAceW9M9EGqTSF0VIJfixgUj5P28Pp801lCNbxhtTi3UoY3DhLi2ukRVsRBcSBzQLNuzQMfDzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WIHzA49y; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WIHzA49y"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b554bb615dcso1263274a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 17:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758847187; x=1759451987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKnaVIq0LZ3mDKDeIlNyOzrXDoMYEsJjeAh4xs7zfWQ=;
        b=WIHzA49yTqOq93vkHriBq663crPl259R+oe8S3viti0JlZ3ZVPB8M0eS7qupiJnTDM
         r+N7wQqq8rvQCtDL2Zd0cGKUZzX6hcLL960qdp62Gtn+Dfu6lqfcwfUb6SgMy2kSS9s2
         qVVJcWP0LUSQ8glTQbrQotpZgxxg87i5ddQXfq7xhzTS/4vFIRygAlq9i9qyzpfsn8F6
         5iaD8VZbuCeVCvWPPNhHhAYNiw4rpiTrpHXuCcO2CLYCBUBBzNo/IIkG1tDlXRiwaT+e
         84ZfgXPlGjP6E0RWXff3Z+rrVRDuyYIlhFiRZxb0zg998lvupWe5kPXDIFX1aZyNmv+u
         hm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758847187; x=1759451987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKnaVIq0LZ3mDKDeIlNyOzrXDoMYEsJjeAh4xs7zfWQ=;
        b=ldHBpUaM2DeatuCiXKWGFcF192aCofBnquZ0cKLPmR55dj8yxDXQupPK2pMYc8Pytq
         FWknRXaANv6ou9L2SKgFM2+fRQUyLQYl6z/tz6XYY99j4nGaZGruPzwA8/Vh3ve7GuL1
         SY8XU5C//qyttDHguUz/uhFqfHmbkOtdOj0Y6qWffcttAXXghKXu4avHkcM3DXkMjuNr
         ZiJSBk+wpsaGF3NMmV31BkKMb7JDZDCjnHeOUu9O/buAj/maoRZH51tRbTmsetaI3fJ9
         TyEzsUt9mdC2QDvkBP16X8DrkfuIcbBJuObLc5S4Gn3flAmIooSJnC7w1qd47DLS+AEi
         A8vA==
X-Forwarded-Encrypted: i=1; AJvYcCWni2o2X7UsbBPbT4E7G4L4ZDoHwmmPTylb+viXOVGNOl3Fy6JS7BSUCrI3tAPFxYtTLU6EPmIY9ceUyHnQuS2sc4jggQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKfU7BuNZT9IbMMjr0n2QePy13rWqsSx1tVEs6s4+A+hsSWMCL
	zjQ2adObnL0xqRcYoS/tGLj1rJXdEddacewWFLNt9qooB68B9ytlPh+k
X-Gm-Gg: ASbGncuvFww66BhPuka24E1SpHZS7E0DkqSCngILUQ4U+MSZHBxR/AQtBwlq+6FWcKE
	uJ3ga+CO8rJJYBQWdnpg5LgZXLOtYJaWSms9CYMheFuUaoXK+0b8Jf7pwKrm9G4/AxQNCkIQb1k
	o2A9Nv187ai9NJ9eyZ/l7ti0TAeTGKjiFFclgryMBNTqWS1fd6YnNe251THMCLdc/MV3NXTfiLM
	fBFFHlfUlk3I8phqIc1qMcZHiLEy6bDYjNjRMahVr5HSi0Ec2P8oD0fqGswYN2JKapJ3UZIQG5g
	1XiggakQtiivMIy8SKtcqNoGNjf+9kSf8inR6iERtYR46K8BvyZCDm/924GnSZVZX1O21tQ91gq
	jYVJZ5wXXR/V4zunoTfjI9wXQqZ1Guuaw8iQJVCrqow==
X-Google-Smtp-Source: AGHT+IG326amNIrt95WaEQYYFFDyTfpagBUKaviDy8uBRk8XgT2ltykYjLmd/Lb9/RrzkGixWEyeVA==
X-Received: by 2002:a17:903:845:b0:269:b2e5:ee48 with SMTP id d9443c01a7336-27ed4a5a7bcmr38027585ad.52.1758847186710;
        Thu, 25 Sep 2025 17:39:46 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6882290sm35871545ad.76.2025.09.25.17.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 17:39:46 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: corbet@lwn.net,
	will@kernel.org,
	yangyicong@hisilicon.com,
	fj2767dz@fujitsu.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] docs: perf: Fujitsu: Fix htmldocs build warnings and errors
Date: Fri, 26 Sep 2025 06:09:36 +0530
Message-ID: <20250926003938.5017-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running "make htmldocs" generates the following build errors and
warnings for fujitsu_uncore_pmu.rst:

Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:20: ERROR: Unexpected indentation.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:23: WARNING: Block quote ends without a blank line; unexpected unindent.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:28: ERROR: Unexpected indentation.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:81: ERROR: Unexpected indentation.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:82: WARNING: Block quote ends without a blank line; unexpected unindent.

Add blank line before bullet lists and block quotes to fix build
errors and resolve warnings.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changelog:

Changes since v1:
  - Remove formatting changes unrelated to the fix.
  
Suggested-by: Shuah Khan <skhan@linuxfoundation.org>

 Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
index 46595b788d3a..4edf26f8cfe6 100644
--- a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
+++ b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
@@ -15,15 +15,19 @@ The driver provides a description of its available events and configuration
 options in sysfs, see /sys/bus/event_sources/devices/mac_iod<iod>_mac<mac>_ch<ch>/
 and /sys/bus/event_sources/devices/pci_iod<iod>_pci<pci>/.
 This driver exports:
+
 - formats, used by perf user space and other tools to configure events
 - events, used by perf user space and other tools to create events
   symbolically, e.g.:
+
     perf stat -a -e mac_iod0_mac0_ch0/event=0x21/ ls
     perf stat -a -e pci_iod0_pci0/event=0x24/ ls
+
 - cpumask, used by perf user space and other tools to know on which CPUs
   to open the events
 
 This driver supports the following events for MAC:
+
 - cycles
   This event counts MAC cycles at MAC frequency.
 - read-count
@@ -77,6 +81,7 @@ Examples for use with perf::
   perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
 
 And, this driver supports the following events for PCI:
+
 - pci-port0-cycles
   This event counts PCI cycles at PCI frequency in port0.
 - pci-port0-read-count
-- 
2.43.0

