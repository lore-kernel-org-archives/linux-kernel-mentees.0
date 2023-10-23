Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE79CDB474
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Oct 2023 12:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 995DF41591;
	Mon, 23 Oct 2023 12:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 995DF41591
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JQskiTId
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xFssFEShgO-r; Mon, 23 Oct 2023 12:34:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EABEB40116;
	Mon, 23 Oct 2023 12:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EABEB40116
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0DCFC0071;
	Mon, 23 Oct 2023 12:34:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DA20C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 12:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1828F82564
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 12:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1828F82564
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JQskiTId
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tH3ygqqNZ5so
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 12:34:34 +0000 (UTC)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D3C98227F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 12:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D3C98227F
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5ab94fc098cso1671818a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Oct 2023 05:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698064474; x=1698669274;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cCfeGAPmI/1C6hVy3j5HY6SeWT2q6xH+8rq3JEHka0s=;
 b=JQskiTIdO4SwhqNfteX40k2bcQ5u/qEEmZnEO+CZUaugZkbbwK4BuVGZXigqI9gX1V
 YN74YkI2VS9oLp7NmaeaZWy3lr29/CkV2kwcKRVoier1OfstzOjH1g4iSzhwygqEyZSh
 PQWCsxFNUp57wxn1mn5uj5qZs23X2m5gPw5mcvOs1dHDXYz/dCcaMLDmbgye6Nz1CduR
 AS34LFCbKIZktL5SNEUFFFTMsnO/0Cv2hKhRngO82LSMu9VQ7IYkjFfUv8a8BsDVGEpy
 u59RDCrW32giaxttjYvQChyHqYAZxi7ycWuo74qFVItff0F1aiHANA5uX8tE//Wv4ImS
 D3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698064474; x=1698669274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cCfeGAPmI/1C6hVy3j5HY6SeWT2q6xH+8rq3JEHka0s=;
 b=AxFvb0I/b3UXhaaOi3ZoIzZ6ylWNvWQCAmrpZJxRUh9wt5FJhixmLzRVRXS4HID1f7
 Ph+/J1BzWU/IT80Ba6UuoO5AZ5DdcPKIm7lyOS0wFO3VIXkqBPphfqpnODnBK+6jsxuW
 I83jZAPwhPF7QLWHLLJ7/cqR46fZJRcKapumCVsLaa0DhH0ZvyGPvjXT6nQfiu97ZSKn
 /g0hgu+QG4HG4CXuqt7RXllwRlgSms15vldb0fH72wwB8miX6ConEFzDLfN1T2cSG8VD
 HF9psDA8gpWt2/2UCzSMpskZCq5fhUiMig96T692E5UNjsNYD5wsXYb74RXZQIwjRrDg
 KRNQ==
X-Gm-Message-State: AOJu0YyP1Jk5ume3WR7hzPOgvRAi6C/WR9oSW9taLWcEbxDkza/JjIph
 ui7ehQSn/HGmg0/AjSYV2Uo=
X-Google-Smtp-Source: AGHT+IH1wbasmBNgondsuKTvzLHD5UV7liWemEtyM+fqBb/NsiHuIK/oggwkA7jK0980y2/7I2tSkw==
X-Received: by 2002:a17:902:efd1:b0:1c9:ba77:b27e with SMTP id
 ja17-20020a170902efd100b001c9ba77b27emr6801484plb.46.1698064473560; 
 Mon, 23 Oct 2023 05:34:33 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.85.44])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a170902d91800b001c9ab91d3d7sm5799275plz.37.2023.10.23.05.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 05:34:33 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: davem@davemloft.net, jiri@resnulli.us, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] selftests:net change ifconfig with ip command
Date: Mon, 23 Oct 2023 18:04:22 +0530
Message-Id: <20231023123422.2895-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZTYc04N9VK7EarHY@nanopsycho>
References: <ZTYc04N9VK7EarHY@nanopsycho>
MIME-Version: 1.0
Cc: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Change ifconfig with ip command,
on a system where ifconfig is
not used this script will not
work correcly.

Test result with this patchset:

sudo make TARGETS="net" kselftest
....
TAP version 13
1..1
 timeout set to 1500
 selftests: net: route_localnet.sh
 run arp_announce test
 net.ipv4.conf.veth0.route_localnet = 1
 net.ipv4.conf.veth1.route_localnet = 1
 net.ipv4.conf.veth0.arp_announce = 2
 net.ipv4.conf.veth1.arp_announce = 2
 PING 127.25.3.14 (127.25.3.14) from 127.25.3.4 veth0: 56(84)
  bytes of data.
 64 bytes from 127.25.3.14: icmp_seq=1 ttl=64 time=0.038 ms
 64 bytes from 127.25.3.14: icmp_seq=2 ttl=64 time=0.068 ms
 64 bytes from 127.25.3.14: icmp_seq=3 ttl=64 time=0.068 ms
 64 bytes from 127.25.3.14: icmp_seq=4 ttl=64 time=0.068 ms
 64 bytes from 127.25.3.14: icmp_seq=5 ttl=64 time=0.068 ms

 --- 127.25.3.14 ping statistics ---
 5 packets transmitted, 5 received, 0% packet loss, time 4073ms
 rtt min/avg/max/mdev = 0.038/0.062/0.068/0.012 ms
 ok
 run arp_ignore test
 net.ipv4.conf.veth0.route_localnet = 1
 net.ipv4.conf.veth1.route_localnet = 1
 net.ipv4.conf.veth0.arp_ignore = 3
 net.ipv4.conf.veth1.arp_ignore = 3
 PING 127.25.3.14 (127.25.3.14) from 127.25.3.4 veth0: 56(84)
  bytes of data.
 64 bytes from 127.25.3.14: icmp_seq=1 ttl=64 time=0.032 ms
 64 bytes from 127.25.3.14: icmp_seq=2 ttl=64 time=0.065 ms
 64 bytes from 127.25.3.14: icmp_seq=3 ttl=64 time=0.066 ms
 64 bytes from 127.25.3.14: icmp_seq=4 ttl=64 time=0.065 ms
 64 bytes from 127.25.3.14: icmp_seq=5 ttl=64 time=0.065 ms

 --- 127.25.3.14 ping statistics ---
 5 packets transmitted, 5 received, 0% packet loss, time 4092ms
 rtt min/avg/max/mdev = 0.032/0.058/0.066/0.013 ms
 ok
ok 1 selftests: net: route_localnet.sh
...

Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
 tools/testing/selftests/net/route_localnet.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/route_localnet.sh b/tools/testing/selftests/net/route_localnet.sh
index 116bfeab72fa..e08701c750e3 100755
--- a/tools/testing/selftests/net/route_localnet.sh
+++ b/tools/testing/selftests/net/route_localnet.sh
@@ -18,8 +18,10 @@ setup() {
     ip route del 127.0.0.0/8 dev lo table local
     ip netns exec "${PEER_NS}" ip route del 127.0.0.0/8 dev lo table local
 
-    ifconfig veth0 127.25.3.4/24 up
-    ip netns exec "${PEER_NS}" ifconfig veth1 127.25.3.14/24 up
+    ip address add 127.25.3.4/24 dev veth0
+    ip link set dev veth0 up
+    ip netns exec "${PEER_NS}" ip address add 127.25.3.14/24 dev veth1
+    ip netns exec "${PEER_NS}" ip link set dev veth1 up
 
     ip route flush cache
     ip netns exec "${PEER_NS}" ip route flush cache
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
