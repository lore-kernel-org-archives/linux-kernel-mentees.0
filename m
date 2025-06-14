Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C25186E2E
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 09:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749893608; cv=none; b=D3ldCTx52YLj/Hax3lGtE2p9j9e5dhU2YWFb0sI06oQX6htTPWMfzX+1lnr8yNXEs29HUYL9CrXIR8WUdl5RrFc+VcARjrZg+h40fkBry+12zAlGiMLqmsVPfiizX7qzDv5fDLIazid1vp6ireGBSvCJ7HACq2JcuFomWxTokZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749893608; c=relaxed/simple;
	bh=jqiRf5jpsYfPahTWJgkrFQNqWCksHEG0UZ4QVuvztrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CGjh+S3EAWDuGoDOzHu4erUm3xFUzEy/9moQigFRA/+Fgqsn9qexaxWWye7rM+egiFHcMjr5S7U/llpS0UB2xf4xIA0+T4SHijmiaNckb4flQEJVr1jCKJ1bktQyW31JzGKKppaZ61fdv9bcYdtZAamrj3X7xdjWaiq96N/kgdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkkXz4QG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkkXz4QG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso293944f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 02:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749893604; x=1750498404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TUaqaUgH0UpGeWeQjj9qkPhsCQex5dp5zI7Y8+I2rfg=;
        b=WkkXz4QG6cdpNFtK0nDBVgM1sioqAEpj/IONLBrOPu5HxZkmMD4ZhxxnJVt7p7nohL
         tDurzbSGwsoQ28Ss+maeNyE5yac84Xb9oOoBIqx6dydUkM07PiC/Wn5ikEvIayU/hmS4
         yBngfyFvjxTPyCwbrUjDbVrOqeDMTxR1yaYR0pRBJMJZ3TtwQtOvCKRK1qaoxalVZNnE
         qE8AJLDQS32MAusJsEq1vSFfZRVu4hN/V+qAuW0bkEgrZtHc4HF1FW53lf0nSlB+4oMj
         ZGEC7aS3icIITBeEgEyCaThXN5lIae5nqmHXQVCNeiTuCpBrmaPoL6clRToI9zuJoUF1
         sEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749893604; x=1750498404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUaqaUgH0UpGeWeQjj9qkPhsCQex5dp5zI7Y8+I2rfg=;
        b=wBSDdpS5yJsbYrO3hutI+6kk9z20BTMYDu7qXbAQDeCHIrU9hoXVrcU+60F6AUbJqy
         jvbeZlbeHAbdDpZDp0yNi+C9W4a9Az6jIC4Ab+aXuA3pPR1yRzIED3mfnsiy2Gv+0yb3
         ElngI30tYQ+Sf0o+Flia5xfb5dsFv2pWbYrcKPR17YwK5UsZ04P8Qu5zcqS9Gg+Pl2fe
         jpNbJtCAwac1+y1Skd/fRWHt7lqgj4mJoretiIeIsMDcorX87PCjxd9/XkiIF0428bsX
         ReE6pEIeI7U5YToyGmJkM9oIwPSabIwECm4yhkAiDYCgiDjmK4HV17t176YRwwOs0N8A
         vPmw==
X-Forwarded-Encrypted: i=1; AJvYcCVW/HJsrz3F5cgpV7qFQuAlkeBe9pJC4rWHrriWfgCT43P6wdU64FT4vetFe01XVzDtuN+wDSZXbuinlG+UnEem8DRddw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxD3hK+F1VjheSHbNs1a8ccKmsW4U/S0JWJgzgJs7qB/PyY+Flu
	WmCzuYrhvtj75NXE9+Sn/BNj8LC9KJu3ukv8J+NoPD4NoOx1eJANUfFt
X-Gm-Gg: ASbGncvpLkvgyq1XEgGQNkmmngRTyjaSKUWV9RaWxUb8YV0sPJHMaoM8z2wOqM/G5H3
	b1rfocspP1HMsU+vefqjWhI6nnlk3R8HriQPbB8yjbCSZTBOAOAYVmC5mlM8Jfns4Kx7SfJrJ8E
	JFshPjZ6nSCpRHOdFylZjMHETv85Il7Z6rUi0GNPS3vkmnuiEQthvGUnQ0uk71hKHesA6reV1KB
	CkxwwfnBjqrO1P/CVtVSpgslJwDWyaPk7qYdFaZvgT7XILEZ3aZwCFqpztFJhhQRafCdxLoehav
	V+tpfbFXvyUhDzW2OsjE2ff3SAcP2Bk/Xq0DVtm8webYuROsMn05FcR0UIL8eUCUzaBcaKevrJ5
	h/hRDwaUCFr5HobtGLyDOgiw=
X-Google-Smtp-Source: AGHT+IHJrX1wpdGZCfj8uCpLbwDScjIUQkTycHTtdero5rVtXihT250rUm65T5ZgeEzHzxqe+XC6Zg==
X-Received: by 2002:a05:6000:4211:b0:3a5:324a:89b5 with SMTP id ffacd0b85a97d-3a57238353emr927568f8f.8.1749893604029;
        Sat, 14 Jun 2025 02:33:24 -0700 (PDT)
Received: from localhost.localdomain ([154.182.223.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e256d95sm77332165e9.31.2025.06.14.02.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:33:23 -0700 (PDT)
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
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2 1/2] docs: net: sysctl documentation cleanup
Date: Sat, 14 Jun 2025 12:33:06 +0300
Message-Id: <20250614093306.66542-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
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

