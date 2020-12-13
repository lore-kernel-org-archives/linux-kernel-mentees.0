Return-Path: <SRS0=B2kz=FR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF245C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 17:21:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 805092313B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 17:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 805092313B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2401086E66;
	Sun, 13 Dec 2020 17:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqKNXPPEo1q2; Sun, 13 Dec 2020 17:21:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0F65686E55;
	Sun, 13 Dec 2020 17:21:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB686C0893;
	Sun, 13 Dec 2020 17:21:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 025D7C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 17:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E3836203CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 17:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0B7T1iSufNKL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 17:21:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 09B7D20354
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 17:21:47 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id b5so3714743pjk.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 09:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1zcKdEvXUinlyQ0DJNKSAcbSUYIOUf/crPkA5dD+DVQ=;
 b=HDKqXXvYa5X0q7XiyfCnrOqv5Y5zDdb/NYR8P7ny6SUpk4ursGtqivnol/1Lp+Tgkf
 z+JSR5Jcw5LBMNXrKj9dJT9hwJLmSi67EnWhrCrFKY0vmYL66XKuhrPS5sfmaNMGvTPK
 zLjs5QN7AsSC6Mhd76T4uenksRzYqOqi4rLlKOfaQch/tqlEOeST89+pz0Ew8k7QDQNB
 7XmFmZ6qwBf4I/DOxTRZPHj3BzTh+YHjBPua0u8gqnKJBenlrGWkcvGTbv6ZpXq1lt9T
 a0KjtCKudRxBl2ppCjsszk56Mit9RkG8pieUQq/7AVnmSKoW1RvKzdSDHDF07l/50b8v
 hUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1zcKdEvXUinlyQ0DJNKSAcbSUYIOUf/crPkA5dD+DVQ=;
 b=hhNT0lv5GdJKP3ThyGqqoQqalMsA+1FT1nEWcQ9xqVU7ItkXhE3pe913Ijxh44OpeW
 DhObWJAUM96Lf6H9L4kALvCcIeV5LJsmQFNkBmlADpcF1zT3BjqFhyombAz7piVZZPl9
 dQI6oZWudtumAjNrCkC4VllKiGk9hsQ2Ywk7I19eLdfLUsiHDwoK7zE29x8Hqa5pWJWO
 QvAwAeY9P4FrudjK6Rli65hU0Sg6Sw+csT1DdI1QI7w9AvA560ISNM7Jt0pFdpgLOYwZ
 beXjUnZ6387GQvJEeI4oICLpeAnLBZpn3HK1RF5UyHfDIpUt8RDQdZcU29N0hO1PB/MH
 +s3Q==
X-Gm-Message-State: AOAM533ULmip1wAmq3KvLmImMxrZ+l3auKlb5umR/IhgEISROf/arvih
 tVpFQf1fbdtNhWT+gkb6olQ=
X-Google-Smtp-Source: ABdhPJwoIBGPjHWhpIoeStAEazElTLj9mYbiOmxwtgWog2LCDQcfLASTJNwtLEhdnADIeA8ZPOfi7w==
X-Received: by 2002:a17:902:a60c:b029:da:e036:5dbe with SMTP id
 u12-20020a170902a60cb02900dae0365dbemr19084179plq.43.1607880107382; 
 Sun, 13 Dec 2020 09:21:47 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:429:63e5:4c53:2c99:e037:68ae])
 by smtp.googlemail.com with ESMTPSA id kb12sm15196434pjb.2.2020.12.13.09.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 09:21:46 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun, 13 Dec 2020 22:51:36 +0530
Message-Id: <20201213172136.15975-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
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

There are certain relational expressions in atomisp where a boolean
variable is compared with true/false in forms such as (foo == true)
or (false != bar), which does not comply with the coding style rule by
checkpatch.pl (CHK: BOOL_COMPARISON), according to which the boolean
variables should be themselves used in relational expression, rather
than comparing with true or false.

E.g. In drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:

if (asd->stream_prepared == false) {

Can be replaced with:
if (!asd->stream_prepared) {

Replace such relational expressions with boolean variables appropriately.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
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
