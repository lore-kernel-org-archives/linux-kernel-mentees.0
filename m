Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7C71B0F31
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749893243; cv=none; b=Bx9C7zaz7BvS9so9KEqbMG5wRWHMHcK98DYrR5QheZvnQUDhjMqC1oXrn9wD8P+Voo1NX9mFoXDDDX7Mth16Y+T55SBTC0hjcPxT24PPysQTIU/7VRNvtwljrlfuj0RjPH3qempRv/j52Wj9SZ3/ase59Q7aouFGLl6HITXXiI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749893243; c=relaxed/simple;
	bh=jqiRf5jpsYfPahTWJgkrFQNqWCksHEG0UZ4QVuvztrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T0yPn5gKSn3vC7y5FITSJ1IQhRTUpOXAODCjaBW+VxwALLF37m0xdouQPRScRzQMDLmE5tGANfefqFV6rBRLLXr5a/774X/MLOp6X8UL28JQpWyVX6DJCBg0AUfFrHOkxQE3jhndSXlRRJ24nFUhYogmlSMCHqIxqmLHIN5BST4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6XSYu5M; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6XSYu5M"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4533fc7266dso274295e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 02:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749893238; x=1750498038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUaqaUgH0UpGeWeQjj9qkPhsCQex5dp5zI7Y8+I2rfg=;
        b=N6XSYu5Mkd+T+6AfNZQwr5vtU5fQy3lTidCfEIaQ4q+KRkGE3lhz65hrfGh+rhWjtw
         HRWWTWLgUWeBxmZtBXjD3DK9/sQRs8qHkhg1ouRc1LgJVoavHaemNby5eI4scRaFC5fW
         Nc7A3EmOS3ogq/8NnuOSzYqluTZ8Itw5yNaLzWgNsZQ+F+UxWnYBAsNGCZBHHNQcsgrf
         6C4TjKmFF32SBMHehHlF8JlmeX891N5BbWUvNLHW4KR/+GBLcmXdkfrbQhyssmfnbI+o
         /5KEYmBqdTlN5Cf4HqoyEauuA0SmciGYRFiHBSsZcxI/NhcgpTk+6W9pSHd4IETCPox+
         +M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749893238; x=1750498038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUaqaUgH0UpGeWeQjj9qkPhsCQex5dp5zI7Y8+I2rfg=;
        b=JTjWU5GHS6mUD+o1eodsAUeL9FyBU4xJaGXMVbNbL4+gZKhJ/BobhPODIbwa+OnDHF
         reXAbszv7feARDTouUtxbvhaHgEChG5dUX6ML6ZdiHjG34bmzxQphuhExgPCyWoY4JdW
         9ENzB5CeMjL8ehZsGztoi+NYZix053TuEFxjgSeoI2exE8Fb7D62ky4OSt7tEN1KyjZR
         sZeu9zCRlmHI8SscsQY5OW58QY9BtSTR+ugc1iNa/pAyEd7ZqMfU2n3/gaGDk6cg6hsh
         ASlLjRDQa/INUqy4fkA3PpI5EDgTwLcdXFBL/yCdaYTkjfcTwBV7q+JQgIKEEsLC0mAG
         LRig==
X-Forwarded-Encrypted: i=1; AJvYcCVqV0JwbsQjPurLYS5winv3EABt9XVHVLUmwS5SZCNlayOgszsz+hm8YaYmho1KIyDNYjLAzwQgprXuD2K4bTXKYu/yHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTGVVePnDHIh6aB4h2CWEnVVk3bmNGOiq3AYRbbyCxx4P6VgDg
	5zUsZBZy1WvaCHGj7PWVpSb9JXZ25LaHMP27Djvwu0nI0Oi3SpuHhOIo4FGhLqLj
X-Gm-Gg: ASbGnctAEaEEXAkBtfxZdodaM5rmgXBe7pqW6CsZQy7Uv08Z9mbzZlokiX86YpRgMUA
	wQkL7FC1dV0221+ku/WbNsU9vzAK37NT7qFXJsvLI0Qbv0hEyLSe3Xh2/Bt0SAqJWGANsKK4OUK
	WnXKManNRmLEJNZsTcBlq7Ea/P3rYfa/z/f2s4vkJFIZEz7JflkpPs7eIgOShOtpIFoOnM5kUXD
	JB4lvPfIywWNUZZXFxcBmaH0chYA7NfGTpS1eqUC1RR/uOk0lg0T25CPcTDX8u6a8QaSQcSbQ0D
	QVQ48Z9WAlfeYZj9pA4g88E3V3QC1mNTltKMDOFXRTK6BjhrxkM9uX25MjiL0Mcmr2xlyPP4NFI
	H7qL5ZRPKVBr10ERKZXOl9QQ=
X-Google-Smtp-Source: AGHT+IEfK2VfdfII4a8PmobQm62IARGV9PWo2PsX1rgO8gX9H/p2lHjac8gP+KLtjqM/7XwoJuYptg==
X-Received: by 2002:a05:600c:3494:b0:442:fac9:5e2f with SMTP id 5b1f17b1804b1-4533ca4b453mr10177735e9.2.1749893238049;
        Sat, 14 Jun 2025 02:27:18 -0700 (PDT)
Received: from localhost.localdomain ([154.182.223.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532ddd29ffsm77545825e9.0.2025.06.14.02.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:27:17 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: abdelrahmanfekry375@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	skhan@linuxfoundation.com
Subject: [PATCH v2 1/2] docs: net: sysctl documentation cleanup
Date: Sat, 14 Jun 2025 12:25:42 +0300
Message-Id: <20250614092542.66138-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250612162954.55843-2-abdelrahmanfekry375@gmail.com>
References: <20250612162954.55843-2-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
- Deleted space before colon for consistency
- Standardized more boolean representation (0/1 with enabled/disabled)

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 Documentation/networking/ip-sysctl.rst | 47 ++++++++++++++++++++------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 0f1251cce314..68778532faa5 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -8,14 +8,16 @@ IP Sysctl
 ==============================
 
 ip_forward - BOOLEAN
-	- 0 - disabled (default)
-	- not 0 - enabled
+	- 0 (disabled)
+	- not 0 (enabled)
 
 	Forward Packets between interfaces.
 
 	This variable is special, its change resets all configuration
 	parameters to their default state (RFC1122 for hosts, RFC1812
 	for routers)
+
+	Default: 0 (disabled)
 
 ip_default_ttl - INTEGER
 	Default value of TTL field (Time To Live) for outgoing (but not
@@ -75,7 +77,7 @@ fwmark_reflect - BOOLEAN
 	If unset, these packets have a fwmark of zero. If set, they have the
 	fwmark of the packet they are replying to.
 
-	Default: 0
+	Default: 0 (disabled)
 
 fib_multipath_use_neigh - BOOLEAN
 	Use status of existing neighbor entry when determining nexthop for
@@ -368,7 +370,7 @@ tcp_autocorking - BOOLEAN
 	queue. Applications can still use TCP_CORK for optimal behavior
 	when they know how/when to uncork their sockets.
 
-	Default : 1
+	Default: 1 (enabled)
 
 tcp_available_congestion_control - STRING
 	Shows the available congestion control choices that are registered.
@@ -407,6 +409,12 @@ tcp_congestion_control - STRING
 
 tcp_dsack - BOOLEAN
 	Allows TCP to send "duplicate" SACKs.
+
+	Possible values:
+		- 0 (disabled)
+		- 1 (enabled)
+
+	Default: 1 (enabled)
 
 tcp_early_retrans - INTEGER
 	Tail loss probe (TLP) converts RTOs occurring due to tail
@@ -623,6 +631,8 @@ tcp_no_metrics_save - BOOLEAN
 	increases overall performance, but may sometimes cause performance
 	degradation.  If set, TCP will not cache metrics on closing
 	connections.
+
+	Default: 0 (disabled)
 
 tcp_no_ssthresh_metrics_save - BOOLEAN
 	Controls whether TCP saves ssthresh metrics in the route cache.
@@ -684,6 +694,8 @@ tcp_retrans_collapse - BOOLEAN
 	Bug-to-bug compatibility with some broken printers.
 	On retransmit try to send bigger packets to work around bugs in
 	certain TCP stacks.
+
+	Default: 1 (enabled)
 
 tcp_retries1 - INTEGER
 	This value influences the time, after which TCP decides, that
@@ -739,6 +751,8 @@ tcp_rmem - vector of 3 INTEGERs: min, default, max
 
 tcp_sack - BOOLEAN
 	Enable select acknowledgments (SACKS).
+
+	Default: 1 (enabled)
 
 tcp_comp_sack_delay_ns - LONG INTEGER
 	TCP tries to reduce number of SACK sent, using a timer
@@ -766,7 +780,7 @@ tcp_backlog_ack_defer - BOOLEAN
 	one ACK for the whole queue. This helps to avoid potential
 	long latencies at end of a TCP socket syscall.
 
-	Default : true
+	Default: 1 (enabled)
 
 tcp_slow_start_after_idle - BOOLEAN
 	If set, provide RFC2861 behavior and time out the congestion
@@ -781,7 +795,7 @@ tcp_stdurg - BOOLEAN
 	Most hosts use the older BSD interpretation, so if you turn this on
 	Linux might not communicate correctly with them.
 
-	Default: FALSE
+	Default: 0 (disabled)
 
 tcp_synack_retries - INTEGER
 	Number of times SYNACKs for a passive TCP connection attempt will
@@ -1018,6 +1032,10 @@ tcp_tw_reuse_delay - UNSIGNED INTEGER
 
 tcp_window_scaling - BOOLEAN
 	Enable window scaling as defined in RFC1323.
+	- 0 (disabled)
+	- 1 (enabled)
+
+	Default: 1 (enabled)
 
 tcp_shrink_window - BOOLEAN
 	This changes how the TCP receive window is calculated.
@@ -1160,7 +1178,7 @@ tcp_plb_enabled - BOOLEAN
 	congestion measure (e.g. ce_ratio). PLB needs a congestion measure to
 	make repathing decisions.
 
-	Default: FALSE
+	Default: 0 (disabled)
 
 tcp_plb_idle_rehash_rounds - INTEGER
 	Number of consecutive congested rounds (RTT) seen after which
@@ -1352,7 +1370,7 @@ cipso_rbm_optfmt - BOOLEAN
 
 	Default: 0
 
-cipso_rbm_structvalid - BOOLEAN
+cipso_rbm_strictvalid - BOOLEAN
 	If set, do a very strict check of the CIPSO option when
 	ip_options_compile() is called.  If unset, relax the checks done during
 	ip_options_compile().  Either way is "safe" as errors are caught else
@@ -1543,7 +1561,7 @@ icmp_ignore_bogus_error_responses - BOOLEAN
 	If this is set to TRUE, the kernel will not give such warnings, which
 	will avoid log file clutter.
 
-	Default: 1
+	Default: 1 (enabled)
 
 icmp_errors_use_inbound_ifaddr - BOOLEAN
 
@@ -1560,7 +1578,7 @@ icmp_errors_use_inbound_ifaddr - BOOLEAN
 	then the primary address of the first non-loopback interface that
 	has one will be used regardless of this setting.
 
-	Default: 0
+	Default: 0 (disabled)
 
 igmp_max_memberships - INTEGER
 	Change the maximum number of multicast groups we can subscribe to.
@@ -1933,10 +1951,15 @@ mcast_resolicit - INTEGER
 
 disable_policy - BOOLEAN
 	Disable IPSEC policy (SPD) for this interface
+
+	Default: 0
+
 
 disable_xfrm - BOOLEAN
 	Disable IPSEC encryption on this interface, whatever the policy
 
+	Default: 0
+
 igmpv2_unsolicited_report_interval - INTEGER
 	The interval in milliseconds in which the next unsolicited
 	IGMPv1 or IGMPv2 report retransmit will take place.
@@ -1951,11 +1974,15 @@ igmpv3_unsolicited_report_interval - INTEGER
 
 ignore_routes_with_linkdown - BOOLEAN
         Ignore routes whose link is down when performing a FIB lookup.
+
+        Default: 0 (disabled)
 
 promote_secondaries - BOOLEAN
 	When a primary IP address is removed from this interface
 	promote a corresponding secondary IP address instead of
 	removing all the corresponding secondary IP addresses.
+
+	Default: 0 (disabled)
 
 drop_unicast_in_l2_multicast - BOOLEAN
 	Drop any unicast IP packets that are received in link-layer
-- 
2.25.1

