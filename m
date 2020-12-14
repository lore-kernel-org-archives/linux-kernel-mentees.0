Return-Path: <SRS0=WLyE=FS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B80C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 13:27:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76168224B1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 13:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76168224B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 04685860B0;
	Mon, 14 Dec 2020 13:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8IOABHqtSsoj; Mon, 14 Dec 2020 13:27:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 54BA88604A;
	Mon, 14 Dec 2020 13:27:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B439C088E;
	Mon, 14 Dec 2020 13:27:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1C86C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 13:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 819F1204E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 13:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YNgmPut2ILPz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 13:27:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 3AD23204C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 13:27:27 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x18so2513613pln.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=w/xga15fpvf223g1LToCcvKonyr8d0IUXYfgkxm6LLw=;
 b=ZgUK/nAiJkiLJ84hMO3nR/+Zdeh13SON+QUAe8TvyR2XZf0Gkk6hXFOMJkDnU5q1wL
 FxNYSItxNDx5D3mQ+tGcbS+fdygzMIT7Mp6z29mkOuBog1zssOoWRRPvIi4TGG7Jnkd+
 Yz8T1RWFxYn5gjiCS4Lv7VpNv8gnFS5UC21G0LUa7YZEO/BGK/VAj5w3DR1PW9SXmF28
 JZn9fycsK7tI0YztyTrS1FqgNM2kb+GTTzosZwpi3VazmFdS/al7n9cBqGN7MTrWs/s2
 g1v16/YPxFiFe5N39TtPKgBPNGFhkyRZ8dbImxUh3wPFxl7t7j+gCc102Cr63odka6Fp
 V3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=w/xga15fpvf223g1LToCcvKonyr8d0IUXYfgkxm6LLw=;
 b=XjNe31KlZdN2CRcW5q6n+I77SAim/qc9gAsQH+iEFXEC2TDjTUMZdbR/7yy3oJUaEz
 lE/Wl5uDfOe4kFz86lRsdntHTwYXoCe7DVF/LCKnKtN/vm9Lefl+ypgD20uY2+8XWsda
 QdG8QhoDuspKH+CU+ntGCg8LhTVa0cwGTMWTFZkCgC7LrcL5BN59fO6Eyh2B6utwq3Fn
 G+cFbR7lattqh1X8xkxA84iv+26TuDdwKDY+a+qRo5uzVwMYmMlC/ynR5aD9FBydCHP1
 xBpCp761ukgc0OLW8C7K1IVwQ+x41m7wM9FB6vx/LuhLpL5r7jy01XQTS+BJes+/1Gl+
 BTlw==
X-Gm-Message-State: AOAM5310HjxkPLpR/eoW0eg+M9cfRQ4Rt+EkWf1K8tupAhw4II0Bcf/7
 6AcntFxtWpn6NARJpFzAfWM=
X-Google-Smtp-Source: ABdhPJzJUWP2hEoBaWY4snpg8ej0W+HdCMlhzSjpebEX80m5j2fm+jelBbjtFAOEE8w9WmVShQeBZQ==
X-Received: by 2002:a17:90a:cb8d:: with SMTP id
 a13mr25142870pju.155.1607952446672; 
 Mon, 14 Dec 2020 05:27:26 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:434:48f9:6555:5055:78fe:89cf])
 by smtp.googlemail.com with ESMTPSA id k64sm19944081pfd.75.2020.12.14.05.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 05:27:26 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-media@vger.kernel.org
Date: Mon, 14 Dec 2020 18:57:16 +0530
Message-Id: <20201214132716.28157-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: yashsri421@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] media: atomisp: replace boolean
	comparison of values with bool variables
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

There are certain expressions in a condition in atomisp, where a boolean
variable is compared with true/false in forms such as (foo == true)
or (false != bar), which does not comply with the coding style rule by
checkpatch.pl (CHK: BOOL_COMPARISON), according to which the boolean
variables should be themselves used in the condition, rather than
comparing with true or false.

E.g. In drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:

if (asd->stream_prepared == false) {

Can be replaced with:
if (!asd->stream_prepared) {

Replace such expressions with boolean variables appropriately.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* The changes made are compile tested
* The patch applies perfectly over next-20201204

 .../staging/media/atomisp/pci/atomisp_compat_css20.c |  2 +-
 .../atomisp/pci/runtime/isys/src/virtual_isys.c      | 12 ++++++------
 drivers/staging/media/atomisp/pci/sh_css.c           | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index faa0935e536a..6a80c676f668 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1142,7 +1142,7 @@ int atomisp_css_start(struct atomisp_sub_device *asd,
 	 * Thus the stream created in set_fmt get destroyed and need to be
 	 * recreated in the next stream on.
 	 */
-	if (asd->stream_prepared == false) {
+	if (!asd->stream_prepared) {
 		if (__create_pipes(asd)) {
 			dev_err(isp->dev, "create pipe error.\n");
 			return -EINVAL;
diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
index 317ea30ede7a..82f3c19dc455 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
@@ -179,12 +179,12 @@ ia_css_isys_error_t ia_css_isys_stream_create(
 	isys_stream->linked_isys_stream_id = isys_stream_descr->linked_isys_stream_id;
 	rc = create_input_system_input_port(isys_stream_descr,
 					    &isys_stream->input_port);
-	if (rc == false)
+	if (!rc)
 		return false;
 
 	rc = create_input_system_channel(isys_stream_descr, false,
 					 &isys_stream->channel);
-	if (rc == false) {
+	if (!rc) {
 		destroy_input_system_input_port(&isys_stream->input_port);
 		return false;
 	}
@@ -204,7 +204,7 @@ ia_css_isys_error_t ia_css_isys_stream_create(
 	if (isys_stream_descr->metadata.enable) {
 		rc = create_input_system_channel(isys_stream_descr, true,
 						 &isys_stream->md_channel);
-		if (rc == false) {
+		if (!rc) {
 			destroy_input_system_input_port(&isys_stream->input_port);
 			destroy_input_system_channel(&isys_stream->channel);
 			return false;
@@ -248,7 +248,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
 		  isys_stream_descr,
 		  &isys_stream_cfg->channel_cfg,
 		  false);
-	if (rc == false)
+	if (!rc)
 		return false;
 
 	/* configure metadata channel */
@@ -260,7 +260,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
 			  isys_stream_descr,
 			  &isys_stream_cfg->md_channel_cfg,
 			  true);
-		if (rc == false)
+		if (!rc)
 			return false;
 	}
 
@@ -269,7 +269,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
 		 &isys_stream->input_port,
 		 isys_stream_descr,
 		 &isys_stream_cfg->input_port_cfg);
-	if (rc == false)
+	if (!rc)
 		return false;
 
 	isys_stream->valid = 1;
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ddee04c8248d..a71c1bbd984b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1063,7 +1063,7 @@ sh_css_config_input_network(struct ia_css_stream *stream) {
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "sh_css_config_input_network() enter 0x%p:\n", stream);
 
-	if (stream->config.continuous == true)
+	if (stream->config.continuous)
 	{
 		if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_CAPTURE) {
 			pipe = stream->last_pipe;
@@ -5626,7 +5626,7 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 		} else {
 			/* output from main binary is not yuv line. currently this is
 			 * possible only when bci is enabled on vfpp output */
-			assert(pipe->config.enable_vfpp_bci == true);
+			assert(pipe->config.enable_vfpp_bci);
 			ia_css_pipe_get_yuvscaler_binarydesc(pipe, &vf_pp_descr,
 							     &mycs->video_binary.vf_frame_info,
 							     pipe_vf_out_info, NULL, NULL);
@@ -8072,7 +8072,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 		struct ia_css_frame *tmp_out_frame = NULL;
 
 		for (i = 0; i < num_yuv_scaler; i++) {
-			if (is_output_stage[i] == true)
+			if (is_output_stage[i])
 				tmp_out_frame = out_frame;
 			else
 				tmp_out_frame = NULL;
@@ -8464,7 +8464,7 @@ sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
 	/* In QoS case, load_extension already called, so skipping */
 	int	err = 0;
 
-	if (fw->loaded == false)
+	if (!fw->loaded)
 		err = acc_load_extension(fw);
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
@@ -9701,8 +9701,8 @@ ia_css_stream_destroy(struct ia_css_stream *stream) {
 			assert(entry);
 			if (entry) {
 				/* get the SP thread id */
-				if (ia_css_pipeline_get_sp_thread_id(
-					ia_css_pipe_get_pipe_num(entry), &sp_thread_id) != true)
+				if (!ia_css_pipeline_get_sp_thread_id(
+					ia_css_pipe_get_pipe_num(entry), &sp_thread_id))
 					return -EINVAL;
 				/* get the target input terminal */
 				sp_pipeline_input_terminal =
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
