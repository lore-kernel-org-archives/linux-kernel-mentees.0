Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63ECC0032E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Oct 2023 11:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7556D4F4CE;
	Sun, 22 Oct 2023 11:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7556D4F4CE
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CJ6z2oUV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZouBKZ3QMz0; Sun, 22 Oct 2023 11:32:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 636644F47E;
	Sun, 22 Oct 2023 11:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 636644F47E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AE90C0071;
	Sun, 22 Oct 2023 11:32:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E2B2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Oct 2023 11:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE724416BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Oct 2023 11:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE724416BD
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CJ6z2oUV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZrUVuGeWhWN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Oct 2023 11:32:02 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E927E40103
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Oct 2023 11:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E927E40103
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6bd32d1a040so2344002b3a.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Oct 2023 04:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697974321; x=1698579121;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GQ7n+v9m+PyKaMpTphITvlWXT1CO3oXKgg4jO6DVoj8=;
 b=CJ6z2oUVkKQhsohN/b2UNHBh5jsKd8ONPn5NXlrhlyuVJwJbmWaCPoR/UNxhkgOHQm
 IMY3ssEOEpe4xagtRgzLlY8u1jSS8wWD/tJhIyfTJ7PyaOJ3lGKk6z6XI+ojBT/HPW8O
 PgtRcLZgwdaHEku0O3009RsjCcyewMIWNrZFHaUVBsSSZI/2ytjFpgnpKMLkrtP1a3pC
 7Ht2XdiqoWCVrVyLgOxz9dSK/1AdB1hPvvfsealKl1OD+Km96DU2gPPRDr4pQv1tB0sr
 FvcN709RZ4pmwOHNVbwuNXteiQqnKD/H3ic8Ql2OeYt+F6kHESOtk/QI3bTOW4YCxdc6
 nsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697974321; x=1698579121;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GQ7n+v9m+PyKaMpTphITvlWXT1CO3oXKgg4jO6DVoj8=;
 b=SZAn6RQDIP7k0WTPE52RQ5VSOzgmPfhfERy/bEZ0JCB6IFRLyfq2xaLpJrGqetb/kI
 Dly7XzB7jdfnHYBvtBRjJLkG7TMHKNncqK9GD7T5jNgI87wolzifWRLRVk3Ewb7nm/JJ
 BAZ7TF/VGT3WiZ1GUXEe4WotQ9blq82xmxU/AbKcL/zjamhP8PQPkMazHE/RGxqRq/H2
 J3ojfpKs6fKv6eDRj0lUcXBuAVGJUHAox2d9jMAVPvHiXtqTwJ0Cnr1Kzi5kOsog/Ost
 nL91qHOS6e4/giOoHQ3bDxi5bit3aXOvMiT6SYHBT5naXgOjRqb0r2l5QZKSpV8zm/t+
 CmcQ==
X-Gm-Message-State: AOJu0YwgENytawNw2kdez00Mh1cAHnWpSYuyWxwLX+rDTTh3POE/FL1/
 +BRXaPRZvgy+jRdDxVC0R5k=
X-Google-Smtp-Source: AGHT+IFnMBSSH1d6q6yg4NNW4JuRt11TVePUFY5Tl9BRpqeJ5VZailqw59cOJDzX5i6/eylStgOudw==
X-Received: by 2002:a05:6a00:a27:b0:6bf:83d1:da6e with SMTP id
 p39-20020a056a000a2700b006bf83d1da6emr1955818pfh.22.1697974321053; 
 Sun, 22 Oct 2023 04:32:01 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.85.44])
 by smtp.gmail.com with ESMTPSA id
 f125-20020a625183000000b0065a1b05193asm4649833pfb.185.2023.10.22.04.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Oct 2023 04:32:00 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] selftests:net change ifconfig with ip command
Date: Sun, 22 Oct 2023 17:01:48 +0530
Message-Id: <20231022113148.2682-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
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
index 116bfeab72fa..3ab9beb4462c 100755
--- a/tools/testing/selftests/net/route_localnet.sh
+++ b/tools/testing/selftests/net/route_localnet.sh
@@ -18,8 +18,10 @@ setup() {
     ip route del 127.0.0.0/8 dev lo table local
     ip netns exec "${PEER_NS}" ip route del 127.0.0.0/8 dev lo table local
 
-    ifconfig veth0 127.25.3.4/24 up
-    ip netns exec "${PEER_NS}" ifconfig veth1 127.25.3.14/24 up
+    ip a add 127.25.3.4/24 dev veth0
+    ip link set dev veth0 up
+    ip netns exec "${PEER_NS}" ip a add 127.25.3.14/24 dev veth1
+    ip netns exec "${PEER_NS}" ip link set dev veth1 up
 
     ip route flush cache
     ip netns exec "${PEER_NS}" ip route flush cache
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
