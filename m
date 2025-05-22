Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E34289813
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914816; cv=none; b=KbRzhXCtj5qqiT/5BH8ea3cxumruy1bk/CfJeu0kU5SlM8DGF9fKJglFhC1sd2AsMi8woXjv6/OuljdPSnrEQ8HSOcvF+f7+kyyOoIjMVC00i85RxcyAu6MzWkKqSn7HMwJiP3BmbCex0OdY1rUOjx8SGBOA2SOXqyPR7Bn7mw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914816; c=relaxed/simple;
	bh=ijy9JScg8N1C3zekgNmc1lKwg1LhXgjoX6IU9odZsxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fjpx2XxOXmb3DeR2a+wBjyQvVCKNAEo9/RnjlUIybmo8rL+fvEvIRROlqKuvNF6XQiJxLCCN0mvvcCiUrpMJCeZeJ/eObooAN4NiRei8xN+0EezjDvsZ4V6UermqHkAyIC+beFwFjcDDvgWfBQZKgRjMTLZ3X3QbRoQ2yRixNXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jt2H1rul; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jt2H1rul"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-551efcb745eso5982234e87.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 22 May 2025 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747914813; x=1748519613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwMF4Gfg4Vle5CpbfWncakzXgFVxIYbBHZBQLHfwCBI=;
        b=Jt2H1rul9EkLZYfYSlfNpypqUnVOP7a4gXrtjFhH65h3tFYUVxjpY6bncuydWPTufL
         Q5Ue4k16oow5aTjGIVj2bF4G8yKBd0C1IRzymmDavTD24nNQx03Dt6+Zzr/Dk33obCQh
         EoLL7DO9z2kDGV4ya7trhirTCHXyvY/h9z5//5UczZ13Z8dTa0q9yKax5airN68XumIk
         doKX/ng+YC78mRLVpWCpHorkFoEtoiTen98PqkZfrnkrKIeNI+SR9mI18sziH8MNwHcc
         vpM9U1qN7BGD1mZjGFeagxRIIOmCHNdksHNhKVpzXlzenROizh6XUv+ger1k6WDQGx1k
         UDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747914813; x=1748519613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwMF4Gfg4Vle5CpbfWncakzXgFVxIYbBHZBQLHfwCBI=;
        b=e9MwOlw3JnVu030wp0KqSK0hlAr6w5l54FJCy1zwcZe+s3jJg22HJAWEWuJzKK6y88
         WM4TbRYg67uyzdT49A2/FtlQ0GaAOZVca6zfe+rtfRKI6BY/jPzGo7CWkOaM93ZgUqGT
         qstrysTMeVejQlDeHkmtOoTbW5259dPg4u4OH4HmH/yjCpKuN+mHG+jvyG2o7M8t1t1l
         Z64kEFO/88nzuH9UVtAsjYOa/sJszpMhThVhjCmH7jeFxe7Oc7Sv0ELVkwdRIvw/0MK3
         VVo5zD+X6Ve/Pq4Ptris4KsHFpo2hZoEYFUbDSzcOeb42In3zhLwgq3KybQtghvKWESR
         UdzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8u/XP5jxVY3313AHXzF1WcGXacI4uAVTd4pA1WNEYORiRMNCYT0k7WBIg/EaJDKNqniX71IrikfRlTi0QeFe0jRabLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNYfUFKdPqy2hiNgZs7gCSZvSYOUMc4N1J7nGRNSIIDLZ9JqbI
	QjqyiN8Vdtb/DMEsc7D3KTYZI4V9ZZnbwuUCIgcZGQ/rEZtXjt0P3VbO
X-Gm-Gg: ASbGncsIzq+OxL4zC639haV2lfSnSTg6ztmHS2Ik8v5wLGF8B9L4OMLRCfN/3O5v5fd
	x4+zFqWpUGhEF7ONNDxrPv9B3zw5+lBQBkMn4eteDiHiaVIJFL4z2W8ZjZJGxt0rLktkXv8q1ZG
	W9S7hjyKdYbmNTZzpzUNw3PVmELDzl5/l8l5KnkS46/yRgq6wrXgdixfhWhtG4ldf7x6G5a6qWW
	OET3IYyO79+iHJ/KSywd6IUg3TKHuvLCNEDxQgsr9bctuyZu+28Nk8Ttxp07Njs5MLvW77ZyrIy
	RfSwGzdNJYKfydiA7nE6xl82nsKI6v7bRLVzOCyZRPj/AjtRqbj+iDcRmSrZ/+i1n+K3JRe2wuu
	ID6Tk2aXlyQDwzBkJ0poCg1nJKqv/m8+ZEbl8XjUsQvCpNg==
X-Google-Smtp-Source: AGHT+IHGfGAbdjCjz0z4GkbijHMsN49HXcO1yeU1zsxmyp3p3oqHwPlIjWdOMgxU5lbxtz/VoIOTfw==
X-Received: by 2002:a05:6512:3e04:b0:550:de26:1f23 with SMTP id 2adb3069b0e04-550e71bb785mr9605192e87.16.1747914812546;
        Thu, 22 May 2025 04:53:32 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-53-1500-7c4-bcaf-182a-540c.rev.dnainternet.fi. [2001:14ba:53:1500:7c4:bcaf:182a:540c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017e79sm3343760e87.154.2025.05.22.04.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:53:32 -0700 (PDT)
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
Subject: [PATCH v2 3/4] docs: Improve grammar in Userspace API/fwctl
Date: Thu, 22 May 2025 14:52:54 +0300
Message-Id: <20250522115255.137450-3-hannelotta@gmail.com>
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

Fix typos and improve grammar in the documentation for
fwctl subsystem.

Use the word user space consistently, instead of having
two variants (user space vs. userspace).

Change wording of denied behaviour to be disallowed
behaviour when describing the interface.

Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---

Notes:
    v1 -> v2: No changes

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

