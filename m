Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2A120E023
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 22:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749941656; cv=none; b=cwAmz9OzxwEgw2ro5ggjlAOXtS1/T29anxwj+LW8bkLvj5nU8nwoo23kFiKtqahNr2Ac7VeJp+ZBxx4VP4kB95mhhMx4f2/tzc2zioNBDMW0bd9tdtx9Qzrh0Z7vn/PHPGRajHKjfzFeDfb0JYhWnf1HHO5M0xhoJ4dMbLxQdMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749941656; c=relaxed/simple;
	bh=lN3BpAZoazXqsfOZcneaole++Sjm5m7VSC0L1t8WFk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WoZYzBZ/CaDk47plYmVCS3GcpYkIdhbzyGvJqb1eGXW7SZehgLWU13OOZOtjiuAleKpPG/IAd2va7Tc3a0E7P5hvTIKLXZTvM9A/F/pCDhNxrR6tjoOFieYCa31dXe+hsassKlhBgq+yMWt7pK+g7gyZj0+36JnwNeEGkCDyYcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIWx2Ckc; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIWx2Ckc"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4e62619afso288226f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 15:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749941652; x=1750546452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSWTfDytlz01KBOuhR0FulJcEEhd6xAGRNsL1vqyiC0=;
        b=hIWx2Ckcz+iplVn4swhgv7SqKyWg1l5Buzq3dSOXNbe45IBgqEZe5TcVB0TOK0ijCe
         4VPr3p/XA2/WPfuLHAjG55m/how61T0No9pwl//E2QHE1AJOCuWz/+TOmo6F0yRMdkJT
         VxNJelMRJxxZjHcnwtizpi9loX7Y49GHcUuoN31qI1nzLJ9l2zlSvr0w1dVxspXGc5OJ
         CV258AaNnSL2FWN8uMt4ipK4t0QM1wVljTW9HpVSG11EhhlvaSrj3tVW0SAUHLUa1acG
         MpIhhuIuwmMOfs/gbruY5IHk1fX1RjA5i6onOQcLREQcssYfGXEB4YRBLPqJsuDaYX35
         UNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749941652; x=1750546452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSWTfDytlz01KBOuhR0FulJcEEhd6xAGRNsL1vqyiC0=;
        b=w5gJs1cqQmHT9x//0lYhEop4OjhL/NPl/ImB4jPVsKUfY1FBViZaMSbGDvissocEx4
         ey4vnLvbElVxthkflFgAVg9t1TZvRPqjvri3PA1oaDPQG1UKqN1XdFt7mA7IFXUTxJxw
         PMWH6nkuiQyICYJrG6JcV9PCQkPA/YzSmUjMSbVrjFSyi/opuYXPmWkxlAMSlyVM4CF/
         PkWrT07vLAy9i3qQTOSw3ZEYr3faFSnWFyuaUJK+vvZ84DrtTGsHRdFMxfEshm2gMRI5
         nR80XAQBfzTNZZypHPO9SPreIrSUidaTsFHJaZDdEAL7ZS9goQjCQu0H1X/5KnnGqdGj
         2K2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLIETctkZ7BTah5ey9azIP/iCATBxh8PDbZl9LGTJ2DVlKfRfMCmHDhC6/FU3j8rZzm8O0uWCOQ77gk03BAAqCHMrhgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxffwtUpETHRljW801+RE6vac3iYAiJCm64yVbX5sULNmCkciYd
	SKyOavSDzxwnHfn3T5d2/bUD6ypwX6SwIbdeOR+FZfrSHs8tFoLzlNfF
X-Gm-Gg: ASbGnctaA48YzRfc1XGXU23sntjKZxDDZrwmJgrPKda45L4/WnJXm3FfzzyHTBIT2gK
	uSN2bw1tGHDn0ZMW9Gw0OO2RylHwFO5qkO9H2gzgR7sZUfq0VBIP6uY9ebimeXiW7GEnxfqp2mg
	3lhkz39ebDitKI4gwFHN8onWQG4kpK5Rn6OhmoXTnbV0/P+iJumQPt5kS6y5sF2psUBSDlNf5T7
	eCNfnF9zyku938SMO0kUWs001zdbtUgZpUJUskivg5AoHRwOC8AXvndVfZFda97ieElWvEfpN7W
	MRinLK/S/gEAGRrMqYdnoL8QYQ88f13Q79EdPRiEe4SpvRrbGujK5ypCzOYpHW9+hRNSjZQoRKG
	En8x8uxEWMMR92u3yoq1fhpw=
X-Google-Smtp-Source: AGHT+IEGivefzFeBF/gpM090vkeJDJ7Be5fPPQzUEnjIUOcKLBVUCTphVleEfakGeN8J/Q2GNc6Zpw==
X-Received: by 2002:a05:6000:4203:b0:3a3:71fb:7903 with SMTP id ffacd0b85a97d-3a5723abf38mr1386969f8f.10.1749941651560;
        Sat, 14 Jun 2025 15:54:11 -0700 (PDT)
Received: from localhost.localdomain ([154.182.223.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2449f1sm94897025e9.23.2025.06.14.15.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 15:54:11 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	skhan@linuxfoundation.com,
	jacob.e.keller@intel.com,
	alok.a.tiwari@oracle.com,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2 2/2] docs: net: clarify sysctl value constraints
Date: Sun, 15 Jun 2025 01:53:24 +0300
Message-Id: <20250614225324.82810-3-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250614225324.82810-1-abdelrahmanfekry375@gmail.com>
References: <20250614225324.82810-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So, i also noticed that some of the parameters represented
as boolean have no value constrain checks and accept integer
values due to u8 implementation, so i wrote a note for every
boolean parameter that have no constrain checks in code. and
fixed a typo in fmwark instead of fwmark.

Added notes for 19 confirmed parameters,
Verified by code inspection and runtime testing.

- No changes for v2 in this patch , still waiting to be reviewed.
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v2:
- No change.
v1:
- Added notes for booleans that accept 0-255 not only 0/1.
 Documentation/networking/ip-sysctl.rst | 70 ++++++++++++++++++++------
 1 file changed, 55 insertions(+), 15 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 68778532faa5..38f2981290d6 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -70,6 +70,8 @@ ip_forward_use_pmtu - BOOLEAN
 
 	- 0 - disabled
 	- 1 - enabled
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
 
 fwmark_reflect - BOOLEAN
 	Controls the fwmark of kernel-generated IPv4 reply packets that are not
@@ -91,6 +93,8 @@ fib_multipath_use_neigh - BOOLEAN
 
 	- 0 - disabled
 	- 1 - enabled
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
 
 fib_multipath_hash_policy - INTEGER
 	Controls which hash policy to use for multipath routes. Only valid
@@ -490,7 +494,9 @@ tcp_fwmark_accept - BOOLEAN
 	have a fwmark set via setsockopt(SOL_SOCKET, SO_MARK, ...) are
 	unaffected.
 
-	Default: 0
+	Default: 0 (disabled)
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
 
 tcp_invalid_ratelimit - INTEGER
 	Limit the maximal rate for sending duplicate acknowledgments
@@ -605,6 +611,8 @@ tcp_moderate_rcvbuf - BOOLEAN
 	automatically size the buffer (no greater than tcp_rmem[2]) to
 	match the size required by the path for full throughput.  Enabled by
 	default.
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
 
 tcp_mtu_probing - INTEGER
 	Controls TCP Packetization-Layer Path MTU Discovery.  Takes three
@@ -638,6 +646,8 @@ tcp_no_ssthresh_metrics_save - BOOLEAN
 	Controls whether TCP saves ssthresh metrics in the route cache.
 
 	Default is 1, which disables ssthresh metrics.
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
 
 tcp_orphan_retries - INTEGER
 	This value influences the timeout of a locally closed TCP connection,
@@ -705,7 +715,9 @@ tcp_retries1 - INTEGER
 
 	RFC 1122 recommends at least 3 retransmissions, which is the
 	default.
-
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
+
 tcp_retries2 - INTEGER
 	This value influences the timeout of an alive TCP connection,
 	when RTO retransmissions remain unacknowledged.
@@ -728,7 +740,7 @@ tcp_rfc1337 - BOOLEAN
 	we are not conforming to RFC, but prevent TCP TIME_WAIT
 	assassination.
 
-	Default: 0
+	Default: 0 (disabled)
 
 tcp_rmem - vector of 3 INTEGERs: min, default, max
 	min: Minimal size of receive buffer used by TCP sockets.
@@ -753,6 +765,8 @@ tcp_sack - BOOLEAN
 	Enable select acknowledgments (SACKS).
 	
 	Default: 1 (enabled)
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
 
 tcp_comp_sack_delay_ns - LONG INTEGER
 	TCP tries to reduce number of SACK sent, using a timer
@@ -788,7 +802,9 @@ tcp_slow_start_after_idle - BOOLEAN
 	the current RTO.  If unset, the congestion window will not
 	be timed out after an idle period.
 
-	Default: 1
+	Default: 1 (enabled)
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
 
 tcp_stdurg - BOOLEAN
 	Use the Host requirements interpretation of the TCP urgent pointer field.
@@ -796,6 +812,8 @@ tcp_stdurg - BOOLEAN
 	Linux might not communicate correctly with them.
 
 	Default: 0 (disabled)
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
 
 tcp_synack_retries - INTEGER
 	Number of times SYNACKs for a passive TCP connection attempt will
@@ -852,7 +870,7 @@ tcp_migrate_req - BOOLEAN
 	migration by returning SK_DROP in the type of eBPF program, or
 	disable this option.
 
-	Default: 0
+	Default: 0 (disabled)
 
 tcp_fastopen - INTEGER
 	Enable TCP Fast Open (RFC7413) to send and accept data in the opening
@@ -1036,6 +1054,8 @@ tcp_window_scaling - BOOLEAN
 	- 1 - Enabled.
 	
 	Default: 1 (enabled)
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
 
 tcp_shrink_window - BOOLEAN
 	This changes how the TCP receive window is calculated.
@@ -1050,7 +1070,9 @@ tcp_shrink_window - BOOLEAN
 			This only occurs if a non-zero receive window
 			scaling factor is also in effect.
 
-	Default: 0
+	Default: 0 (disabled)
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
 
 tcp_wmem - vector of 3 INTEGERs: min, default, max
 	min: Amount of memory reserved for send buffers for TCP sockets.
@@ -1092,7 +1114,7 @@ tcp_workaround_signed_windows - BOOLEAN
 	If unset, assume the remote TCP is not broken even if we do
 	not receive a window scaling option from them.
 
-	Default: 0
+	Default: 0 (disabled)
 
 tcp_thin_linear_timeouts - BOOLEAN
 	Enable dynamic triggering of linear timeouts for thin streams.
@@ -1105,8 +1127,10 @@ tcp_thin_linear_timeouts - BOOLEAN
 	For more information on thin streams, see
 	Documentation/networking/tcp-thin.rst
 
-	Default: 0
-
+	Default: 0 (disabled)
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
+
 tcp_limit_output_bytes - INTEGER
 	Controls TCP Small Queue limit per tcp socket.
 	TCP bulk sender tends to increase packets in flight until it
@@ -1350,7 +1374,7 @@ cipso_cache_enable - BOOLEAN
 	invalidated when required when means you can safely toggle this on and
 	off and the cache will always be "safe".
 
-	Default: 1
+	Default: 1 (enabled)
 
 cipso_cache_bucket_size - INTEGER
 	The CIPSO label cache consists of a fixed size hash table with each
@@ -1368,7 +1392,10 @@ cipso_rbm_optfmt - BOOLEAN
 	This means that when set the CIPSO tag will be padded with empty
 	categories in order to make the packet data 32-bit aligned.
 
-	Default: 0
+	Default: 0 (disabled)
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
+
 
 cipso_rbm_strictvalid - BOOLEAN
 	If set, do a very strict check of the CIPSO option when
@@ -1378,7 +1405,10 @@ cipso_rbm_strictvalid - BOOLEAN
 	result in less work (i.e. it should be faster) but could cause problems
 	with other implementations that require strict checking.
 
-	Default: 0
+	Default: 0 (disabled)
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
+
 
 IP Variables
 ============
@@ -1439,6 +1469,9 @@ ip_nonlocal_bind - BOOLEAN
 	which can be quite useful - but may break some applications.
 
 	Default: 0
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
+
 
 ip_autobind_reuse - BOOLEAN
 	By default, bind() does not select the ports automatically even if
@@ -1449,6 +1482,8 @@ ip_autobind_reuse - BOOLEAN
 	option should only be set by experts.
 	Default: 0
 
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
+
 ip_dynaddr - INTEGER
 	If set non-zero, enables support for dynamic addresses.
 	If set to a non-zero value larger than 1, a kernel log
@@ -1478,13 +1513,16 @@ tcp_early_demux - BOOLEAN
 	Enable early demux for established TCP sockets.
 
 	Default: 1
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
+
 
 udp_early_demux - BOOLEAN
 	Enable early demux for connected UDP sockets. Disable this if
 	your system could experience more unconnected load.
 
 	Default: 1
-
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
+
 icmp_echo_ignore_all - BOOLEAN
 	If set non-zero, then the kernel will ignore all ICMP ECHO
 	requests sent to it.
@@ -1817,7 +1855,7 @@ src_valid_mark - BOOLEAN
 	  lookup.  This permits rp_filter to function when the fwmark is
 	  used for routing traffic in both directions.
 
-	This setting also affects the utilization of fmwark when
+	This setting also affects the utilization of fwmark when
 	performing source address selection for ICMP replies, or
 	determining addresses stored for the IPOPT_TS_TSANDADDR and
 	IPOPT_RR IP options.
@@ -2326,7 +2364,9 @@ fwmark_reflect - BOOLEAN
 	fwmark of the packet they are replying to.
 
 	Default: 0
-
+
+	note: Accepts integer values (0-255) but only 0/1 have defined behaviour.
+
 ``conf/interface/*``:
 	Change special settings per interface.
 
-- 
2.25.1

