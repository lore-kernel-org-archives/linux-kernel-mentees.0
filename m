Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18751EF375
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 22:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749941649; cv=none; b=Szm3euoz5IoC3Yhmpc7cal1uk93vK/gzdF+cpxhLllO9/BdMwvRPzXdlqKDGZlkUfV2O6iWXgxJAJW3uvqlaCFpugVRRqUvCGISZM7nWrH4DPE7PNHOG21DtgA1Qh4qRAfDX2vE2weUnMDCrcQ3OsF3B8nbDPVAsPUK+xXKsm6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749941649; c=relaxed/simple;
	bh=pWmNujgFW/67grI1pV7H+FQjM8HjxMyWAWnlWGxxwqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h2nEgHwtjUQL3wbS3Etc+jR7rZRWjfctAAq9BlBOUAtyrmgsXo5mEwavrJeIUem8S3oOByKf3Xduzt6AMCkKBhL1+0ATgJ41/TOw9LRNUssdRxaW1HDcoWaXISXwiVoQgx6f3M+WDaq6+KooLJn6Vu4gaA85G0uwr/d/c6j3xg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOAV5Lyj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOAV5Lyj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso344782f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 15:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749941646; x=1750546446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Meus9RdTc9wLAlXXer591BnSodM/U15DKYz9nVnfSgo=;
        b=hOAV5LyjInspL8F7aI/1/tg6doQUjLHLH9BUiW1Q243UID3s8R9sCcSLc9KHc2+826
         gd0eMqMOMBvitnS3VMmpmq9iQDayDBcQpK5Y2RrH/N++LtpEiE3NQkrEt72T5BjDO+Jy
         9fFfZCn9xr9x55cZp0NI2Nw6lp3L7pv0z1NJV3DNrv81H+dX9x9/0ohk5OxyLcC5MGDE
         clJp/OpVtmhuadpXAmm2SJdQ+VxP179vMO+sb1/9G1ygQp5nqyjqZ+9J2ufd+LT8Lbey
         UE1JzDB6OmyVL4bI5PBopSGd4mS6s5qYW4SMTk/Fa2ihxG5JvijtLOE63u8746suTHlh
         5GLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749941646; x=1750546446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Meus9RdTc9wLAlXXer591BnSodM/U15DKYz9nVnfSgo=;
        b=eax3KIyfZYZU/C9X9fWYrZ6JHpYWeMdMn7yYnZNNCZ3nkiQTIPNx2dmQpFDvCbp3dR
         63amS++mADpHrZ95jB2WewyyoNWzBzoSKfBJ0BocjMEl38QJs8LpzXW2XhRMW6T+50+J
         DfFQdjsgfpZ2n8iqgb+zKyZJUWoeWYzmXl/Uw3EuKhvNmA0oykYtGDv51WNu69qfRODw
         ZrHQa9ScygG2SXpuBWlmhWu9mewR+XheU2egmu4XCqsV8wBBy2zvIhOOie7pbqco2Sog
         HEAhNuOFHd74hs8fS5FeGvhdnTcaDV0T9KEi5tV2UsVN62oHJV2O5522+iq9IaFbDrIi
         I7+A==
X-Forwarded-Encrypted: i=1; AJvYcCW730g1to/xk0J+bvcba+xMqZmQkMckNoIOV39r0Wpxwtf3x6esoekBfnmy2ASI9h5TjbiPgLw7p3TA3mCgeSNhlmHLCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yznx5+AqjfF34050E4qlw862sFsMYZ9Ak2AvJhoV8YlZutSCr0B
	qBvYgo/GmAdJuEQ/2clhYWOUQXX9KXCDy2at5LlecDGVPDHgr63x3eXt
X-Gm-Gg: ASbGncvCQTNI1tDiawZ61XWeizk+o1Z3++pB8SnZEEZNMkg2flD8eGaMWywi4T1ZJY3
	4mDgmadTW23ZLAOhtz04X1Aq0Mu9pQ+BTkOpw2oWQkUsjTXDyOGMw2qgC75Ncfyup1Ix9G2jv81
	Vaoc2Wd6OcEisLG4qQ3dygIPaQ52ScapSUl9pc33wBqPdoQ77lCfcdIv1RQiJ2iC1M1NByQK4Cr
	zgJtUvWY8DddVL8qCbnvDFGgMEgXsA9iu17NAWqKDryaOCGen+dKdLCSH/gXW5agmqLAAj1+V+T
	+nIDLSyVDsCYlYx5c9EGi0aZyP7kv7Lk5DRfp94TItTSxqOuuYeLK53ebKAoSj5VnGkw6CUJ0Rl
	Uqm3/9LxJZLkQ8QSR3hYNyYo=
X-Google-Smtp-Source: AGHT+IGfqsSZh7YAJ9SzwkKLwGrfC/MokHaYTGvjOXhnEYFMw9LVlyIGrQPTjuyxRreA/Zoh0wpSsQ==
X-Received: by 2002:a05:6000:200d:b0:3a4:eed9:755b with SMTP id ffacd0b85a97d-3a572370c9emr1503022f8f.4.1749941645908;
        Sat, 14 Jun 2025 15:54:05 -0700 (PDT)
Received: from localhost.localdomain ([154.182.223.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2449f1sm94897025e9.23.2025.06.14.15.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 15:54:05 -0700 (PDT)
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
Subject: [PATCH v2 1/2] docs: net: sysctl documentation cleanup
Date: Sun, 15 Jun 2025 01:53:23 +0300
Message-Id: <20250614225324.82810-2-abdelrahmanfekry375@gmail.com>
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

I noticed that some boolean parameters have missing default values
(enabled/disabled) in the documentation so i checked the initialization
functions to get their default values, also there was some inconsistency
in the representation. During the process , i stumbled upon a typo in
cipso_rbm_struct_valid instead of cipso_rbm_struct_valid.

Thanks for the review.

On Thu, 12 Jun 2025, Jacob Keller wrote:
> Would it make sense to use "0 (disabled)" and "1 (enabled)" with
> parenthesis for consistency with the default value?

Used as suggested.

On Fri, 13 Jun 2025, ALOK TIWARI wrote:
> for consistency
> remove extra space before colon
> Default: 1 (enabled)

Fixed. 

On Sat, 14 Jun 2025 10:46:29 -0700, Jakub Kicinski wrote:
> You need to repost the entire series. Make sure you read:
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html
> before you do.

Reposted the entire series, Thanks for you patiency.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v2:
- Deleted space before colon for consistency
- Standardized more boolean representation (0/1 with enabled/disabled)

v1: https://lore.kernel.org/all/20250612162954.55843-2-abdelrahmanfekry375@gmail.com/
- Fixed typo in cipso_rbm_struct_valid
- Added missing default value declarations
- Standardized boolean representation (0/1 with enabled/disabled)
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
+	- 0 (disabled).
+	- 1 (enabled).
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

