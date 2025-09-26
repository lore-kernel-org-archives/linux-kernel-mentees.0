Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6882265CC9
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 26 Sep 2025 04:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758861489; cv=none; b=cUinPZalDMElIyQqkaYMDYrk7ZjWt0yzFzZ7ZpLUw+G+jtjzytgKR+aLNunoHFEgOJNU+Pf1U7TizMgPAseRIVBwuR4ygvPbmtJclqb0AW3QYX27zYWC5n3QkpMtkFnnl550lOXAnnJZ8ua/s2ywSGEFleACOe8iFjj0Hnk986Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758861489; c=relaxed/simple;
	bh=XxNUnF48ZRFqZW9hajoozJasry2cnE3h51zgRy2n1Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CwJ4bktoPYsKTlp2jgJJAVBTSaCAn+5NDxagFrzbqVtxPZ1WTHtw5l3Hawxppvl3uKdn8jsBvTVKpN58cLlE8nUi6w1y14e/qash57stL5RKKXa0Tx7muUygUFwC8+eWyrCR0a+YnX85fOx/CiWh1VOS0ds9vlLp7BiwRhiep28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edLCqTv5; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edLCqTv5"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso1495334a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 21:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758861487; x=1759466287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZiOeCBkD9AashlSYKExPHxF3/Li1hvwvZEe5pWzXEI=;
        b=edLCqTv5qF/htHIUaRO5i0/t4RHgD9MhxIPy2nBJcItTv54d6ED5uAKFpYXO4ltzLJ
         JIutXBF2uomFD6wImFIUkK9wOm6MD+IkM1trgR6PWBqkRDaxTywqZOomGuNwNbvkaaXl
         GejVFEM9DjfLNDLkHRVV7+k8/B+a6NIzyl6/nAJk3wymA8ikTUKajgsHo49rT4LiV/2l
         yJdEuOi4BmELFSM7U61t3LwtKk9xOdkYFjonRTVLO19peLyZ1egEmqYcKRNib2dEvsgH
         SStHCY7ahHgBGq1BBUIbExstX48iItF5vzPXUEoOLmXubq7RVYXEKh6eh/h7cEa3nDMf
         t+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758861487; x=1759466287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZiOeCBkD9AashlSYKExPHxF3/Li1hvwvZEe5pWzXEI=;
        b=SdethItpsDHqLLVAM4UZLLmFzTdse9oiqPnq4Alao7nJwCLysCIs6BzOWLZiKRTYZo
         0YxIyAecCdplUY/9be2lDsZfS+uoA0VMHCkx0KZp+OFb8311cn13VS+mAaDftkEMoiEK
         Px2pnfs5fV0O3MTLRdUrl49NNT873TiubOx6lpT9vmlwSfsmChHcEyK7PxT3cIc5nHhp
         zRj5tqpC3B0GDGAJ1zuCSrxGyzdLsrN5nVgaZkP8Zv8uH/P0E8G88XMeJuG/UMuw4Ndj
         KF50ASkB0DM0l93FFcrVGUYnn83N8TKyzc7gI7zASYkbmpZ0wfc/kVHxFQDpR1JIceFj
         GhCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/jcRaflovhzK9v6E0ypEOSEMg/gg0XgxLwGnn9zug+Bc+RNSFbyzFvuSBjm2XuINjP8C4ImRZrii3AZi9SpBAD+dhnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwV5b3Kyd3KPle6LGiOQrkbTY+JFIdCBrS03r8xiZzzK3rAbxaw
	Duqv6wU+naqB0u3W72dQ/vCZC1cwVME27tLx7M84KPY7uYxdB6o3WHYF
X-Gm-Gg: ASbGnctxo3vTrcjOOdxYROuz9MccvmXC7JEjBSdHcONxlBOVr4/ZAzKamajvTRLLExm
	KLRSOYgqB6+rdL6qr56bcP7CYoWyeVEw1GWadr1j4/hMvayU+hGt0fiHFtiqzOdpCjIZbm4q1Dk
	39DqcM2RzKCPdH8YDm4E89RpAmGuxgh/3kkzYv1aFpkAsvZgA0eifq2KZ7BxsFw1Zpl4pEbtffQ
	lsT29pd5IpG4yHei8FarDNuZTAy8TLQ0VT4JYcHCESNyhqGE4bJm/o0Go8PhsrPiSez1LjREC6R
	AIT5SSZauh3PunA/cOR53Di7YgqfAyvlnl8+RAOPdrBIs3Ag76Nq8GCZlJC3gfA5n1OOsRccKET
	t1uWnd8MU/BueQajOnV5DXtVVCASUtzcK06TKcFBRw6Xw5t0ITStlzegMvWde6nI=
X-Google-Smtp-Source: AGHT+IHnIagXLZzhg+mqFHzQFg/2tOmjiL9IaTl/AeYOkwIL583UfLqraCIikoD2UGjeFiTT9r6mHw==
X-Received: by 2002:a17:90b:3890:b0:32e:3c57:8a9d with SMTP id 98e67ed59e1d1-3342a30ed08mr6286890a91.30.1758861486907;
        Thu, 25 Sep 2025 21:38:06 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55be61bsm3512682a12.48.2025.09.25.21.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 21:38:06 -0700 (PDT)
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
	linux-kernel-mentees@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3] docs: perf: Fujitsu: Fix htmldocs build warnings and errors
Date: Fri, 26 Sep 2025 10:06:12 +0530
Message-ID: <20250926043748.3785-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <61aace07-890a-4b55-8e84-935ebc4a3be1@infradead.org>
References: <61aace07-890a-4b55-8e84-935ebc4a3be1@infradead.org>
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

Add blank line before bullet lists, block quotes to fix build
errors, resolve warnings and properly render perf commands as
code blocks.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changelog:

Changes in v3:
  - Properly render perf commands as code blocks (use "e.g.::").

Changes in v2:
  - Remove formatting changes unrelated to the fix.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Shuah Khan <skhan@linuxfoundation.org>

 Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
index 46595b788d3a..2ec0249e37b6 100644
--- a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
+++ b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
@@ -15,15 +15,19 @@ The driver provides a description of its available events and configuration
 options in sysfs, see /sys/bus/event_sources/devices/mac_iod<iod>_mac<mac>_ch<ch>/
 and /sys/bus/event_sources/devices/pci_iod<iod>_pci<pci>/.
 This driver exports:
+
 - formats, used by perf user space and other tools to configure events
 - events, used by perf user space and other tools to create events
-  symbolically, e.g.:
+  symbolically, e.g.::
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

