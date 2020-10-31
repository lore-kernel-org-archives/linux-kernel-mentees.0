Return-Path: <SRS0=CDUK=EG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C995C56201
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 15:06:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CEA820702
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 15:06:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ons3Iwtl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CEA820702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E1AF1870A1;
	Sat, 31 Oct 2020 15:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id su2RaHAzexgh; Sat, 31 Oct 2020 15:06:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5272F870A7;
	Sat, 31 Oct 2020 15:06:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42363C0859;
	Sat, 31 Oct 2020 15:06:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C61FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4BC5B870B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yJedimx-Ztw8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 00B24870A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 15:06:20 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id m65so6249740qte.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 08:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QsiEQVnJgPtjofsvEVgHEaYNKMcgYG0VOfEEFck/Y0E=;
 b=Ons3IwtlqNwytQZtrJPFI7YpsmxmFn+1eH1/8Omx15U4RqEb/fAv8Rwh7d7t4rt/ad
 kHQbCxounm/RC56gORVH5ZFtncdzhWmizPfjRxECz2LXXtaAuYcRMCAvmvKCSCHCW8Fd
 XRMQIcxb3bluBOsB6ebcbi40+D5PQ8w9QUj8y5cO3KiyCw8kIPpzvWBBoMKLDEcXZeH0
 Nwy5Xtc9imzU/A8pgly6eo7JXachxTaZZq8BdGsNTKmPwyK7H0xjpmfPhAhENsOhbzff
 +sXvgk9fe0xEuRopT3m9CE99FcSLOTzDz8tbgHNr/1X0momp52dxy4LvnZylqhwjnfDE
 A6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QsiEQVnJgPtjofsvEVgHEaYNKMcgYG0VOfEEFck/Y0E=;
 b=NAgw7xn5xb/EScaEfydu5scevdGsP9aYgk/djEuGW9wkB1FP9Y8wWdG4VxIIqVkgqb
 pEs+aGpqPing6TVsZpkyH/zZhBTyFuKnsP87yziKVq2WuvNSph76P2qxEdfRyAcFfMia
 lDo9bx7UgalnkH+5xrX3wyo9JYUWSUYyhHUzqk6fSqHjHnp6eKkAukZ9kQnD7TxDJGak
 N3b9E+0nZ+6ZCaw8RZNT/oByZ5kvHQw9sSx2DCNhECN5MKtin4kRFQt9m+DpCxfH6UNh
 8gi6r4spxBEG3/fhU1rlH0dhDoSUKXEudeBfWBoZJ/O72mxgLvXyY4iPEvkw0Gjuzc8c
 8WGA==
X-Gm-Message-State: AOAM531pha72yVOH/dHX7djJxJcC1Cblr7UTLWciHmLH8eUDQoRNTe0C
 TCpI3HsgOAr50j7TDMicxyE=
X-Google-Smtp-Source: ABdhPJyvKzMo/EH6egGHLYSZQaM7wCaxJM3USy6Z5R1ireViCAw3ezh7IY6TjlAFQAHtlivtdy64mw==
X-Received: by 2002:aed:3383:: with SMTP id v3mr1261185qtd.353.1604156780081; 
 Sat, 31 Oct 2020 08:06:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id z125sm2317030qke.54.2020.10.31.08.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 08:06:19 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org,
	r.verdejo@samsung.com,
	nicolas@ndufresne.ca
Date: Sat, 31 Oct 2020 12:05:52 -0300
Message-Id: <20201031150552.663598-7-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201031150552.663598-1-dwlsalmeida@gmail.com>
References: <20201031150552.663598-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 6/6] media: vidtv: psi: fix
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
index ad2957efa483..4dda5b0004a3 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -1175,9 +1175,7 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 
 	struct vidtv_psi_desc *table_descriptor   = args.pmt->descriptor;
 	struct vidtv_psi_table_pmt_stream *stream = args.pmt->stream;
-	struct vidtv_psi_desc *stream_descriptor  = (stream) ?
-						    args.pmt->stream->descriptor :
-						    NULL;
+	struct vidtv_psi_desc *stream_descriptor;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
@@ -1237,6 +1235,8 @@ u32 vidtv_psi_pmt_write_into(struct vidtv_psi_pmt_write_args args)
 
 		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
 
+		stream_descriptor = stream->descriptor;
+
 		while (stream_descriptor) {
 			/* write the stream descriptors, if any */
 			d_args.dest_buf           = args.buf;
@@ -1324,9 +1324,7 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_sdt_service *service = args.sdt->service;
-	struct vidtv_psi_desc *service_desc = (args.sdt->service) ?
-					      args.sdt->service->descriptor :
-					      NULL;
+	struct vidtv_psi_desc *service_desc;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
@@ -1373,6 +1371,8 @@ u32 vidtv_psi_sdt_write_into(struct vidtv_psi_sdt_write_args args)
 
 		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
 
+		service_desc = service->descriptor;
+
 		while (service_desc) {
 			/* copy the service descriptors, if any */
 			d_args.dest_buf           = args.buf;
@@ -1616,9 +1616,7 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 
 	struct vidtv_psi_desc *table_descriptor     = args.nit->descriptor;
 	struct vidtv_psi_table_transport *transport = args.nit->transport;
-	struct vidtv_psi_desc *transport_descriptor = (transport) ?
-						       args.nit->transport->descriptor :
-						       NULL;
+	struct vidtv_psi_desc *transport_descriptor;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
@@ -1686,6 +1684,8 @@ u32 vidtv_psi_nit_write_into(struct vidtv_psi_nit_write_args args)
 
 		nbytes += vidtv_psi_ts_psi_write_into(psi_args);
 
+		transport_descriptor = transport->descriptor;
+
 		while (transport_descriptor) {
 			/* write the transport descriptors, if any */
 			d_args.dest_buf           = args.buf;
@@ -1823,9 +1823,7 @@ u32 vidtv_psi_eit_write_into(struct vidtv_psi_eit_write_args args)
 	u32 crc = INITIAL_CRC;
 
 	struct vidtv_psi_table_eit_event *event = args.eit->event;
-	struct vidtv_psi_desc *event_descriptor = (args.eit->event) ?
-						   args.eit->event->descriptor :
-						   NULL;
+	struct vidtv_psi_desc *event_descriptor;
 
 	struct header_write_args h_args = {};
 	struct psi_write_args psi_args  = {};
-- 
2.29.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
