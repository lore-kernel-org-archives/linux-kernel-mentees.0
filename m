Return-Path: <SRS0=B2kz=FR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF572C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 17:30:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E8D32336D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 17:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E8D32336D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E2DBD872C1;
	Sun, 13 Dec 2020 17:30:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zumZvugD15vS; Sun, 13 Dec 2020 17:30:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 419A2872B2;
	Sun, 13 Dec 2020 17:30:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26E60C0893;
	Sun, 13 Dec 2020 17:30:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B451C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 17:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4E9C8872C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 17:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1jb-4CWW0TkQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 17:30:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6FFE1872B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 17:30:36 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id f9so10522820pfc.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 09:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ol2X7lDX0bqS905+3po/cTz74L/7OvC4wvcucMhqYXs=;
 b=nK1argGZeA3uomhianc92OBIDGOGpS/3eky7UiV4oYSXBJVfAwhJoW+IdwtrUAqKjr
 aU/oWSmU/ySBXp5qLxN7dGQxWNw0U5Le68Q1PoDO9WlQuuJCLjNxYObnvF+HkspS3rPV
 wMGoANFox7eNm5oBJ65rXTCTz3QJykfVL9/jqeaLCblC0RvazLhw7g6yoy7AIZMG2MCA
 6Mhzjswvde06BaDMspxGJM1Jjkwr9awfzzHebXLCEJtrKsuRL71ZLTbIEITUtvTFLZZc
 txoOW9C4WrSGqY5oitXUERsnQYI1JYLK+Ww6eb9ptECf4UjUrwl1NuJB85JHnx2xOOjE
 UsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ol2X7lDX0bqS905+3po/cTz74L/7OvC4wvcucMhqYXs=;
 b=opXiwWVXsaKzmdSbHzn5XAITcTefxspCtfIMHN5ByghVXDbEH2JDadq3cgH6+uoHCt
 tsKkfhC49ja06hPDeC5tXHk11Z5fTLi8wD6C8/wbAH95jNlgIElJBp55ur9X1t/9m1kl
 Dch0QT+64n3xIQFRXVJ3Pp+OLtkNR0kz15XVYWq+rcBAf6qYNqsnxJxG8lpYFv8Vbib9
 zve1himOGTEyjwLr4yBQ1NqzpsNq5cM27L2x7/zS6+hdlZs58g+PwY1BuCXqYT/591KP
 vXhfrjq5hgedFnOaKwtZzVko21Coezvwr5oKjIa9umCBg4BmLAmYih3yY8ebeBqexQLd
 0iYg==
X-Gm-Message-State: AOAM5322VWj0aL58gqV9jnNeSebW6+4P100O3HPCE+8lABS4IQlLGLwl
 8Qm9PUtRjAmlZ2Yhy6BrCZU=
X-Google-Smtp-Source: ABdhPJzQem1EgXwAJ5DuYH2P9bqXjSBB9Bfhu0T/jksX5ow13wu4HNzknW78+/EqgSGi385kEY2z8w==
X-Received: by 2002:a65:56c6:: with SMTP id w6mr20615452pgs.438.1607880635894; 
 Sun, 13 Dec 2020 09:30:35 -0800 (PST)
Received: from ?IPv6:2402:3a80:429:63e5:4c53:2c99:e037:68ae?
 ([2402:3a80:429:63e5:4c53:2c99:e037:68ae])
 by smtp.gmail.com with ESMTPSA id h17sm2011352pfc.119.2020.12.13.09.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 09:30:35 -0800 (PST)
To: lukas.bulwahn@gmail.com
References: <20201213172136.15975-1-yashsri421@gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <5579438a-da78-3589-923e-c7eb174412c5@gmail.com>
Date: Sun, 13 Dec 2020 23:00:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201213172136.15975-1-yashsri421@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] media: atomisp: replace boolean
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 13/12/20 10:51 pm, Aditya Srivastava wrote:
> There are certain relational expressions in atomisp where a boolean
> variable is compared with true/false in forms such as (foo == true)
> or (false != bar), which does not comply with the coding style rule by
> checkpatch.pl (CHK: BOOL_COMPARISON), according to which the boolean
> variables should be themselves used in relational expression, rather
> than comparing with true or false.
> 
> E.g. In drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:
> 
> if (asd->stream_prepared == false) {
> 
> Can be replaced with:
> if (!asd->stream_prepared) {
> 
> Replace such relational expressions with boolean variables appropriately.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  .../staging/media/atomisp/pci/atomisp_compat_css20.c |  2 +-
>  .../atomisp/pci/runtime/isys/src/virtual_isys.c      | 12 ++++++------
>  drivers/staging/media/atomisp/pci/sh_css.c           | 12 ++++++------
>  3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> index faa0935e536a..6a80c676f668 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> @@ -1142,7 +1142,7 @@ int atomisp_css_start(struct atomisp_sub_device *asd,
>  	 * Thus the stream created in set_fmt get destroyed and need to be
>  	 * recreated in the next stream on.
>  	 */
> -	if (asd->stream_prepared == false) {
> +	if (!asd->stream_prepared) {
>  		if (__create_pipes(asd)) {
>  			dev_err(isp->dev, "create pipe error.\n");
>  			return -EINVAL;
> diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
> index 317ea30ede7a..82f3c19dc455 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
> @@ -179,12 +179,12 @@ ia_css_isys_error_t ia_css_isys_stream_create(
>  	isys_stream->linked_isys_stream_id = isys_stream_descr->linked_isys_stream_id;
>  	rc = create_input_system_input_port(isys_stream_descr,
>  					    &isys_stream->input_port);
> -	if (rc == false)
> +	if (!rc)
>  		return false;
>  
>  	rc = create_input_system_channel(isys_stream_descr, false,
>  					 &isys_stream->channel);
> -	if (rc == false) {
> +	if (!rc) {
>  		destroy_input_system_input_port(&isys_stream->input_port);
>  		return false;
>  	}
> @@ -204,7 +204,7 @@ ia_css_isys_error_t ia_css_isys_stream_create(
>  	if (isys_stream_descr->metadata.enable) {
>  		rc = create_input_system_channel(isys_stream_descr, true,
>  						 &isys_stream->md_channel);
> -		if (rc == false) {
> +		if (!rc) {
>  			destroy_input_system_input_port(&isys_stream->input_port);
>  			destroy_input_system_channel(&isys_stream->channel);
>  			return false;
> @@ -248,7 +248,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
>  		  isys_stream_descr,
>  		  &isys_stream_cfg->channel_cfg,
>  		  false);
> -	if (rc == false)
> +	if (!rc)
>  		return false;
>  
>  	/* configure metadata channel */
> @@ -260,7 +260,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
>  			  isys_stream_descr,
>  			  &isys_stream_cfg->md_channel_cfg,
>  			  true);
> -		if (rc == false)
> +		if (!rc)
>  			return false;
>  	}
>  
> @@ -269,7 +269,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
>  		 &isys_stream->input_port,
>  		 isys_stream_descr,
>  		 &isys_stream_cfg->input_port_cfg);
> -	if (rc == false)
> +	if (!rc)
>  		return false;
>  
>  	isys_stream->valid = 1;
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index ddee04c8248d..a71c1bbd984b 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -1063,7 +1063,7 @@ sh_css_config_input_network(struct ia_css_stream *stream) {
>  	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
>  			    "sh_css_config_input_network() enter 0x%p:\n", stream);
>  
> -	if (stream->config.continuous == true)
> +	if (stream->config.continuous)
>  	{
>  		if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_CAPTURE) {
>  			pipe = stream->last_pipe;
> @@ -5626,7 +5626,7 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
>  		} else {
>  			/* output from main binary is not yuv line. currently this is
>  			 * possible only when bci is enabled on vfpp output */
> -			assert(pipe->config.enable_vfpp_bci == true);
> +			assert(pipe->config.enable_vfpp_bci);
>  			ia_css_pipe_get_yuvscaler_binarydesc(pipe, &vf_pp_descr,
>  							     &mycs->video_binary.vf_frame_info,
>  							     pipe_vf_out_info, NULL, NULL);
> @@ -8072,7 +8072,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
>  		struct ia_css_frame *tmp_out_frame = NULL;
>  
>  		for (i = 0; i < num_yuv_scaler; i++) {
> -			if (is_output_stage[i] == true)
> +			if (is_output_stage[i])
>  				tmp_out_frame = out_frame;
>  			else
>  				tmp_out_frame = NULL;
> @@ -8464,7 +8464,7 @@ sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
>  	/* In QoS case, load_extension already called, so skipping */
>  	int	err = 0;
>  
> -	if (fw->loaded == false)
> +	if (!fw->loaded)
>  		err = acc_load_extension(fw);
>  
>  	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
> @@ -9701,8 +9701,8 @@ ia_css_stream_destroy(struct ia_css_stream *stream) {
>  			assert(entry);
>  			if (entry) {
>  				/* get the SP thread id */
> -				if (ia_css_pipeline_get_sp_thread_id(
> -					ia_css_pipe_get_pipe_num(entry), &sp_thread_id) != true)
> +				if (!ia_css_pipeline_get_sp_thread_id(
> +					ia_css_pipe_get_pipe_num(entry), &sp_thread_id))
>  					return -EINVAL;
>  				/* get the target input terminal */
>  				sp_pipeline_input_terminal =
> 

Hi Lukas

I have tested these changes by running Makefile in the root directory,
where I did not get any errors. Can you please review it quickly
before I send it to maintainers?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
