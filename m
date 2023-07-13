Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D9FC001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Jul 2023 18:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ACE083B8A;
	Thu, 13 Jul 2023 18:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ACE083B8A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NaUfFufg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvhW-FZvstMx; Thu, 13 Jul 2023 18:56:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D811083B85;
	Thu, 13 Jul 2023 18:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D811083B85
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3599C0071;
	Thu, 13 Jul 2023 18:56:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 18CF8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 18:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3054404EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 18:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3054404EF
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=NaUfFufg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cLyA9-0xY4TN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 18:56:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0D794013D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0D794013D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 18:56:56 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbc656873eso10476235e9.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 11:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689274615; x=1691866615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u4/bIWsye08CVfitEtquZgW3u9vyoK7UTHEBm6IUm74=;
 b=NaUfFufg2wboQQirLgEou9URcoLte0ALFAEjP9//G3UQwHlL4Yg+DUbwS8cFwMv8LM
 4grsVdNmG0hypwJSf5O1/z3zBUg9kzX6bS7obiYtyKsumYjDMG4KHgMCRgakxiGo+AyN
 Ynjf0CN+RZ8Qv0WqNg3CR2s2Vv7opiuh1W6GPV0G46YCGpANuMGdg+0L4Iw5B+hyLIxO
 PK/+ER8W3ReqTGRN6QGIOSUAAlhwg1l61u9LmcpsPqfDl3+7QtxMTajStxMdXb72FNyS
 YoKfMoPlcti4MXfUzljFtrAcHAbFimxOXSQDOPQ4g76gQNW5s2YXLsRXneUUe8jEEKfN
 IFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689274615; x=1691866615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4/bIWsye08CVfitEtquZgW3u9vyoK7UTHEBm6IUm74=;
 b=J1lli1uMVT9kPleGfhr2rBcRewmCVsm9DHxW84qJOHbbQSvp5hW1Ovhxhg1OWxCruA
 RfrZLUj+EL3OVRafJA0vndWHX6enErawA/qgF9VLtxBj+MFgytkPIetJA0NQ2rc/Ne5i
 EEpGsLKjy16mBf1HCK0VjJ1N9LlKTWm6TP++/SmaAR7dn3W8SLiVyN7LpSvk/RQaJ5sE
 FHxEpamnbJKcbI8jNG1deHqPhicWeZOuq9lZ9v5B+ft9kGK7/m5K90WO7k2JPKYiiyus
 mP4LtnL5Nw4dmArmjeA97hAV3Wxus8gBnoxoPR7EaACsyGEujDyX+qTIIk4HhZX/vtYi
 HXQQ==
X-Gm-Message-State: ABy/qLYXlZ9eFQsXGjn6G6lpz/DbvKubsjX0XBcQxfMpnMNd8+9BkfMt
 Bqy/+PXIVkDcOtLxktbWXKw=
X-Google-Smtp-Source: APBJJlHcgHsMCMuQqFLp4qbdIZM1XeDfby13QINX0aLJFmm7uGWKQwZL+9++QnvCVmnl8B56TVkk1g==
X-Received: by 2002:a7b:c41a:0:b0:3fb:fef1:68b7 with SMTP id
 k26-20020a7bc41a000000b003fbfef168b7mr2607613wmi.27.1689274614654; 
 Thu, 13 Jul 2023 11:56:54 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx..
 ([2001:8f8:1163:535c:952:d673:8e4a:6288])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a1c740b000000b003fbe36a4ce6sm18971601wmc.10.2023.07.13.11.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 11:56:54 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: shuah@kernel.org
Subject: [PATCH v0] selftests/net: replace manual array size calc with
 ARRAYSIZE macro.
Date: Thu, 13 Jul 2023 22:56:44 +0400
Message-Id: <20230713185644.1728127-1-mahmoudmatook.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kselftest@vger.kernel.org, Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
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

fixes coccinelle WARNING: Use ARRAY_SIZE
Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
---
 tools/testing/selftests/net/csum.c            |  8 ++++++--
 tools/testing/selftests/net/hwtstamp_config.c | 18 ++++++++++--------
 tools/testing/selftests/net/psock_lib.h       |  6 +++++-
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/net/csum.c b/tools/testing/selftests/net/csum.c
index 82a1c1839da6..702f34a9d506 100644
--- a/tools/testing/selftests/net/csum.c
+++ b/tools/testing/selftests/net/csum.c
@@ -123,6 +123,10 @@ static struct sockaddr_in6 cfg_saddr6 = {.sin6_family = AF_INET6};
 #define MAX_HEADER_LEN	(sizeof(struct ipv6hdr) + ENC_HEADER_LEN + sizeof(struct tcphdr))
 #define MAX_PAYLOAD_LEN 1024
 
+#ifndef ARRAY_SIZE
+#define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
+#endif
+
 /* Trivial demo encap. Stand-in for transport layer protocols like ESP or PSP */
 struct udp_encap_hdr {
 	uint8_t nexthdr;
@@ -450,7 +454,7 @@ static void send_packet(int fd, const char *buf, int len)
 	iov[2].iov_len = len;
 
 	msg.msg_iov = iov;
-	msg.msg_iovlen = sizeof(iov) / sizeof(iov[0]);
+	msg.msg_iovlen = ARRAY_SIZE(iov);
 
 	msg.msg_name = &addr;
 	msg.msg_namelen = sizeof(addr);
@@ -505,7 +509,7 @@ static void __recv_prepare_packet_filter(int fd, int off_nexthdr, int off_dport)
 	struct sock_fprog prog = {};
 
 	prog.filter = filter;
-	prog.len = sizeof(filter) / sizeof(struct sock_filter);
+	prog.len = ARRAY_SIZE(filter);
 	if (setsockopt(fd, SOL_SOCKET, SO_ATTACH_FILTER, &prog, sizeof(prog)))
 		error(1, errno, "setsockopt filter");
 }
diff --git a/tools/testing/selftests/net/hwtstamp_config.c b/tools/testing/selftests/net/hwtstamp_config.c
index e1fdee841021..263cc1c34165 100644
--- a/tools/testing/selftests/net/hwtstamp_config.c
+++ b/tools/testing/selftests/net/hwtstamp_config.c
@@ -16,6 +16,10 @@
 #include <linux/net_tstamp.h>
 #include <linux/sockios.h>
 
+#ifndef ARRAY_SIZE
+#define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
+#endif
+
 static int
 lookup_value(const char **names, int size, const char *name)
 {
@@ -50,7 +54,6 @@ static const char *tx_types[] = {
 	TX_TYPE(ONESTEP_SYNC)
 #undef TX_TYPE
 };
-#define N_TX_TYPES ((int)(sizeof(tx_types) / sizeof(tx_types[0])))
 
 static const char *rx_filters[] = {
 #define RX_FILTER(name) [HWTSTAMP_FILTER_ ## name] = #name
@@ -71,16 +74,15 @@ static const char *rx_filters[] = {
 	RX_FILTER(PTP_V2_DELAY_REQ),
 #undef RX_FILTER
 };
-#define N_RX_FILTERS ((int)(sizeof(rx_filters) / sizeof(rx_filters[0])))
 
 static void usage(void)
 {
 	fputs("Usage: hwtstamp_config if_name [tx_type rx_filter]\n"
 	      "tx_type is any of (case-insensitive):\n",
 	      stderr);
-	list_names(stderr, tx_types, N_TX_TYPES);
+	list_names(stderr, tx_types, ARRAY_SIZE(tx_types));
 	fputs("rx_filter is any of (case-insensitive):\n", stderr);
-	list_names(stderr, rx_filters, N_RX_FILTERS);
+	list_names(stderr, rx_filters, ARRAY_SIZE(rx_filters));
 }
 
 int main(int argc, char **argv)
@@ -97,8 +99,8 @@ int main(int argc, char **argv)
 
 	if (argc == 4) {
 		config.flags = 0;
-		config.tx_type = lookup_value(tx_types, N_TX_TYPES, argv[2]);
-		config.rx_filter = lookup_value(rx_filters, N_RX_FILTERS, argv[3]);
+		config.tx_type = lookup_value(tx_types, ARRAY_SIZE(tx_types), argv[2]);
+		config.rx_filter = lookup_value(rx_filters, ARRAY_SIZE(rx_filters), argv[3]);
 		if (config.tx_type < 0 || config.rx_filter < 0) {
 			usage();
 			return 2;
@@ -120,12 +122,12 @@ int main(int argc, char **argv)
 	}
 
 	printf("flags = %#x\n", config.flags);
-	name = lookup_name(tx_types, N_TX_TYPES, config.tx_type);
+	name = lookup_name(tx_types, ARRAY_SIZE(tx_types), config.tx_type);
 	if (name)
 		printf("tx_type = %s\n", name);
 	else
 		printf("tx_type = %d\n", config.tx_type);
-	name = lookup_name(rx_filters, N_RX_FILTERS, config.rx_filter);
+	name = lookup_name(rx_filters, ARRAY_SIZE(rx_filters), config.rx_filter);
 	if (name)
 		printf("rx_filter = %s\n", name);
 	else
diff --git a/tools/testing/selftests/net/psock_lib.h b/tools/testing/selftests/net/psock_lib.h
index faa884385c45..72078d46864d 100644
--- a/tools/testing/selftests/net/psock_lib.h
+++ b/tools/testing/selftests/net/psock_lib.h
@@ -24,6 +24,10 @@
 # define __maybe_unused		__attribute__ ((__unused__))
 #endif
 
+#ifndef ARRAY_SIZE
+#define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
+#endif
+
 static __maybe_unused void pair_udp_setfilter(int fd)
 {
 	/* the filter below checks for all of the following conditions that
@@ -63,7 +67,7 @@ static __maybe_unused void pair_udp_setfilter(int fd)
 	struct sock_fprog bpf_prog;
 
 	bpf_prog.filter = bpf_filter;
-	bpf_prog.len = sizeof(bpf_filter) / sizeof(struct sock_filter);
+	bpf_prog.len = ARRAY_SIZE(bpf_filter);
 
 	if (setsockopt(fd, SOL_SOCKET, SO_ATTACH_FILTER, &bpf_prog,
 		       sizeof(bpf_prog))) {
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
