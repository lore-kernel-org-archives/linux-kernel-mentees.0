Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728938460
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747488475; cv=none; b=QwPASAkgP01exdkUInlKbNu9giQs/Nj808q5k2lgntwdwMxR2TLP0a00oTSvuvDfCZyLM61L1weFewfWzvCQOxrRXvgjWR/fKFeTjcwYyJ4KpsHZbxTP40DTv44Fj2YRtfefDAKiMIkO9vtPvOtrIvljFHJZw4fEAapoTn94CIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747488475; c=relaxed/simple;
	bh=spYfl71UcoSjyBIUumLW2qzFgado5aKo1Uy7jOd1v9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oLu7uHE+GrlrS+iwwufcJ+wIgHWq+zcXIjKb375cWy7FgzsZBSEfXzof0ufJWsUn8GuBJNc6MhEL33h0mpGJibSGnqslJrincnxMqxQ7XZW5zPr9ASwUPSf84UfE/HmYYEA39MqjMswhsPjdlwnsBqHtFMJSCon6zOEMy2gQ21U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnMZWK7y; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnMZWK7y"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-550e2ac6bc9so2966406e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 06:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747488471; x=1748093271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZzU0d/ll5eJJZWcs0vUfV3SAbqRqpju3seLh6okZ5s=;
        b=jnMZWK7yoCVoEtOJZ6Zr5M15hyFl53TYMBc8WwQY0etZw0pgeux5ke8pYZmQbfpMtp
         hDJ0JSFJ4//dc9lTKrXmxTpCnFr54LO+GHI2jX2GgPP+1BLV7PgGjdbl/j+sHsCyiyQi
         vlHlSaOYHSsKrrkYxbdqtfVQcJuIWX5VOMSXqb+9umD/Z5CW/ql/pDQqxoeF1bfttaP0
         9Hzh8ur9+6s+1/1MHN8FABtgRvtNwtH8/FpLoyPUVyleIIXywWRmM+gvn45Pjhk002rL
         i7+1aDouCfBI/jrCAF1IxeAyC8cfDcK9zSXHb7ADcupikLQ6V9TznOg6Qvh4c/S9sr+N
         Gm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747488471; x=1748093271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZzU0d/ll5eJJZWcs0vUfV3SAbqRqpju3seLh6okZ5s=;
        b=pWLesjzoJxuSzFQl8bXidnWg1nKDFJFqJNvph/Wd0CZMJ0Kl0nn009bC7b41jBZmzi
         qBoNZHhFC9EzhAnNOZXVLtHivHJI8zaLeT3zzK1NHBNA67/p1r/bA7Yd7L1FbVZfH645
         7qEKpEnY1gNekb/+liYFozq55vrTswgBY8tJ1of9Se29byCT/clsetDe0anaMUB0O0d5
         gOo782Y5J097F87Qusnl2Qri7vBiVxmzOaLK7QqOe05okczaZhI254o0pu5bCTjy+mqW
         xSEj19hjbGYdQ0j74TVhsAYLQZu4tvxRMYxJ+5uc18KLiE93vsKtRASb60BvdoC3l7xq
         Nwsg==
X-Forwarded-Encrypted: i=1; AJvYcCXFeS+XgNPavaE54FjEWkJim07G0X7CxY+2sfWgBlVD+zPn4yOnrfSrezAoUag9lOwBrdKiiNShJ0lMTVLVJG+hjhoGJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwccJS51HqiQ3SuqWA6n8tdTDOqQNOwsC3D0G63daC3eMx8Rhv2
	1znQLLxE/cx2RXAhKauXFUiv4JqkNPjprX0u+eRGm2x4Rc80aZqWClFr
X-Gm-Gg: ASbGnctHnLuG36k8dXWHwYN0Nv2UQiUBs/DnWIZ6Ut03bxKIMib1HAZ3iKfvmNjt0k3
	QvMc1jQrp+RuL47VfBFuyjNtb2Fsm0PklGjVMSIabVxLXl5vrlHhNcENedyudGtct7D4OKpHklY
	ZPEdFyGAclvIEyFpHEzu4M4u592W0TIBqX5dyfTTg7aus1zbuS8QylhdmLgZW5JMBCKsTIZaYpU
	PcJSH90qTQO5bl8D7zOhVQ5HRCBc65l9dk3XViAmppRY9ZHyB2xNibRv2LRNpPL/ZBF2HNj8kHt
	CtAXkKwKMoCBj3BTF5xAhICEnzLptyj4cqShuS+ZvYZ7M6oT196H6vU8hkOZ4h1TBx++UG+qLgt
	O34dBdUWMDIvMbN0Sj1gz19+a/cE94g3yJtBixwgdJ9Uq7tIJ
X-Google-Smtp-Source: AGHT+IGI/X41tN+PJV1tDajIQvh/s6/qk2bVMbS6HM0NyNmdl3MpRMD4veS1gX3j0LELeBacMxAFNA==
X-Received: by 2002:a05:6512:6619:b0:54b:117b:952f with SMTP id 2adb3069b0e04-550e725782emr2108152e87.56.1747488471245;
        Sat, 17 May 2025 06:27:51 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-53-1500-40ac-27de-68f1-6ee7.rev.dnainternet.fi. [2001:14ba:53:1500:40ac:27de:68f1:6ee7])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf9f9sm8663501fa.94.2025.05.17.06.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 06:27:50 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: mchehab@kernel.org,
	ribalda@chromium.org,
	hverkuil@xs4all.nl,
	hljunggr@cisco.com,
	dave.jiang@intel.com,
	jgg@ziepe.ca,
	saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com,
	corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	W_Armin@gmx.de,
	mpearson-lenovo@squebb.ca
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH 3/4] docs: Improve grammar in Userspace API/fwctl
Date: Sat, 17 May 2025 16:27:10 +0300
Message-Id: <20250517132711.117618-3-hannelotta@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250517132711.117618-1-hannelotta@gmail.com>
References: <20250517132711.117618-1-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix typos and improve grammar in the documentation for
fwctl subsystem.

Use the word user space consistently, instead of having
two variants (user space vs. userspace).

Change wording of denied behaviour to be disallowed
behaviour when describing the interface.

Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---
 Documentation/userspace-api/fwctl/fwctl.rst | 30 ++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/userspace-api/fwctl/fwctl.rst b/Documentation/userspace-api/fwctl/fwctl.rst
index fdcfe418a83f..a74eab8d14c6 100644
--- a/Documentation/userspace-api/fwctl/fwctl.rst
+++ b/Documentation/userspace-api/fwctl/fwctl.rst
@@ -54,7 +54,7 @@ operated by the block layer but also comes with a set of RPCs to administer the
 construction of drives within the HW RAID.
 
 In the past when devices were more single function, individual subsystems would
-grow different approaches to solving some of these common problems. For instance
+grow different approaches to solving some of these common problems. For instance,
 monitoring device health, manipulating its FLASH, debugging the FW,
 provisioning, all have various unique interfaces across the kernel.
 
@@ -87,7 +87,7 @@ device today may broadly have several function-level scopes:
  3. Multiple VM functions tightly scoped within the VM
 
 The device may create a logical parent/child relationship between these scopes.
-For instance a child VM's FW may be within the scope of the hypervisor FW. It is
+For instance, a child VM's FW may be within the scope of the hypervisor FW. It is
 quite common in the VFIO world that the hypervisor environment has a complex
 provisioning/profiling/configuration responsibility for the function VFIO
 assigns to the VM.
@@ -105,19 +105,19 @@ some general scopes of action (see enum fwctl_rpc_scope):
 
  3. Write access to function & child debug information strictly compatible with
     the principles of kernel lockdown and kernel integrity protection. Triggers
-    a kernel Taint.
+    a kernel taint.
 
- 4. Full debug device access. Triggers a kernel Taint, requires CAP_SYS_RAWIO.
+ 4. Full debug device access. Triggers a kernel taint, requires CAP_SYS_RAWIO.
 
 User space will provide a scope label on each RPC and the kernel must enforce the
 above CAPs and taints based on that scope. A combination of kernel and FW can
 enforce that RPCs are placed in the correct scope by user space.
 
-Denied behavior
----------------
+Disallowed behavior
+-------------------
 
 There are many things this interface must not allow user space to do (without a
-Taint or CAP), broadly derived from the principles of kernel lockdown. Some
+taint or CAP), broadly derived from the principles of kernel lockdown. Some
 examples:
 
  1. DMA to/from arbitrary memory, hang the system, compromise FW integrity with
@@ -138,8 +138,8 @@ examples:
 fwctl is not a replacement for device direct access subsystems like uacce or
 VFIO.
 
-Operations exposed through fwctl's non-taining interfaces should be fully
-sharable with other users of the device. For instance exposing a RPC through
+Operations exposed through fwctl's non-tainting interfaces should be fully
+sharable with other users of the device. For instance, exposing a RPC through
 fwctl should never prevent a kernel subsystem from also concurrently using that
 same RPC or hardware unit down the road. In such cases fwctl will be less
 important than proper kernel subsystems that eventually emerge. Mistakes in this
@@ -225,12 +225,12 @@ subsystems.
 
 Each device type must be mindful of Linux's philosophy for stable ABI. The FW
 RPC interface does not have to meet a strictly stable ABI, but it does need to
-meet an expectation that userspace tools that are deployed and in significant
+meet an expectation that user space tools that are deployed and in significant
 use don't needlessly break. FW upgrade and kernel upgrade should keep widely
 deployed tooling working.
 
 Development and debugging focused RPCs under more permissive scopes can have
-less stabilitiy if the tools using them are only run under exceptional
+less stability if the tools using them are only run under exceptional
 circumstances and not for every day use of the device. Debugging tools may even
 require exact version matching as they may require something similar to DWARF
 debug information from the FW binary.
@@ -261,7 +261,7 @@ Some examples:
  - HW RAID controllers. This includes RPCs to do things like compose drives into
    a RAID volume, configure RAID parameters, monitor the HW and more.
 
- - Baseboard managers. RPCs for configuring settings in the device and more
+ - Baseboard managers. RPCs for configuring settings in the device and more.
 
  - NVMe vendor command capsules. nvme-cli provides access to some monitoring
    functions that different products have defined, but more exist.
@@ -269,15 +269,15 @@ Some examples:
  - CXL also has a NVMe-like vendor command system.
 
  - DRM allows user space drivers to send commands to the device via kernel
-   mediation
+   mediation.
 
  - RDMA allows user space drivers to directly push commands to the device
-   without kernel involvement
+   without kernel involvement.
 
  - Various “raw” APIs, raw HID (SDL2), raw USB, NVMe Generic Interface, etc.
 
 The first 4 are examples of areas that fwctl intends to cover. The latter three
-are examples of denied behavior as they fully overlap with the primary purpose
+are examples of disallowed behavior as they fully overlap with the primary purpose
 of a kernel subsystem.
 
 Some key lessons learned from these past efforts are the importance of having a
-- 
2.39.5

