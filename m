Return-Path: <SRS0=WLyE=FS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C05C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 05:42:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2035A22838
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 05:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2035A22838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BE1FC2047A;
	Mon, 14 Dec 2020 05:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7ZEZXEjhKx5; Mon, 14 Dec 2020 05:42:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A376A20475;
	Mon, 14 Dec 2020 05:42:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 873FFC088E;
	Mon, 14 Dec 2020 05:42:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E124C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2226E86C73
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fh2JYnTxIAvP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:42:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EFA5486C1C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:42:00 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id p5so14714219ilm.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 21:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fBLmvqimdOYOstdI3NQ4fPlE/gH/DfGB/jHbG4iMjSA=;
 b=id+LoDo6VrWk9fOgFuichFY0MsZqdS7vSeRjS9b0HtTm9nvQbJQXRF7d/4pxKwvpB1
 kbL1QtOQ787tJvqAv/yMQKC6C1Yl7g1j8m107LOkalcjknP64Pr0vMM2mFNA7oTO4ZjM
 LW22BVRqp7aKyOYcRmI3V4lmmiHBaaoe9OHZ0iLpsHnV3O76R1HttuiLLwM9GMv4u4Yk
 qtI8mSM92s8nJ7co1EH6Pb45sf7RPdWkmr2+EwM+8g/+cb9EnxO/vEU0j4ssIvvU6zb0
 0qtNZvfCj9IHl2iUL/PhKhOli54/5P1y9YR1piEt/q1rxL0pjUJXT6VdnYkWpWK8INsU
 AUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fBLmvqimdOYOstdI3NQ4fPlE/gH/DfGB/jHbG4iMjSA=;
 b=T/d/m3QTRw+lS9pKpieykPX3bOfrDlNWbPsOXStOOsrWW4+edC34S9i4U7rQRKoLzt
 NKm1KsKZtQ+eLV6Tg+PyJ9TMJInuzi9Z45O0gww/IxGBo/NV1GXMAYEUg/sqKEfSmSx0
 /Hy7QMHfDh9HRhfrBifqfi00QA9mEdkvDpPSlkzkYc4yF0O1UTp8314fDcR0cdKCAD2p
 aIuxhZuka3hv1dqsgPTJOpqXhjt/JGrtg7PT2upyu1D/Y69Z0KSNo5n81D/GzMpf+NNo
 fQHfzPhILkjOT0X2YYzXp8brekYK4h4PTwtU0fG09R0gOXvIHYbygPr0pwLGtQNO67ZK
 376Q==
X-Gm-Message-State: AOAM533L72Gw4STycgUrg1HKI1jUWdEdXkbSlZHVYwIgi6HP7Aqlrgdi
 JV0W8tbtc+W6iDNPc5xXZVMArfgi/uQqyW2NpSg=
X-Google-Smtp-Source: ABdhPJx21PpY1L2ktl+gZCs40uPRE7PFJK0ztjvJCGOWs+QbkQlodXedcUMyk0/hR0PBeE4790DmTv+lucjcy7TrpxE=
X-Received: by 2002:a92:8587:: with SMTP id
 f129mr32461094ilh.251.1607924520043; 
 Sun, 13 Dec 2020 21:42:00 -0800 (PST)
MIME-Version: 1.0
References: <20201213172136.15975-1-yashsri421@gmail.com>
 <5579438a-da78-3589-923e-c7eb174412c5@gmail.com>
In-Reply-To: <5579438a-da78-3589-923e-c7eb174412c5@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 14 Dec 2020 06:41:49 +0100
Message-ID: <CAKXUXMym5OFos4y92T8wbNEGM3ttGt+vt7-KrHD1K1R8q6izOA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Sun, Dec 13, 2020 at 6:30 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 13/12/20 10:51 pm, Aditya Srivastava wrote:
> > There are certain relational expressions in atomisp where a boolean
> > variable is compared with true/false in forms such as (foo == true)
> > or (false != bar), which does not comply with the coding style rule by
> > checkpatch.pl (CHK: BOOL_COMPARISON), according to which the boolean
> > variables should be themselves used in relational expression, rather
> > than comparing with true or false.
> >
> > E.g. In drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:
> >
> > if (asd->stream_prepared == false) {
> >
> > Can be replaced with:
> > if (!asd->stream_prepared) {
> >
> > Replace such relational expressions with boolean variables appropriately.
> >
> > Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> > ---
> >  .../staging/media/atomisp/pci/atomisp_compat_css20.c |  2 +-
> >  .../atomisp/pci/runtime/isys/src/virtual_isys.c      | 12 ++++++------
> >  drivers/staging/media/atomisp/pci/sh_css.c           | 12 ++++++------
> >  3 files changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> > index faa0935e536a..6a80c676f668 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
> > @@ -1142,7 +1142,7 @@ int atomisp_css_start(struct atomisp_sub_device *asd,
> >        * Thus the stream created in set_fmt get destroyed and need to be
> >        * recreated in the next stream on.
> >        */
> > -     if (asd->stream_prepared == false) {
> > +     if (!asd->stream_prepared) {
> >               if (__create_pipes(asd)) {
> >                       dev_err(isp->dev, "create pipe error.\n");
> >                       return -EINVAL;
> > diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
> > index 317ea30ede7a..82f3c19dc455 100644
> > --- a/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
> > +++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/virtual_isys.c
> > @@ -179,12 +179,12 @@ ia_css_isys_error_t ia_css_isys_stream_create(
> >       isys_stream->linked_isys_stream_id = isys_stream_descr->linked_isys_stream_id;
> >       rc = create_input_system_input_port(isys_stream_descr,
> >                                           &isys_stream->input_port);
> > -     if (rc == false)
> > +     if (!rc)
> >               return false;
> >
> >       rc = create_input_system_channel(isys_stream_descr, false,
> >                                        &isys_stream->channel);
> > -     if (rc == false) {
> > +     if (!rc) {
> >               destroy_input_system_input_port(&isys_stream->input_port);
> >               return false;
> >       }
> > @@ -204,7 +204,7 @@ ia_css_isys_error_t ia_css_isys_stream_create(
> >       if (isys_stream_descr->metadata.enable) {
> >               rc = create_input_system_channel(isys_stream_descr, true,
> >                                                &isys_stream->md_channel);
> > -             if (rc == false) {
> > +             if (!rc) {
> >                       destroy_input_system_input_port(&isys_stream->input_port);
> >                       destroy_input_system_channel(&isys_stream->channel);
> >                       return false;
> > @@ -248,7 +248,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
> >                 isys_stream_descr,
> >                 &isys_stream_cfg->channel_cfg,
> >                 false);
> > -     if (rc == false)
> > +     if (!rc)
> >               return false;
> >
> >       /* configure metadata channel */
> > @@ -260,7 +260,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
> >                         isys_stream_descr,
> >                         &isys_stream_cfg->md_channel_cfg,
> >                         true);
> > -             if (rc == false)
> > +             if (!rc)
> >                       return false;
> >       }
> >
> > @@ -269,7 +269,7 @@ ia_css_isys_error_t ia_css_isys_stream_calculate_cfg(
> >                &isys_stream->input_port,
> >                isys_stream_descr,
> >                &isys_stream_cfg->input_port_cfg);
> > -     if (rc == false)
> > +     if (!rc)
> >               return false;
> >
> >       isys_stream->valid = 1;
> > diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> > index ddee04c8248d..a71c1bbd984b 100644
> > --- a/drivers/staging/media/atomisp/pci/sh_css.c
> > +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> > @@ -1063,7 +1063,7 @@ sh_css_config_input_network(struct ia_css_stream *stream) {
> >       ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
> >                           "sh_css_config_input_network() enter 0x%p:\n", stream);
> >
> > -     if (stream->config.continuous == true)
> > +     if (stream->config.continuous)
> >       {
> >               if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_CAPTURE) {
> >                       pipe = stream->last_pipe;
> > @@ -5626,7 +5626,7 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
> >               } else {
> >                       /* output from main binary is not yuv line. currently this is
> >                        * possible only when bci is enabled on vfpp output */
> > -                     assert(pipe->config.enable_vfpp_bci == true);
> > +                     assert(pipe->config.enable_vfpp_bci);
> >                       ia_css_pipe_get_yuvscaler_binarydesc(pipe, &vf_pp_descr,
> >                                                            &mycs->video_binary.vf_frame_info,
> >                                                            pipe_vf_out_info, NULL, NULL);
> > @@ -8072,7 +8072,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
> >               struct ia_css_frame *tmp_out_frame = NULL;
> >
> >               for (i = 0; i < num_yuv_scaler; i++) {
> > -                     if (is_output_stage[i] == true)
> > +                     if (is_output_stage[i])
> >                               tmp_out_frame = out_frame;
> >                       else
> >                               tmp_out_frame = NULL;
> > @@ -8464,7 +8464,7 @@ sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
> >       /* In QoS case, load_extension already called, so skipping */
> >       int     err = 0;
> >
> > -     if (fw->loaded == false)
> > +     if (!fw->loaded)
> >               err = acc_load_extension(fw);
> >
> >       ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
> > @@ -9701,8 +9701,8 @@ ia_css_stream_destroy(struct ia_css_stream *stream) {
> >                       assert(entry);
> >                       if (entry) {
> >                               /* get the SP thread id */
> > -                             if (ia_css_pipeline_get_sp_thread_id(
> > -                                     ia_css_pipe_get_pipe_num(entry), &sp_thread_id) != true)
> > +                             if (!ia_css_pipeline_get_sp_thread_id(
> > +                                     ia_css_pipe_get_pipe_num(entry), &sp_thread_id))
> >                                       return -EINVAL;
> >                               /* get the target input terminal */
> >                               sp_pipeline_input_terminal =
> >
>
> Hi Lukas
>
> I have tested these changes by running Makefile in the root directory,
> where I did not get any errors. Can you please review it quickly
> before I send it to maintainers?
>

Well, two things are helpful even if you do not have the hardware.

First, determine the required kernel configs so that the code you
touched is actually compiled.

Second, compile ite and compare the objdump of the created object file
before and after the change.

Other than that, the change looks good. It is probably a driver that
is on its way to removal anyway. So, do not be surprised if even if
the maintainers thinks the change generally improves the code, they
simply do not want to touch code that is soon to be deleted.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
