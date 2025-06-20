Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBF8233721
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 21:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750456587; cv=none; b=Jt9EIcWyGVDP9tDctlgzRlthNsvGrXYFU42Obta/h+/MHGN0B1O7KfPGrmqdjG2kpIvV+d1BAn0Q2Yoi3ry0n++nS61ih9obiv0pwSig8gfJge2tbJkNJODeESMJFQObG6lPYb754zeC4UzOdK5RS/0LfpgYaDg4G17e67T+3og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750456587; c=relaxed/simple;
	bh=xVjHxLBvtZ0SthVOP69qJvhHBBbmHtfrArkXHsInqsw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k4V/a5c5ZjmE0jfa2XgJVoU8T2sNwuYSK/HWtDb5v2NE5m1tXoQcGNzKN9P7vvEYgO6kWVWOjM5akyiS+g+plUC2spK1QdbR1f7WGZQB3XJGv5p5ZG+LG8c3TlmnXm+EVwLrksxeANGmDy6dV6t3sKU9oCogqC/Nc6myV7mxDoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJOuQNEN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJOuQNEN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4531898b208so1046125e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 20 Jun 2025 14:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750456582; x=1751061382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rgdCQ6OZuDDppTHzXUpSUcS48r9QdShADVkomgzArpw=;
        b=PJOuQNENnwhiu/fNI6bvzMWzsEzNZ+KurFjEdm4J9PDFBcMXSWrGu8aT3oCkcS/+9N
         h88vGsi+6UgNUJus77UPaUtTiBQ1XGwxFnwviqEtJKxcN+4c7eoVRicpYfSWxP6BIMxU
         2XH1bKdPY2nhoYPSNzNud7zAip4tRH9gWTE31WbB1Ym3Ln1XAwewCDnz7OMTHN3aOAU/
         /lPPVHcB4Cj2K6xpt/ndBHh60xSz0nRDEGb86Lwwj5uMUXW8p9e0Vf1QXR7k/CWObIKq
         gBjgQWjV9lMWKRCtHVpPXXilc/GTkSuVvqUA325bqTRu2AJHJy39gTPN5fP8g6ByDIT2
         f4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750456582; x=1751061382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgdCQ6OZuDDppTHzXUpSUcS48r9QdShADVkomgzArpw=;
        b=iDksSHjdbtHfMa/5bNJ7bvi8HjGUvKzpZsFqs2i4z04ty26ICZzx0eFhGKCE0TM59O
         e7EOBM4Vg/VfK72W9rzZlaY4LhGe4JciyhfzcwxXmA6UdTfZRklqQyYMYSMl431ZgBdK
         5t7Fli6iLXOGAvxBGr0zxw9C1rotmB8MtL0UC720/Ymbbc79Bhda4K6GQCidCtuaQve2
         By0qN4aJwa+nrk99WSJSCkSeRzTKxzLZguez61LhjCYLAXoii6Syf6dnDxtCX8Hn6XPx
         9Wq42QRoTW0I1AQDjKH+BWsVpVerG+yrbiDhi+bupHmfo8mJAQdr7dLNrj+DCjO2g+g+
         dNAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmRbthHG2+GVcQoCWv9MUj3OmmnTQGXUNPlQl4PB/E7M+d6Bd3FyFydXzxoyAtEPYRywcd42MZWyrb/ZBbnQ4WpUEA+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIzCua6QwAsd/vX3Ze9UI5UJ6c/ZX2PpiAyHpJJr6UxQNjKxUc
	5yuH0Ruc2gqKvs1PTJXV2Sx2rXPROFi88S63S1SeDqjMlIMl4fU02tBM
X-Gm-Gg: ASbGnct4lnwJ5IzuNIL7rKxRR07ccwiFXhBWse9gWC9WfE+aXmAh9k83cubzHnqQ88N
	fVhap1RtCrsXTeLOqXzIJOaDfe+gU5FdjIEH09UXBKJ1u9APwaoxFBgK6hRSL6XrLH/+V4Rcfa6
	csOH4OFdYEyBHUhdSqu9yvsE3HTcXZZf9esRzp+hvlFZdENLAaMcVP/wF62rhg60izMnnQhwnZY
	p53uqDVRcj4i5eZ0X2fMs0V+EkDnTFnwTASH8eyOzepaKmDdx6o9uHABu6hXb3ogWbjnRlsJ5lS
	UyAsV9yvubk4oJ5TO/aHXiBNaZ5HBINM4NgPFMitAHM8Ls0RVF3qRtLfrh1JmPzyZSdfcnKdy8F
	Xx7QTbxGI9M2irAIzuPmDQEH8qU/YKobgvg==
X-Google-Smtp-Source: AGHT+IHn8ofD6e6Hg0bK6cXjzsOogOlxH4C7wqFCIk+C5+Fum2LwBLfLAmFUobsajcF0S2AIHI31GA==
X-Received: by 2002:a5d:5f4a:0:b0:3a3:6e85:a550 with SMTP id ffacd0b85a97d-3a6d12a1d62mr1461388f8f.5.1750456581402;
        Fri, 20 Jun 2025 14:56:21 -0700 (PDT)
Received: from localhost.localdomain ([102.46.244.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190cc3sm3010484f8f.89.2025.06.20.14.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:56:20 -0700 (PDT)
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
Subject: [PATCH net-next v3] docs: net: sysctl documentation cleanup
Date: Sat, 21 Jun 2025 00:55:42 +0300
Message-Id: <20250620215542.153440-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing default values for networking sysctl parameters and
standardize documentation:
- Use "0 (disabled)" / "1 (enabled)" format consistently
- Fix cipso_rbm_struct_valid -> cipso_rbm_strictvalid typo
- Convert fwmark_reflect description to enabled/disabled terminology
- Document possible values for tcp_autocorking

Also addresses formatting inconsistencies in touched parameters.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v3:
- Uses imperative mood in patch description
- Make sure patch applies by applying on net-next
- Added Possible values for more booleans
- Used enabled/disabled instead of set/unset
- Standarized formatting of touched booleans

v2: https://lore.kernel.org/all/20250614225324.82810-2-abdelrahmanfekry375@gmail.com/
- Deleted space before colon for consistency
- Standardized more boolean representation (0/1 with enabled/disabled)

v1: https://lore.kernel.org/all/20250612162954.55843-2-abdelrahmanfekry375@gmail.com/
- Fixed typo in cipso_rbm_struct_valid
- Added missing default value declarations
- Standardized boolean representation (0/1 with enabled/disabled)
 Documentation/networking/ip-sysctl.rst | 359 +++++++++++++++++++------
 1 file changed, 278 insertions(+), 81 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 466bc3f5186e..edf4b22535e4 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -8,15 +8,18 @@ IP Sysctl
 ==============================
 
 ip_forward - BOOLEAN
-	- 0 - disabled (default)
-	- not 0 - enabled
-
 	Forward Packets between interfaces.
 
 	This variable is special, its change resets all configuration
 	parameters to their default state (RFC1122 for hosts, RFC1812
 	for routers)
 
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
+
 ip_default_ttl - INTEGER
 	Default value of TTL field (Time To Live) for outgoing (but not
 	forwarded) IP packets. Should be between 1 and 255 inclusive.
@@ -62,20 +65,23 @@ ip_forward_use_pmtu - BOOLEAN
 	kernel honoring this information. This is normally not the
 	case.
 
-	Default: 0 (disabled)
-
 	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
 
-	- 0 - disabled
-	- 1 - enabled
+	Default: 0 (disabled)
 
 fwmark_reflect - BOOLEAN
 	Controls the fwmark of kernel-generated IPv4 reply packets that are not
 	associated with a socket for example, TCP RSTs or ICMP echo replies).
-	If unset, these packets have a fwmark of zero. If set, they have the
+	If disabled, these packets have a fwmark of zero. If enabled, they have the
 	fwmark of the packet they are replying to.
 
-	Default: 0
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 fib_multipath_use_neigh - BOOLEAN
 	Use status of existing neighbor entry when determining nexthop for
@@ -83,12 +89,11 @@ fib_multipath_use_neigh - BOOLEAN
 	packets could be directed to a failed nexthop. Only valid for kernels
 	built with CONFIG_IP_ROUTE_MULTIPATH enabled.
 
-	Default: 0 (disabled)
-
 	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
 
-	- 0 - disabled
-	- 1 - enabled
+	Default: 0 (disabled)
 
 fib_multipath_hash_policy - INTEGER
 	Controls which hash policy to use for multipath routes. Only valid
@@ -368,7 +373,11 @@ tcp_autocorking - BOOLEAN
 	queue. Applications can still use TCP_CORK for optimal behavior
 	when they know how/when to uncork their sockets.
 
-	Default : 1
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
 
 tcp_available_congestion_control - STRING
 	Shows the available congestion control choices that are registered.
@@ -408,6 +417,12 @@ tcp_congestion_control - STRING
 tcp_dsack - BOOLEAN
 	Allows TCP to send "duplicate" SACKs.
 
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
+
 tcp_early_retrans - INTEGER
 	Tail loss probe (TLP) converts RTOs occurring due to tail
 	losses into fast recovery (draft-ietf-tcpm-rack). Note that
@@ -447,7 +462,11 @@ tcp_ecn_fallback - BOOLEAN
 	knob. The value	is not used, if tcp_ecn or per route (or congestion
 	control) ECN settings are disabled.
 
-	Default: 1 (fallback enabled)
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
 
 tcp_fack - BOOLEAN
 	This is a legacy option, it has no effect anymore.
@@ -474,7 +493,7 @@ tcp_frto - INTEGER
 	By default it's enabled with a non-zero value. 0 disables F-RTO.
 
 tcp_fwmark_accept - BOOLEAN
-	If set, incoming connections to listening sockets that do not have a
+	If enabled, incoming connections to listening sockets that do not have a
 	socket mark will set the mark of the accepting socket to the fwmark of
 	the incoming SYN packet. This will cause all packets on that connection
 	(starting from the first SYNACK) to be sent with that fwmark. The
@@ -482,7 +501,11 @@ tcp_fwmark_accept - BOOLEAN
 	have a fwmark set via setsockopt(SOL_SOCKET, SO_MARK, ...) are
 	unaffected.
 
-	Default: 0
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 tcp_invalid_ratelimit - INTEGER
 	Limit the maximal rate for sending duplicate acknowledgments
@@ -528,6 +551,10 @@ tcp_l3mdev_accept - BOOLEAN
 	which the packets originated. Only valid when the kernel was
 	compiled with CONFIG_NET_L3_MASTER_DEV.
 
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
 	Default: 0 (disabled)
 
 tcp_low_latency - BOOLEAN
@@ -593,10 +620,15 @@ tcp_min_rtt_wlen - INTEGER
 	Default: 300
 
 tcp_moderate_rcvbuf - BOOLEAN
-	If set, TCP performs receive buffer auto-tuning, attempting to
+	If enabled, TCP performs receive buffer auto-tuning, attempting to
 	automatically size the buffer (no greater than tcp_rmem[2]) to
-	match the size required by the path for full throughput.  Enabled by
-	default.
+	match the size required by the path for full throughput.
+
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 tcp_mtu_probing - INTEGER
 	Controls TCP Packetization-Layer Path MTU Discovery.  Takes three
@@ -621,13 +653,24 @@ tcp_no_metrics_save - BOOLEAN
 	when the connection closes, so that connections established in the
 	near future can use these to set initial conditions.  Usually, this
 	increases overall performance, but may sometimes cause performance
-	degradation.  If set, TCP will not cache metrics on closing
+	degradation.  If enabled, TCP will not cache metrics on closing
 	connections.
 
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
+
 tcp_no_ssthresh_metrics_save - BOOLEAN
 	Controls whether TCP saves ssthresh metrics in the route cache.
+	If enabled, ssthresh metrics are disabled.
 
-	Default is 1, which disables ssthresh metrics.
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
 
 tcp_orphan_retries - INTEGER
 	This value influences the timeout of a locally closed TCP connection,
@@ -666,6 +709,10 @@ tcp_reflect_tos - BOOLEAN
 
 	This options affects both IPv4 and IPv6.
 
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
 	Default: 0 (disabled)
 
 tcp_reordering - INTEGER
@@ -687,6 +734,12 @@ tcp_retrans_collapse - BOOLEAN
 	On retransmit try to send bigger packets to work around bugs in
 	certain TCP stacks.
 
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
+
 tcp_retries1 - INTEGER
 	This value influences the time, after which TCP decides, that
 	something is wrong due to unacknowledged RTO retransmissions,
@@ -714,11 +767,15 @@ tcp_retries2 - INTEGER
 	which corresponds to a value of at least 8.
 
 tcp_rfc1337 - BOOLEAN
-	If set, the TCP stack behaves conforming to RFC1337. If unset,
+	If enabled, the TCP stack behaves conforming to RFC1337. If unset,
 	we are not conforming to RFC, but prevent TCP TIME_WAIT
 	assassination.
 
-	Default: 0
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 tcp_rmem - vector of 3 INTEGERs: min, default, max
 	min: Minimal size of receive buffer used by TCP sockets.
@@ -742,6 +799,12 @@ tcp_rmem - vector of 3 INTEGERs: min, default, max
 tcp_sack - BOOLEAN
 	Enable select acknowledgments (SACKS).
 
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
+
 tcp_comp_sack_delay_ns - LONG INTEGER
 	TCP tries to reduce number of SACK sent, using a timer
 	based on 5% of SRTT, capped by this sysctl, in nano seconds.
@@ -764,26 +827,38 @@ tcp_comp_sack_nr - INTEGER
 	Default : 44
 
 tcp_backlog_ack_defer - BOOLEAN
-	If set, user thread processing socket backlog tries sending
+	If enabled, user thread processing socket backlog tries sending
 	one ACK for the whole queue. This helps to avoid potential
 	long latencies at end of a TCP socket syscall.
 
-	Default : true
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
 
 tcp_slow_start_after_idle - BOOLEAN
-	If set, provide RFC2861 behavior and time out the congestion
+	If enabled, provide RFC2861 behavior and time out the congestion
 	window after an idle period.  An idle period is defined at
 	the current RTO.  If unset, the congestion window will not
 	be timed out after an idle period.
 
-	Default: 1
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
 
 tcp_stdurg - BOOLEAN
 	Use the Host requirements interpretation of the TCP urgent pointer field.
-	Most hosts use the older BSD interpretation, so if you turn this on
+	Most hosts use the older BSD interpretation, so if enabled,
 	Linux might not communicate correctly with them.
 
-	Default: FALSE
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 tcp_synack_retries - INTEGER
 	Number of times SYNACKs for a passive TCP connection attempt will
@@ -840,7 +915,11 @@ tcp_migrate_req - BOOLEAN
 	migration by returning SK_DROP in the type of eBPF program, or
 	disable this option.
 
-	Default: 0
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 tcp_fastopen - INTEGER
 	Enable TCP Fast Open (RFC7413) to send and accept data in the opening
@@ -1021,6 +1100,12 @@ tcp_tw_reuse_delay - UNSIGNED INTEGER
 tcp_window_scaling - BOOLEAN
 	Enable window scaling as defined in RFC1323.
 
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
+
 tcp_shrink_window - BOOLEAN
 	This changes how the TCP receive window is calculated.
 
@@ -1028,13 +1113,14 @@ tcp_shrink_window - BOOLEAN
 	window can be offered, and that TCP implementations MUST ensure
 	that they handle a shrinking window, as specified in RFC 1122.
 
-	- 0 - Disabled.	The window is never shrunk.
-	- 1 - Enabled.	The window is shrunk when necessary to remain within
+	Possible values
+	- 0 (disabled)	The window is never shrunk.
+	- 1 (enabled)	The window is shrunk when necessary to remain within
 			the memory limit set by autotuning (sk_rcvbuf).
 			This only occurs if a non-zero receive window
 			scaling factor is also in effect.
 
-	Default: 0
+	Default: 0 (disabled)
 
 tcp_wmem - vector of 3 INTEGERs: min, default, max
 	min: Amount of memory reserved for send buffers for TCP sockets.
@@ -1071,16 +1157,20 @@ tcp_notsent_lowat - UNSIGNED INTEGER
 	Default: UINT_MAX (0xFFFFFFFF)
 
 tcp_workaround_signed_windows - BOOLEAN
-	If set, assume no receipt of a window scaling option means the
+	If enabled, assume no receipt of a window scaling option means the
 	remote TCP is broken and treats the window as a signed quantity.
-	If unset, assume the remote TCP is not broken even if we do
+	If disabled, assume the remote TCP is not broken even if we do
 	not receive a window scaling option from them.
 
-	Default: 0
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 tcp_thin_linear_timeouts - BOOLEAN
 	Enable dynamic triggering of linear timeouts for thin streams.
-	If set, a check is performed upon retransmission by timeout to
+	If enabled, a check is performed upon retransmission by timeout to
 	determine if the stream is thin (less than 4 packets in flight).
 	As long as the stream is found to be thin, up to 6 linear
 	timeouts may be performed before exponential backoff mode is
@@ -1089,7 +1179,11 @@ tcp_thin_linear_timeouts - BOOLEAN
 	For more information on thin streams, see
 	Documentation/networking/tcp-thin.rst
 
-	Default: 0
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 tcp_limit_output_bytes - INTEGER
 	Controls TCP Small Queue limit per tcp socket.
@@ -1141,7 +1235,7 @@ tcp_child_ehash_entries - INTEGER
 	Default: 0
 
 tcp_plb_enabled - BOOLEAN
-	If set and the underlying congestion control (e.g. DCTCP) supports
+	If enabled and the underlying congestion control (e.g. DCTCP) supports
 	and enables PLB feature, TCP PLB (Protective Load Balancing) is
 	enabled. PLB is described in the following paper:
 	https://doi.org/10.1145/3544216.3544226. Based on PLB parameters,
@@ -1157,12 +1251,16 @@ tcp_plb_enabled - BOOLEAN
 	by switches to determine next hop. In either case, further host
 	and switch side changes will be needed.
 
-	When set, PLB assumes that congestion signal (e.g. ECN) is made
+	If enabled, PLB assumes that congestion signal (e.g. ECN) is made
 	available and used by congestion control module to estimate a
 	congestion measure (e.g. ce_ratio). PLB needs a congestion measure to
 	make repathing decisions.
 
-	Default: FALSE
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 tcp_plb_idle_rehash_rounds - INTEGER
 	Number of consecutive congested rounds (RTT) seen after which
@@ -1262,6 +1360,10 @@ udp_l3mdev_accept - BOOLEAN
 	originated. Only valid when the kernel was compiled with
 	CONFIG_NET_L3_MASTER_DEV.
 
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
 	Default: 0 (disabled)
 
 udp_mem - vector of 3 INTEGERs: min, pressure, max
@@ -1322,19 +1424,27 @@ raw_l3mdev_accept - BOOLEAN
 	originated. Only valid when the kernel was compiled with
 	CONFIG_NET_L3_MASTER_DEV.
 
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
 	Default: 1 (enabled)
 
 CIPSOv4 Variables
 =================
 
 cipso_cache_enable - BOOLEAN
-	If set, enable additions to and lookups from the CIPSO label mapping
-	cache.  If unset, additions are ignored and lookups always result in a
+	If enabled, enable additions to and lookups from the CIPSO label mapping
+	cache.  If disabled, additions are ignored and lookups always result in a
 	miss.  However, regardless of the setting the cache is still
 	invalidated when required when means you can safely toggle this on and
 	off and the cache will always be "safe".
 
-	Default: 1
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
 
 cipso_cache_bucket_size - INTEGER
 	The CIPSO label cache consists of a fixed size hash table with each
@@ -1352,17 +1462,25 @@ cipso_rbm_optfmt - BOOLEAN
 	This means that when set the CIPSO tag will be padded with empty
 	categories in order to make the packet data 32-bit aligned.
 
-	Default: 0
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
-cipso_rbm_structvalid - BOOLEAN
-	If set, do a very strict check of the CIPSO option when
-	ip_options_compile() is called.  If unset, relax the checks done during
+cipso_rbm_strictvalid - BOOLEAN
+	If enabled, do a very strict check of the CIPSO option when
+	ip_options_compile() is called.  If disabled, relax the checks done during
 	ip_options_compile().  Either way is "safe" as errors are caught else
 	where in the CIPSO processing code but setting this to 0 (False) should
 	result in less work (i.e. it should be faster) but could cause problems
 	with other implementations that require strict checking.
 
-	Default: 0
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 IP Variables
 ============
@@ -1419,10 +1537,14 @@ ip_unprivileged_port_start - INTEGER
 	Default: 1024
 
 ip_nonlocal_bind - BOOLEAN
-	If set, allows processes to bind() to non-local IP addresses,
+	If enabled, allows processes to bind() to non-local IP addresses,
 	which can be quite useful - but may break some applications.
 
-	Default: 0
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 ip_autobind_reuse - BOOLEAN
 	By default, bind() does not select the ports automatically even if
@@ -1431,7 +1553,12 @@ ip_autobind_reuse - BOOLEAN
 	when you use bind()+connect(), but may break some applications.
 	The preferred solution is to use IP_BIND_ADDRESS_NO_PORT and this
 	option should only be set by experts.
-	Default: 0
+
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 ip_dynaddr - INTEGER
 	If set non-zero, enables support for dynamic addresses.
@@ -1449,7 +1576,11 @@ ip_early_demux - BOOLEAN
 	It may add an additional cost for pure routing workloads that
 	reduces overall throughput, in such case you should disable it.
 
-	Default: 1
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
 
 ping_group_range - 2 INTEGERS
 	Restrict ICMP_PROTO datagram sockets to users in the group range.
@@ -1461,31 +1592,51 @@ ping_group_range - 2 INTEGERS
 tcp_early_demux - BOOLEAN
 	Enable early demux for established TCP sockets.
 
-	Default: 1
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
 
 udp_early_demux - BOOLEAN
 	Enable early demux for connected UDP sockets. Disable this if
 	your system could experience more unconnected load.
 
-	Default: 1
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
 
 icmp_echo_ignore_all - BOOLEAN
-	If set non-zero, then the kernel will ignore all ICMP ECHO
+	If enabled, then the kernel will ignore all ICMP ECHO
 	requests sent to it.
 
-	Default: 0
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 icmp_echo_enable_probe - BOOLEAN
-        If set to one, then the kernel will respond to RFC 8335 PROBE
+        If enabled, then the kernel will respond to RFC 8335 PROBE
         requests sent to it.
 
-        Default: 0
+        Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 icmp_echo_ignore_broadcasts - BOOLEAN
-	If set non-zero, then the kernel will ignore all ICMP ECHO and
+	If enabled, then the kernel will ignore all ICMP ECHO and
 	TIMESTAMP requests sent to it via broadcast/multicast.
 
-	Default: 1
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 icmp_ratelimit - INTEGER
 	Limit the maximal rates for sending ICMP packets whose type matches
@@ -1542,17 +1693,21 @@ icmp_ratemask - INTEGER
 icmp_ignore_bogus_error_responses - BOOLEAN
 	Some routers violate RFC1122 by sending bogus responses to broadcast
 	frames.  Such violations are normally logged via a kernel warning.
-	If this is set to TRUE, the kernel will not give such warnings, which
+	If enabled, the kernel will not give such warnings, which
 	will avoid log file clutter.
 
-	Default: 1
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
 
 icmp_errors_use_inbound_ifaddr - BOOLEAN
 
-	If zero, icmp error messages are sent with the primary address of
+	If disabled, icmp error messages are sent with the primary address of
 	the exiting interface.
 
-	If non-zero, the message will be sent with the primary address of
+	If enabled, the message will be sent with the primary address of
 	the interface that received the packet that caused the icmp error.
 	This is the behaviour many network administrators will expect from
 	a router. And it can make debugging complicated network layouts
@@ -1562,7 +1717,11 @@ icmp_errors_use_inbound_ifaddr - BOOLEAN
 	then the primary address of the first non-loopback interface that
 	has one will be used regardless of this setting.
 
-	Default: 0
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 igmp_max_memberships - INTEGER
 	Change the maximum number of multicast groups we can subscribe to.
@@ -1936,9 +2095,21 @@ mcast_resolicit - INTEGER
 disable_policy - BOOLEAN
 	Disable IPSEC policy (SPD) for this interface
 
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
+
 disable_xfrm - BOOLEAN
 	Disable IPSEC encryption on this interface, whatever the policy
 
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
+
 igmpv2_unsolicited_report_interval - INTEGER
 	The interval in milliseconds in which the next unsolicited
 	IGMPv1 or IGMPv2 report retransmit will take place.
@@ -1954,11 +2125,23 @@ igmpv3_unsolicited_report_interval - INTEGER
 ignore_routes_with_linkdown - BOOLEAN
         Ignore routes whose link is down when performing a FIB lookup.
 
+        Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
+
 promote_secondaries - BOOLEAN
 	When a primary IP address is removed from this interface
 	promote a corresponding secondary IP address instead of
 	removing all the corresponding secondary IP addresses.
 
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
+
 drop_unicast_in_l2_multicast - BOOLEAN
 	Drop any unicast IP packets that are received in link-layer
 	multicast (or broadcast) frames.
@@ -1966,14 +2149,22 @@ drop_unicast_in_l2_multicast - BOOLEAN
 	This behavior (for multicast) is actually a SHOULD in RFC
 	1122, but is disabled by default for compatibility reasons.
 
-	Default: off (0)
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 drop_gratuitous_arp - BOOLEAN
 	Drop all gratuitous ARP frames, for example if there's a known
 	good ARP proxy on the network and such frames need not be used
 	(or in the case of 802.11, must not be used to prevent attacks.)
 
-	Default: off (0)
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
 
 tag - INTEGER
@@ -2017,20 +2208,22 @@ bindv6only - BOOLEAN
 	which restricts use of the IPv6 socket to IPv6 communication
 	only.
 
-		- TRUE: disable IPv4-mapped address feature
-		- FALSE: enable IPv4-mapped address feature
+	Possible values:
+	- 0 (disabled) - enable IPv4-mapped address feature
+	- 1 (enabled)  - disable IPv4-mapped address feature
 
-	Default: FALSE (as specified in RFC3493)
+	Default: 0 (disabled)
 
 flowlabel_consistency - BOOLEAN
 	Protect the consistency (and unicity) of flow label.
 	You have to disable it to use IPV6_FL_F_REFLECT flag on the
 	flow label manager.
 
-	- TRUE: enabled
-	- FALSE: disabled
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
 
-	Default: TRUE
+	Default: 1 (enabled)
 
 auto_flowlabels - INTEGER
 	Automatically generate flow labels based on a flow hash of the
@@ -2056,10 +2249,12 @@ flowlabel_state_ranges - BOOLEAN
 	reserved for the IPv6 flow manager facility, 0x80000-0xFFFFF
 	is reserved for stateless flow labels as described in RFC6437.
 
-	- TRUE: enabled
-	- FALSE: disabled
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
 
-	Default: true
 
 flowlabel_reflect - INTEGER
 	Control flow label reflection. Needed for Path MTU
@@ -2127,10 +2322,12 @@ anycast_src_echo_reply - BOOLEAN
 	Controls the use of anycast addresses as source addresses for ICMPv6
 	echo reply
 
-	- TRUE:  enabled
-	- FALSE: disabled
+	Possible values:
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 0 (disabled)
 
-	Default: FALSE
 
 idgen_delay - INTEGER
 	Controls the delay in seconds after which time to retry
-- 
2.25.1

