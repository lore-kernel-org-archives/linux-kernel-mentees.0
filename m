Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB8DC3065A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 15:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E120B401A4;
	Thu, 17 Aug 2023 15:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E120B401A4
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DqRgdTip
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ypM7UrW6uDV8; Thu, 17 Aug 2023 15:47:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DF69140158;
	Thu, 17 Aug 2023 15:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF69140158
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8ADDC0071;
	Thu, 17 Aug 2023 15:47:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51F13C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 15:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BC2560AF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 15:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BC2560AF1
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DqRgdTip
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id guTXo-8lqp6k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 15:47:16 +0000 (UTC)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1500F608D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 15:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1500F608D8
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-564cd28d48dso4905160a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 08:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692287235; x=1692892035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yy/n52yulvpcfWLb++c8suVS1IeV5wLMc2On2ajtVn0=;
 b=DqRgdTipiN1W5MeiyyQWhKSSmmvLWQTF5ygJCsGh+oUUGl8go+IAm32IYP941AIBd+
 ukPZ95stXV19993mwBNQBV2xC+YEW0lMCnT17/h28xTbVNlgY9bRt42DdhAnWL42Slqm
 eAsfjrlGIcOFCqRk87Z+KIhXaN0rlBNlvgAX7IbGTDJxTf3zTQ/vODSYUDpPitBPKdS2
 wLtuhyWy/doXzdPMM+pfWVngYOCipb7ne76EPNQ9X8iTbNzVy9Z4UT/RXHCTDxYnNxoY
 BSXKHw4/c47JUtkwAaZsmu059qt8c/0902d99isxRcAkbi6gslbhTqolxxRbYkAJZSeD
 KnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692287235; x=1692892035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yy/n52yulvpcfWLb++c8suVS1IeV5wLMc2On2ajtVn0=;
 b=O2RbirBkV3LgykKNyqZDvMdo0a2U/AMKjCXMLY6s320fkEnqEOhEwqcoov+a/DWsWq
 hg7z9NETpvYGCiSQSmXzoRDcV+itOmONDMQeVHEsqCXpCXV5+LvNXj0/vkKEUOn1nBBl
 CaTA+H4+Df2YlLIBnLlbHBv4L5/sZQOMG/w7QdGzGcF1mg3jzMu7CwRBnEyk5qQnvXb6
 aHRTSxbk99jvr2KRzsC93MmX9e7u9UUFz1XvtH2Uw3e4DVflRhJq9EdTM5hPWIYBvqn9
 HizSF4KLEiidD9GW8Kqhm3NxaUhq/fl84qQ0+a1uuQYMFBOzaAw5CzQMn82x1Ko52kPM
 w6Vg==
X-Gm-Message-State: AOJu0YztNsFZhN27QtSOdiG127wzMfF1a/fP+kj5AmKhPRRUO8Iqx+Ma
 VLd3w5wZGfKeO5D+CSzUs1Y=
X-Google-Smtp-Source: AGHT+IGEvVWcUtDczq5FDtbetppkb7VnPjnBC82kxf6Cv44eHo872be3BCwGzdNZww+R2KKxBmmL5Q==
X-Received: by 2002:a05:6a20:d7:b0:13a:8082:5324 with SMTP id
 23-20020a056a2000d700b0013a80825324mr72037pzh.44.1692287235094; 
 Thu, 17 Aug 2023 08:47:15 -0700 (PDT)
Received: from fanta-System-Product-Name.. ([222.252.65.171])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a63ac0a000000b00563709c8647sm14019742pge.7.2023.08.17.08.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 08:47:14 -0700 (PDT)
From: Anh Tuan Phan <tuananhlfc@gmail.com>
To: sdf@google.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev
Subject: [bpf-next PATCH v1] samples/bpf: Cleanup repetitive swap function
Date: Thu, 17 Aug 2023 22:46:15 +0700
Message-Id: <20230817154615.87967-1-tuananhlfc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Anh Tuan Phan <tuananhlfc@gmail.com>
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

Use the macro version of swap function and move its definition to
bpf_util.h since it is repetitive in some files. This commit also fixes
a warning from coccinelle:

- ./samples/bpf/xdp_sample_user.c:1493:8-9: WARNING opportunity for swap()
- ./samples/bpf/xdp_rxq_info_user.c:435:8-9: WARNING opportunity for swap()

Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
---
 samples/bpf/xdp_rxq_info_user.c        | 12 +-----------
 samples/bpf/xdp_sample_user.c          | 12 +-----------
 tools/testing/selftests/bpf/bpf_util.h |  3 +++
 3 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/samples/bpf/xdp_rxq_info_user.c b/samples/bpf/xdp_rxq_info_user.c
index b95e0ef61f06..862ee370f96a 100644
--- a/samples/bpf/xdp_rxq_info_user.c
+++ b/samples/bpf/xdp_rxq_info_user.c
@@ -426,16 +426,6 @@ static void stats_print(struct stats_record *stats_rec,
 }
 
 
-/* Pointer swap trick */
-static inline void swap(struct stats_record **a, struct stats_record **b)
-{
-	struct stats_record *tmp;
-
-	tmp = *a;
-	*a = *b;
-	*b = tmp;
-}
-
 static void stats_poll(int interval, int action, __u32 cfg_opt)
 {
 	struct stats_record *record, *prev;
@@ -445,7 +435,7 @@ static void stats_poll(int interval, int action, __u32 cfg_opt)
 	stats_collect(record);
 
 	while (1) {
-		swap(&prev, &record);
+		swap(prev, record);
 		stats_collect(record);
 		stats_print(record, prev, action, cfg_opt);
 		sleep(interval);
diff --git a/samples/bpf/xdp_sample_user.c b/samples/bpf/xdp_sample_user.c
index 158682852162..9508bc0c2f2f 100644
--- a/samples/bpf/xdp_sample_user.c
+++ b/samples/bpf/xdp_sample_user.c
@@ -1484,16 +1484,6 @@ static int sample_signal_cb(void)
 	return 0;
 }
 
-/* Pointer swap trick */
-static void swap(struct stats_record **a, struct stats_record **b)
-{
-	struct stats_record *tmp;
-
-	tmp = *a;
-	*a = *b;
-	*b = tmp;
-}
-
 static int sample_timer_cb(int timerfd, struct stats_record **rec,
 			   struct stats_record **prev)
 {
@@ -1505,7 +1495,7 @@ static int sample_timer_cb(int timerfd, struct stats_record **rec,
 	if (ret < 0)
 		return -errno;
 
-	swap(prev, rec);
+	swap(*prev, *rec);
 	ret = sample_stats_collect(*rec);
 	if (ret < 0)
 		return ret;
diff --git a/tools/testing/selftests/bpf/bpf_util.h b/tools/testing/selftests/bpf/bpf_util.h
index 10587a29b967..ba3c44d64d44 100644
--- a/tools/testing/selftests/bpf/bpf_util.h
+++ b/tools/testing/selftests/bpf/bpf_util.h
@@ -8,6 +8,9 @@
 #include <errno.h>
 #include <bpf/libbpf.h> /* libbpf_num_possible_cpus */
 
+#define swap(a, b) \
+	do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
+
 static inline unsigned int bpf_num_possible_cpus(void)
 {
 	int possible_cpus = libbpf_num_possible_cpus();
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
