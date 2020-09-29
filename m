Return-Path: <SRS0=644b=DG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FBF9C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 03:26:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C085216C4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Sep 2020 03:26:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9pyV5n5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C085216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0DF8C86FAE;
	Tue, 29 Sep 2020 03:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id REyeR9esTEsL; Tue, 29 Sep 2020 03:26:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7B4698709E;
	Tue, 29 Sep 2020 03:26:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A18CC0891;
	Tue, 29 Sep 2020 03:26:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAC21C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9AAD2859BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-mf6P5ZgIjh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 07C93858C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Sep 2020 03:26:53 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id q5so3129287qkc.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Sep 2020 20:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hfFwZ3HlzYS1eMwazP0kendf4o1kSxj79xJD83EYXmk=;
 b=N9pyV5n5SX1MgmqPp0PhpoYzGlcx7tyFmcpwX+iIqE1TsW2jzfdvVAolI0cgC7vnpT
 GGvymtZ+BDYBzrG3fj2WuAKE0DB+1ctYL13/XzeGtHfZOJNhcd/LNshm0UcLs8wO0hQF
 jKkqI1Psv17uazhMldI0acTm3ZMS2CZ0CTJdpgryP2bRL2jcXyR0houZchwA0HzFHyBM
 PMStte6zjpUlk6WnuEXDJCk6rortGXfz6l2mxtwe6gD4a8hU6QuDnjhhcfCkqnPaqPTu
 igB5sLHMihmuCuZHGQGaEL4tBvMh2MkQ5rLM6YyCbtUVGXkAJphqRtKUlcY1Jeg/V+cn
 jFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hfFwZ3HlzYS1eMwazP0kendf4o1kSxj79xJD83EYXmk=;
 b=SyovzbtEXkoIKJmXSn94HEM6qlWw3Uojq1JwfFS8/I3L+A6IbqkvJtYEBzQ046NUAK
 myhVCjO0ecmLc2IxYgETUnrnde42IbAmni3ZMv1AQn4yYLniHJ/mCGU0UrGMJ/y8vmR4
 +9omiiuWw3uZK1d/2yfvAHpGSnGJULkURwqhKLX7Qk/TWc+AzNpjHE1dToPSOrijOINj
 JPIyeLAOhmnMgWQkkT05VCvFZ12qpq0mh/GuA/zRREsbhikrX8vdFjbGo2NJG6TR2uSb
 PBXBf7tPFaApXG2Ook/qEIxSdkmUPJEEvbDNamkTKsah9462Xd7f4zpayuLXpvE9oQsF
 B7vg==
X-Gm-Message-State: AOAM533RCk2E+foA7OSLXeQDMy7UCBN1xziyPpDYKSSVa+0krQwDlvfz
 E9xGknjt9lDW9m+1emIsAsY=
X-Google-Smtp-Source: ABdhPJzukJqIFWl+XhHi7xs4/P1TciFlOpahd3nHsPNpqjNS4/bwT4nW3dxWF3ObmqWGAxCRHeeDvw==
X-Received: by 2002:a37:9c86:: with SMTP id f128mr2642714qke.30.1601350011843; 
 Mon, 28 Sep 2020 20:26:51 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id c40sm4010313qtb.72.2020.09.28.20.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 20:26:51 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org,
	r.verdejo@samsung.com,
	nicolas@ndufresne.ca
Date: Tue, 29 Sep 2020 00:26:25 -0300
Message-Id: <20200929032625.1548909-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
References: <20200929032625.1548909-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH WIP 6/6] media: vidtv: psi: fix
	missing assignments in while loops
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

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Some variables were only assigned once but were used in while
loops as if they had been updated at every iteration. Fix this.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 22 +++++++++-----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 2cf103057b19..ddbffea4c353 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -1191,9 +1191,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 
 	struct vidtv_psi_desc *table_descriptor   = args.pmt->descriptor;
 	struct vidtv_psi_table_pmt_stream *stream = args.pmt->stream;
-	struct vidtv_psi_desc *stream_descriptor  = (stream) ?
-						    args.pmt->stream->descriptor :
-						    NULL;
+	struct vidtv_psi_desc *stream_descriptor;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
@@ -1253,6 +1251,8 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 
 		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
 
+		stream_descriptor = stream->descriptor;
+
 		while (stream_descriptor) {
 			/* write the stream descriptors, if any */
 			d_args.dest_buf           = args.buf;
@@ -1343,9 +1343,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_sdt_service *service = args.sdt->service;
-	struct vidtv_psi_desc *service_desc = (args.sdt->service) ?
-					      args.sdt->service->descriptor :
-					      NULL;
+	struct vidtv_psi_desc *service_desc;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
@@ -1392,6 +1390,8 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 
 		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
 
+		service_desc = service->descriptor;
+
 		while (service_desc) {
 			/* copy the service descriptors, if any */
 			d_args.dest_buf           = args.buf;
@@ -1639,9 +1639,7 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 
 	struct vidtv_psi_desc *table_descriptor     = args.nit->descriptor;
 	struct vidtv_psi_table_transport *transport = args.nit->transport;
-	struct vidtv_psi_desc *transport_descriptor = (transport) ?
-						       args.nit->transport->descriptor :
-						       NULL;
+	struct vidtv_psi_desc *transport_descriptor;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
@@ -1709,6 +1707,8 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 
 		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
 
+		transport_descriptor = transport->descriptor;
+
 		while (transport_descriptor) {
 			/* write the transport descriptors, if any */
 			d_args.dest_buf           = args.buf;
@@ -1846,9 +1846,7 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_eit_event *event = args.eit->event;
-	struct vidtv_psi_desc *event_descriptor = (args.eit->event) ?
-						   args.eit->event->descriptor :
-						   NULL;
+	struct vidtv_psi_desc *event_descriptor;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
-- 
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
