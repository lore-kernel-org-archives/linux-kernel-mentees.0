Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6082E719D
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 19:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758830095; cv=none; b=U0TYqFENpzTMfkvKBTufN0OK0CJU5npW0YTktjlp4ZfGSobiXCoHTF4SqxDuxMjVmw0GnF55jwZep7mWVrZHCyspQZhlr18TZkF/peeiRUPNvv6cFRWrDqTZu7o7JoZvcpYQB7daqE/6MyvWFWXt8KMeIFEvTH9cDJkK8s/umSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758830095; c=relaxed/simple;
	bh=pm5XYw0aXaktnBJIF5cJcO159P8QCT4QOXDxOjBU1n4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzkvB+xkz4vxC8OO0ILEdfocPj3Zcrn9Qc1/Ys5291gEEJbuDhPaDikSQalP03QSKtb74II5B/Eusg7mqJbr9JWBeha2+d0aTncsGWfkAXyA8XrvplXtGsSDHRdpv3QmMjm4a8VSVExXGaN8mCo6z0ltI1+JEZrZlj4Wwp3L1Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZKs5AdS; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZKs5AdS"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b553412a19bso1074220a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 12:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758830093; x=1759434893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cUCRyPPxJwDgqGohVPvUhNuL/vkJ5zITczPe/mg3LcA=;
        b=bZKs5AdSkYuxskgbC5IMeH+HsNXk53kQDQF3ncmrzwA0LG72i+zfvQNBRvYDMCD9GU
         kBLccvxA29rMjo6b8gGgaUfIsSe9F0kkj9HEyjWG7ervTvAY/psGGWHfjSzfBmx2Is7z
         B9hl5ga2wO0tf5XYScTBALLL8MhGISsGaKqCPywCa3gOSovQQjG+npwXUrJGh3oOQoAM
         urZKyEVtQpKxl7zrdTRGy/sb8E5QrqA0YjOc31uBB+ubEH6PZmM2HDce/WSq6vfodNdx
         dr/sMitfmSUW5fHZ+fXXKWOxp8aGAX0fsnCEmzVO1z4IAqppyQzeIoXnTft7UAZRaEmE
         KDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758830093; x=1759434893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUCRyPPxJwDgqGohVPvUhNuL/vkJ5zITczPe/mg3LcA=;
        b=BLkc90pelu5DsAKqCWwVNeK8bTUM8NRTS+5oEqpJDedBILVDcRhM0wWeM9mv28fy6M
         qLmzUgI/bvBZ7h5Q8oe7JhbmjJdTnb1lIFgIBkVlumtUn3fg5qwgkTItODpEdAO58E36
         XAE5OdGR+I6HEFtZfXFkgdO9X3DiexULVDncsG4MH1BtnbD4PWmOTdOlDOh0bRWN7m3i
         hk9THgb2Gd6grxAO+veqq16b+QrblisZmVbciKEXsCCbHhT76LnBWCtaHayf/UAJmhS+
         ceQlLBPADPb2PZ6VyCFKkUzK0v9mRv2lvI4emn6j3rZvRaSd48nVdkmf1geCBjd2JwCZ
         GxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA/ffN4Yy9TvMI0gunI8dRyYaoN6A+T2s0+3jMMeQ66sci7d+/zyawzNT0ltsA2uIKaCgiLEqNQsOJLTPGoQttFNjbuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YweN647h280dowI0icZQOlrBzhOVX15zf5ow02fIzQaV/LwZOwE
	RzwPTo6y5O6X1Gu3LYRtBrmJ0pP5lB4BdNuw/SZYRMON1epKp3BPuaG4
X-Gm-Gg: ASbGncvlDbUWnRhqif1exykBRj5n7Bxwi2MAMngrBUoSguOqdXgSiCBgqp/obLvHiGk
	5TB5n56SG6+JLVm0I4CdSp92/y+X7R1JhcemtXCEqbl6cUtk7/RxmdZcAArT74NPNRUDhULoH2V
	FYyNiVcklsdeOxleUDH/sxxXh4BcM9G/CkHuIurC0lg8pMMOYrHklOX6h4vqqRwIEFbXj8ie3mT
	7rsnfpJEKNPw0HglID8a03IR/fj3iF18y/uKDUGRWzAyHYo40uoeRd9Zftsd+i8zJ269Cbm7JGv
	zhUM/dTbWf90bofZXEtFDa2k9v4Wlxjmhj0KiQzXWuUWSXtzsfrMZa/gqVsRwF7j09qAA+ECsrQ
	uDpnKSVqHHIByZ5UiIrXrdbva38A+Mo9W5U9NJCv9lw==
X-Google-Smtp-Source: AGHT+IHY9FrxRWml+wxJ38dtv6SdmwreMU9YpDdbSEbRQSOjOlzJqzA14wRIb8zcdNBWdW0cQAgMcA==
X-Received: by 2002:a17:902:ced2:b0:24a:8e36:420a with SMTP id d9443c01a7336-27ed4aae440mr55087525ad.40.1758830093015;
        Thu, 25 Sep 2025 12:54:53 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ae5313sm33098765ad.149.2025.09.25.12.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 12:54:52 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: corbet@lwn.net,
	fj2767dz@fujitsu.com,
	will@kernel.org,
	yangyicong@hisilicon.com
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] docs: perf: cleanup fujitsu_uncore_pmu.rst and fix htmldocs warnings/errors
Date: Fri, 26 Sep 2025 01:24:40 +0530
Message-ID: <20250925195442.71997-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Adjust spacing around list and sections for better readability.
- Use definition lists for defining events.
- Replace block quotes with code blocks where appropriate.

Fixes the following htmldocs errors/warnings:
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:20: ERROR: Unexpected indentation.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:23: WARNING: Block quote ends without a blank line; unexpected unindent.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:28: ERROR: Unexpected indentation.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:81: ERROR: Unexpected indentation.
Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst:82: WARNING: Block quote ends without a blank line; unexpected unindent.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 .../admin-guide/perf/fujitsu_uncore_pmu.rst   | 130 ++++++++++++------
 1 file changed, 87 insertions(+), 43 deletions(-)

diff --git a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
index 46595b788d3a..577bad243876 100644
--- a/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
+++ b/Documentation/admin-guide/perf/fujitsu_uncore_pmu.rst
@@ -6,105 +6,149 @@ Fujitsu Uncore Performance Monitoring Unit (PMU)
 
 This driver supports the Uncore MAC PMUs and the Uncore PCI PMUs found
 in Fujitsu chips.
+
 Each MAC PMU on these chips is exposed as a uncore perf PMU with device name
-mac_iod<iod>_mac<mac>_ch<ch>.
+``mac_iod<iod>_mac<mac>_ch<ch>``.
+
 And each PCI PMU on these chips is exposed as a uncore perf PMU with device name
-pci_iod<iod>_pci<pci>.
+``pci_iod<iod>_pci<pci>``.
 
 The driver provides a description of its available events and configuration
-options in sysfs, see /sys/bus/event_sources/devices/mac_iod<iod>_mac<mac>_ch<ch>/
-and /sys/bus/event_sources/devices/pci_iod<iod>_pci<pci>/.
+options in sysfs, see ``/sys/bus/event_sources/devices/mac_iod<iod>_mac<mac>_ch<ch>/``
+and ``/sys/bus/event_sources/devices/pci_iod<iod>_pci<pci>/``.
+
 This driver exports:
-- formats, used by perf user space and other tools to configure events
+====================
+
+- formats, used by perf user space and other tools to configure events.
 - events, used by perf user space and other tools to create events
-  symbolically, e.g.:
-    perf stat -a -e mac_iod0_mac0_ch0/event=0x21/ ls
-    perf stat -a -e pci_iod0_pci0/event=0x24/ ls
+  symbolically, e.g:
+
+  .. code-block:: bash
+
+      perf stat -a -e mac_iod0_mac0_ch0/event=0x21/ ls
+      perf stat -a -e pci_iod0_pci0/event=0x24/ ls
+
 - cpumask, used by perf user space and other tools to know on which CPUs
   to open the events
 
 This driver supports the following events for MAC:
-- cycles
+--------------------------------------------------
+
+cycles:
   This event counts MAC cycles at MAC frequency.
-- read-count
+
+read-count:
   This event counts the number of read requests to MAC.
-- read-count-request
+
+read-count-request:
   This event counts the number of read requests including retry to MAC.
-- read-count-return
+
+read-count-return:
   This event counts the number of responses to read requests to MAC.
-- read-count-request-pftgt
+
+read-count-request-pftgt:
   This event counts the number of read requests including retry with PFTGT
   flag.
-- read-count-request-normal
+
+read-count-request-normal:
   This event counts the number of read requests including retry without PFTGT
   flag.
-- read-count-return-pftgt-hit
+
+read-count-return-pftgt-hit:
   This event counts the number of responses to read requests which hit the
   PFTGT buffer.
-- read-count-return-pftgt-miss
+
+read-count-return-pftgt-miss:
   This event counts the number of responses to read requests which miss the
   PFTGT buffer.
-- read-wait
+
+read-wait:
   This event counts outstanding read requests issued by DDR memory controller
   per cycle.
-- write-count
+
+write-count:
   This event counts the number of write requests to MAC (including zero write,
   full write, partial write, write cancel).
-- write-count-write
+
+write-count-write:
   This event counts the number of full write requests to MAC (not including
   zero write).
-- write-count-pwrite
+
+write-count-pwrite:
   This event counts the number of partial write requests to MAC.
-- memory-read-count
+
+memory-read-count:
   This event counts the number of read requests from MAC to memory.
-- memory-write-count
+
+memory-write-count:
   This event counts the number of full write requests from MAC to memory.
-- memory-pwrite-count
+
+memory-pwrite-count:
   This event counts the number of partial write requests from MAC to memory.
-- ea-mac
+
+ea-mac:
   This event counts energy consumption of MAC.
-- ea-memory
+
+ea-memory:
   This event counts energy consumption of memory.
-- ea-memory-mac-write
+
+ea-memory-mac-write:
   This event counts the number of write requests from MAC to memory.
-- ea-ha
+
+ea-ha:
   This event counts energy consumption of HA.
 
   'ea' is the abbreviation for 'Energy Analyzer'.
 
-Examples for use with perf::
+Examples for use with perf
+
+  .. code-block:: bash
 
-  perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
+      perf stat -e mac_iod0_mac0_ch0/ea-mac/ ls
 
 And, this driver supports the following events for PCI:
-- pci-port0-cycles
+
+pci-port0-cycles:
   This event counts PCI cycles at PCI frequency in port0.
-- pci-port0-read-count
+
+pci-port0-read-count:
   This event counts read transactions for data transfer in port0.
-- pci-port0-read-count-bus
+
+pci-port0-read-count-bus:
   This event counts read transactions for bus usage in port0.
-- pci-port0-write-count
+
+pci-port0-write-count:
   This event counts write transactions for data transfer in port0.
-- pci-port0-write-count-bus
+
+pci-port0-write-count-bus:
   This event counts write transactions for bus usage in port0.
-- pci-port1-cycles
+
+pci-port1-cycles:
   This event counts PCI cycles at PCI frequency in port1.
-- pci-port1-read-count
+
+pci-port1-read-count:
   This event counts read transactions for data transfer in port1.
-- pci-port1-read-count-bus
+
+pci-port1-read-count-bus:
   This event counts read transactions for bus usage in port1.
-- pci-port1-write-count
+
+pci-port1-write-count:
   This event counts write transactions for data transfer in port1.
-- pci-port1-write-count-bus
+
+pci-port1-write-count-bus:
   This event counts write transactions for bus usage in port1.
-- ea-pci
+
+ea-pci:
   This event counts energy consumption of PCI.
 
-  'ea' is the abbreviation for 'Energy Analyzer'.
+      'ea' is the abbreviation for 'Energy Analyzer'.
+
+Examples for use with perf:
 
-Examples for use with perf::
+  .. code-block:: bash
 
-  perf stat -e pci_iod0_pci0/ea-pci/ ls
+      perf stat -e pci_iod0_pci0/ea-pci/ ls
 
 Given that these are uncore PMUs the driver does not support sampling, therefore
 "perf record" will not work. Per-task perf sessions are not supported.
-- 
2.43.0

