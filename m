Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD59C29B79A
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745812; cv=none; b=OX3CsXRZdkhFRiYqNzdFbJjsmWZmk7R7mmuPSG5V/q6BX/ibeYgnjM0Z3t8jR/9WvQQMvJIA6u9yhWRmGmBkqtnr+2I+17JTU62nrXk5lEYhGgbnNOYUIjVLECP5HJBcxNpEk+6otXSTBgxqLmem959D3lSbcxoFuXNOi47ZE9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745812; c=relaxed/simple;
	bh=Z/6636C5BKuJi09HF8IucU5lTzOrUHky7LlqR8CAeRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FvCueH7kmmd8SWLI3q4aG3yJ3xLdjoVUmbZKzk/xy0aNhMT+uEoUXJOLAI5UhfBAlNU6BsHLx3ExLOsKwb+bu8CJz/7OGXd4gAE/mrtk/1+PuLR1PO4SHJUI1+6YYX7SScdKQL3sRH6QU2QPUZw6iXWykdvUdkGhmHO1yI+7cfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0yTGASI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0yTGASI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so177081f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 09:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749745808; x=1750350608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CScEe5Fl8rGG4trMJJLF20CQ737qTO5smIAvJAcmjB0=;
        b=F0yTGASIaZxsJ3Fm96eI9bEKegcARhlDRbXOWYoNzBDeUSbv2hrfHBDHtZrgkarFgL
         0mRl+wRW1u5GFVMzyQpBPPRptgEzJM7yV3tjM7DGDQRSd7wJ+Weh20mfXonpC0RR+9pG
         yOVoG8I1EjOWTEMgg5EHp/fEbHazBWLSA85Iyw6BGBTwXDMCerdmsRVo2cO9Tn/8xbsR
         KUekV+57afkzbs0uE6GwuSuQ2BTveS5gbIj3Z3J9hBnALaLCJmZJSwjKHiQt90JjzfEd
         E9oG0ONP+pfLr9nOh8nP+FvCZRrQu714CWm86Gs4taMKFeApqG7SQEHmn0c7Dxpnc4ad
         q7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745808; x=1750350608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CScEe5Fl8rGG4trMJJLF20CQ737qTO5smIAvJAcmjB0=;
        b=j23bfXB2FVbawCSwxK/2U/m5zUuLR0VLDLYN5Nn1k1di4O9Lf0ayEwnSFrI8wenXYv
         DlYn4BCOTCH0fxfobfSVIPGrX44gW/yVk9hgYRsGFmTyQmC68+7zsRulXlEH4mE3+2nq
         3j/lJsn4uGQBb8p/uY44Jx/DYCIFL2AMkpw8SkfkCxv+rGG4AfJfDn+AhragX+DtwSCG
         TjXUila2W8rDp6P7QtWiWgRdZGYJJlKA9wpjgaNcjx9mEpxRjW/sOu9E+N5nUKy5CSuZ
         5OREL+/9OjhYuD9SfIxF93q93RG4aFjdTfgb7+AsEfnwjq0aprfs1J9lDQAwHodw/7pq
         qN5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkMWz4d540pJiTeSY0C1Axd0yH4X36cxnIw3oZ3EEtve1ps/sRU6J255ryxKFzAuOGcxJ7KFx8dS/qJ8mZRNK77qCOHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz3IyHNJIyuOSiO9+oq9o2+NJxC5xYJuusVrM49+63xGhhDEcd
	RGdmAgl25au13n/gevshkDjCjK7anNvn4buCNPw0bVtX5EIKJMKreJJY
X-Gm-Gg: ASbGnctQN0aoR9w8M7JdR+kK3yDipjhVuj9yyzsUtSRMSdbIATwdDwXDrDovrpLHG6o
	T0wcLGoT2CRgnOzI13mh6dRmzbeT0QeZ2iNnUswfA5f9/aaQzF9XXKqYxKPv35WWraJ+28eVMp+
	3T5G1/7w7yG4++WcStgUKR+7lCpmd9d7biS0dFVNe7VUK1qcSbOdhOjvLry1sDpjiwLzQsvI7rz
	mr9v4YCuC8U1re+CsytevpOZTIKWfZD79m4LgTRKKxPyFgaBN+95QEgc71M6YaI1610MCnaAbYi
	2tIxgRFT41WITT1C3TlnnZQobnQoGN1J1DczkfZw3XwIA3brW1TNtrmgNAaPsRgJDfWrerbn5Wv
	E3X5d8DMLNe8vz5P0LsOPvA==
X-Google-Smtp-Source: AGHT+IFmCRmSjVXq+/Z7AsehGKAhL1CUvk0M6whN6xRD/ICWsaXTBvCe4yalqw7IIeTvkln/ZyhwbQ==
X-Received: by 2002:a5d:5f85:0:b0:3a3:6ab0:8863 with SMTP id ffacd0b85a97d-3a558a218bamr2758748f8f.16.1749745807677;
        Thu, 12 Jun 2025 09:30:07 -0700 (PDT)
Received: from localhost.localdomain ([102.40.66.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24b0c8sm24872135e9.24.2025.06.12.09.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 09:30:07 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.com,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH 1/2] docs: net: sysctl documentation cleanup
Date: Thu, 12 Jun 2025 19:29:53 +0300
Message-Id: <20250612162954.55843-2-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250612162954.55843-1-abdelrahmanfekry375@gmail.com>
References: <20250612162954.55843-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I noticed that some boolean parameters have missing default values
(enabled/disabled) in the documentation so i checked the initialization
functions to get their default values, also there was some inconsistency
in the representation. During the process , i stumbled upon a typo in
cipso_rbm_struct_valid instead of cipso_rbm_struct_valid. 

- Fixed typo in cipso_rbm_struct_valid
- Added missing default value declarations
- Standardized boolean representation (0/1 with enabled/disabled)

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 Documentation/networking/ip-sysctl.rst | 37 +++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 0f1251cce314..f7ff8c53f412 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -75,7 +75,7 @@ fwmark_reflect - BOOLEAN
 	If unset, these packets have a fwmark of zero. If set, they have the
 	fwmark of the packet they are replying to.
 
-	Default: 0
+	Default: 0 (disabled)
 
 fib_multipath_use_neigh - BOOLEAN
 	Use status of existing neighbor entry when determining nexthop for
@@ -368,7 +368,7 @@ tcp_autocorking - BOOLEAN
 	queue. Applications can still use TCP_CORK for optimal behavior
 	when they know how/when to uncork their sockets.
 
-	Default : 1
+	Default : 1 (enabled)
 
 tcp_available_congestion_control - STRING
 	Shows the available congestion control choices that are registered.
@@ -407,6 +407,12 @@ tcp_congestion_control - STRING
 
 tcp_dsack - BOOLEAN
 	Allows TCP to send "duplicate" SACKs.
+	Possible values:
+		- 0 disabled
+		- 1 enabled
+
+	Default: 1 (enabled)
 
 tcp_early_retrans - INTEGER
 	Tail loss probe (TLP) converts RTOs occurring due to tail
@@ -623,6 +629,8 @@ tcp_no_metrics_save - BOOLEAN
 	increases overall performance, but may sometimes cause performance
 	degradation.  If set, TCP will not cache metrics on closing
 	connections.
+
+	Default: 0 (disabled)
 
 tcp_no_ssthresh_metrics_save - BOOLEAN
 	Controls whether TCP saves ssthresh metrics in the route cache.
@@ -684,6 +692,8 @@ tcp_retrans_collapse - BOOLEAN
 	Bug-to-bug compatibility with some broken printers.
 	On retransmit try to send bigger packets to work around bugs in
 	certain TCP stacks.
+
+	Default: 1 (enabled)
 
 tcp_retries1 - INTEGER
 	This value influences the time, after which TCP decides, that
@@ -739,6 +749,8 @@ tcp_rmem - vector of 3 INTEGERs: min, default, max
 
 tcp_sack - BOOLEAN
 	Enable select acknowledgments (SACKS).
+
+	Default: 1 (enabled)
 
 tcp_comp_sack_delay_ns - LONG INTEGER
 	TCP tries to reduce number of SACK sent, using a timer
@@ -766,7 +778,7 @@ tcp_backlog_ack_defer - BOOLEAN
 	one ACK for the whole queue. This helps to avoid potential
 	long latencies at end of a TCP socket syscall.
 
-	Default : true
+	Default : 1 (enabled)
 
 tcp_slow_start_after_idle - BOOLEAN
 	If set, provide RFC2861 behavior and time out the congestion
@@ -781,7 +793,7 @@ tcp_stdurg - BOOLEAN
 	Most hosts use the older BSD interpretation, so if you turn this on
 	Linux might not communicate correctly with them.
 
-	Default: FALSE
+	Default: 0 (disabled)
 
 tcp_synack_retries - INTEGER
 	Number of times SYNACKs for a passive TCP connection attempt will
@@ -1018,6 +1030,10 @@ tcp_tw_reuse_delay - UNSIGNED INTEGER
 
 tcp_window_scaling - BOOLEAN
 	Enable window scaling as defined in RFC1323.
+	- 0 - Disabled.
+	- 1 - Enabled.
+
+	Default: 1 (enabled)
 
 tcp_shrink_window - BOOLEAN
 	This changes how the TCP receive window is calculated.
@@ -1160,7 +1176,7 @@ tcp_plb_enabled - BOOLEAN
 	congestion measure (e.g. ce_ratio). PLB needs a congestion measure to
 	make repathing decisions.
 
-	Default: FALSE
+	Default: 0 (disabled)
 
 tcp_plb_idle_rehash_rounds - INTEGER
 	Number of consecutive congested rounds (RTT) seen after which
@@ -1352,7 +1368,7 @@ cipso_rbm_optfmt - BOOLEAN
 
 	Default: 0
 
-cipso_rbm_structvalid - BOOLEAN
+cipso_rbm_strictvalid - BOOLEAN
 	If set, do a very strict check of the CIPSO option when
 	ip_options_compile() is called.  If unset, relax the checks done during
 	ip_options_compile().  Either way is "safe" as errors are caught else
@@ -1933,10 +1949,15 @@ mcast_resolicit - INTEGER
 
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
@@ -1951,11 +1972,15 @@ igmpv3_unsolicited_report_interval - INTEGER
 
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

