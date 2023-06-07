Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704EBC7EE23
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  7 Jun 2023 12:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D69ED40B70;
	Wed,  7 Jun 2023 12:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D69ED40B70
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CZ9/x+hL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzFTx_iB3wC0; Wed,  7 Jun 2023 12:25:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 304164117C;
	Wed,  7 Jun 2023 12:25:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 304164117C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C3FDC007A;
	Wed,  7 Jun 2023 12:25:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0C55C0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jun 2023 12:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BE1181E0D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jun 2023 12:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BE1181E0D
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=CZ9/x+hL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UAWVqq3vVLV2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jun 2023 12:25:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9493781DE9
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9493781DE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  7 Jun 2023 12:25:18 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-977cc662f62so613515966b.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 07 Jun 2023 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686140716; x=1688732716;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EgS72WRQx8OyNBUFH+DI6/divpeeI8sJ7wjAWLYwOx4=;
 b=CZ9/x+hLlPdoSYqRE3jay5dRiZzlMaDQwihHtKPQVl0zABG+IfHTDa5Dx/qxv4R2eI
 Dg/8ffRQf2wZdMz95P/kXeRSMHAP0mz2Ly6NWcVmtns6bkPKjlUtBd0DEKjytEXqTznC
 5aGoL7k9NVLz8NM61TZqWYpqahIh74InDtZORKM87+v6j9ImqH43ZJTq2O4jKhM3tTUk
 V00SVNMggqwscBx8SWMDWlKZmgU+mHEBl8k3RlsQrW4VPK2VzsEtzR5AbRiFBX165E3g
 9v5nscmZ2jLHgGpCXwle1DIuKQYyZktwk+E/NqADvxFn/404d8Lxi5AQ6QGbqtpT7ieB
 Mpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686140716; x=1688732716;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EgS72WRQx8OyNBUFH+DI6/divpeeI8sJ7wjAWLYwOx4=;
 b=Lm6+KpjDw5GfhDD0qDUGLT1AAKYKrHzwRaJalDzZybj6CMnqUk8zIgWxKZ2yVOe7t6
 CxhR/cBSuvfiv2x1btlklzIia5I1eR2mIrCKQJWTJRSjaMd8P6wWr6xNqF9rnZwyil8t
 kIdhBZNAITIZDRCdFgt8ekbGHIo42DKje4eK+zBPnOoAvLbhyyINAlHGvpoeQlAWJS2G
 ccIjaY6HEiuAH4Aqo/DFoquwix6iOTrIbGNpE8kZ6vTYrHKn8T7cEvWYHj4xwGABqpTK
 h5sKjBr6SoQDwFtlLzzERFPhjIVVVXefwS1Yj3j0h70Z97FMb2bsupkdU5FkU256Gyc5
 POug==
X-Gm-Message-State: AC+VfDzvDeXBa3bTzr/tbqStjIe8cM6JKqIp0fTeobQUrs6l3wXocUrp
 dmNOLEPqxT6b6ZRHYiid6g3y2BXeD4G0iwB4rZfnEFxPSXe6MA==
X-Google-Smtp-Source: ACHHUZ48nGefS794KY9hpZ0+z34IhXynihgE52KF0FyrTEJBnMWuiWPakjGVaeD0qfKJQiv7L8OH1nwU6N556PbtQRM=
X-Received: by 2002:a17:907:62a0:b0:978:8e58:e1a9 with SMTP id
 nd32-20020a17090762a000b009788e58e1a9mr110206ejc.15.1686140716082; Wed, 07
 Jun 2023 05:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.17.1686139204.22992.linux-kernel-mentees@lists.linuxfoundation.org>
In-Reply-To: <mailman.17.1686139204.22992.linux-kernel-mentees@lists.linuxfoundation.org>
From: Ankita Pareek <ankitapareek2000@gmail.com>
Date: Wed, 7 Jun 2023 17:54:57 +0530
Message-ID: <CAG+8pO5s6BoKZAwTLTiMrMesyWdcQk9xrs_r1SK6MaCarbDGsw@mail.gmail.com>
Subject: Re: Linux-kernel-mentees Digest, Vol 51, Issue 5
To: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============0751202349892829346=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0751202349892829346==
Content-Type: multipart/alternative; boundary="0000000000006c6afd05fd893a2c"

--0000000000006c6afd05fd893a2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

unsubscribe




On Wed, Jun 7, 2023 at 5:30=E2=80=AFPM <
linux-kernel-mentees-request@lists.linuxfoundation.org> wrote:

> Send Linux-kernel-mentees mailing list submissions to
>         linux-kernel-mentees@lists.linuxfoundation.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
>
> or, via email, send a message with subject or body 'help' to
>         linux-kernel-mentees-request@lists.linuxfoundation.org
>
> You can reach the person managing the list at
>         linux-kernel-mentees-owner@lists.linuxfoundation.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Linux-kernel-mentees digest..."
>
>
> Today's Topics:
>
>    1. [PATCH v4 3/3] selftests: ALSA: Add test for the 'pcmtest'
>       driver (Ivan Orlov)
>    2. Re: [PATCH v2] selftests: rtc: Improves rtctest error
>       handling. (Alexandre Belloni)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Tue,  6 Jun 2023 23:32:54 +0400
> From: Ivan Orlov <ivan.orlov0322@gmail.com>
> To: perex@perex.cz, tiwai@suse.com, corbet@lwn.net,
>         broonie@kernel.org, skhan@linuxfoundation.org
> Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
>         linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
>         linux-kernel-mentees@lists.linuxfoundation.org
> Subject: [PATCH v4 3/3] selftests: ALSA: Add test for the 'pcmtest'
>         driver
> Message-ID: <20230606193254.20791-3-ivan.orlov0322@gmail.com>
>
> This test covers the new Virtual PCM Test Driver, including the capturing=
,
> playback and ioctl redefinition functionalities for both interleaved and
> non-interleaved access modes. This test is also helpful as an usage examp=
le
> of the 'pcmtest' driver.
>
> We have a lot of different virtual media drivers, which can be used for
> testing of the userspace applications and media subsystem middle layer.
> However, all of them are aimed at testing the video functionality and
> simulating the video devices. For audio devices we have only snd-dummy
> module, which is good in simulating the correct behavior of an ALSA devic=
e.
> I decided to write a tool, which would help to test the userspace ALSA
> programs (and the PCM middle layer as well) under unusual circumstances
> to figure out how they would behave. So I came up with this Virtual PCM
> Test Driver.
>
> This new Virtual PCM Test Driver has several features which can be useful
> during the userspace ALSA applications testing/fuzzing, or testing/fuzzin=
g
> of the PCM middle layer. Not all of them can be implemented using the
> existing virtual drivers (like dummy or loopback). Here is what can this
> driver do:
>
> - Simulate both capture and playback processes
> - Generate random or pattern-based capture data
> - Check the playback stream for containing the looped pattern
> - Inject delays into the playback and capturing processes
> - Inject errors during the PCM callbacks
>
> Also, this driver can check the playback stream for containing the
> predefined pattern, which is used in the corresponding selftest to check
> the PCM middle layer data transferring functionality. Additionally, this
> driver redefines the default RESET ioctl, and the selftest covers this PC=
M
> API functionality as well.
>
> The driver supports both interleaved and non-interleaved access modes, an=
d
> have separate pattern buffers for each channel. The driver supports up to
> 4 channels and up to 8 substreams.
>
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
> V1 -> V2:
>
> - Rename the driver from from 'valsa' to 'pcmtest'.
> - Implement support for interleaved and non-interleaved access modes
> - Add support for 8 substreams and 4 channels
> - Extend supported formats
> - Extend and rewrite in C the selftest for the driver
>
> V2 -> V3:
>
> - Add separate pattern buffers for each channel
> - Speed up the capture data generation when using interleaved access mode
> - Extend the corresponding selftest to cover the multiple channels
> capturing and playback functionalities when using interleaved access mode=
.
> - Fix documentation issues
>
> V3 -> V4:
>
> - Fix issue in the selftest: there was a typo in the fscanf argument.
>
>  tools/testing/selftests/alsa/Makefile         |   2 +-
>  .../selftests/alsa/test-pcmtest-driver.c      | 333 ++++++++++++++++++
>  2 files changed, 334 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/alsa/test-pcmtest-driver.c
>
> diff --git a/tools/testing/selftests/alsa/Makefile
> b/tools/testing/selftests/alsa/Makefile
> index 901949db80ad..5af9ba8a4645 100644
> --- a/tools/testing/selftests/alsa/Makefile
> +++ b/tools/testing/selftests/alsa/Makefile
> @@ -12,7 +12,7 @@ LDLIBS+=3D-lpthread
>
>  OVERRIDE_TARGETS =3D 1
>
> -TEST_GEN_PROGS :=3D mixer-test pcm-test
> +TEST_GEN_PROGS :=3D mixer-test pcm-test test-pcmtest-driver
>
>  TEST_GEN_PROGS_EXTENDED :=3D libatest.so
>
> diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c
> b/tools/testing/selftests/alsa/test-pcmtest-driver.c
> new file mode 100644
> index 000000000000..71931b240a83
> --- /dev/null
> +++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
> @@ -0,0 +1,333 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This is the test which covers PCM middle layer data transferring usin=
g
> + * the virtual pcm test driver (snd-pcmtest).
> + *
> + * Copyright 2023 Ivan Orlov <ivan.orlov0322@gmail.com>
> + */
> +#include <string.h>
> +#include <alsa/asoundlib.h>
> +#include "../kselftest_harness.h"
> +
> +#define CH_NUM 4
> +
> +struct pattern_buf {
> +       char buf[1024];
> +       int len;
> +};
> +
> +struct pattern_buf patterns[CH_NUM];
> +
> +struct pcmtest_test_params {
> +       unsigned long buffer_size;
> +       unsigned long period_size;
> +       unsigned long channels;
> +       unsigned int rate;
> +       snd_pcm_access_t access;
> +       size_t sec_buf_len;
> +       size_t sample_size;
> +       int time;
> +       snd_pcm_format_t format;
> +};
> +
> +static int read_patterns(void)
> +{
> +       FILE *fp, *fpl;
> +       int i;
> +       char pf[64];
> +       char plf[64];
> +
> +       for (i =3D 0; i < CH_NUM; i++) {
> +               sprintf(plf,
> "/sys/kernel/debug/pcmtest/fill_pattern%d_len", i);
> +               fpl =3D fopen(plf, "r");
> +               if (!fpl)
> +                       return -1;
> +               fscanf(fpl, "%u", &patterns[i].len);
> +               fclose(fpl);
> +
> +               sprintf(pf, "/sys/kernel/debug/pcmtest/fill_pattern%d", i=
);
> +               fp =3D fopen(pf, "r");
> +               if (!fp) {
> +                       fclose(fpl);
> +                       return -1;
> +               }
> +               fread(patterns[i].buf, 1, patterns[i].len, fp);
> +               fclose(fp);
> +       }
> +
> +       return 0;
> +}
> +
> +static int get_test_results(char *debug_name)
> +{
> +       int result;
> +       FILE *f;
> +       char fname[128];
> +
> +       sprintf(fname, "/sys/kernel/debug/pcmtest/%s", debug_name);
> +
> +       f =3D fopen(fname, "r");
> +       if (!f) {
> +               printf("Failed to open file\n");
> +               return -1;
> +       }
> +       fscanf(f, "%d", &result);
> +       fclose(f);
> +
> +       return result;
> +}
> +
> +static size_t get_sec_buf_len(unsigned int rate, unsigned long channels,
> snd_pcm_format_t format)
> +{
> +       return rate * channels * snd_pcm_format_physical_width(format) / =
8;
> +}
> +
> +static int setup_handle(snd_pcm_t **handle, snd_pcm_sw_params_t *swparam=
s,
> +                       snd_pcm_hw_params_t *hwparams, struct
> pcmtest_test_params *params,
> +                       int card, snd_pcm_stream_t stream)
> +{
> +       char pcm_name[32];
> +       int err;
> +
> +       sprintf(pcm_name, "hw:%d,0,0", card);
> +       err =3D snd_pcm_open(handle, pcm_name, stream, 0);
> +       if (err < 0)
> +               return err;
> +       snd_pcm_hw_params_any(*handle, hwparams);
> +       snd_pcm_hw_params_set_rate_resample(*handle, hwparams, 0);
> +       snd_pcm_hw_params_set_access(*handle, hwparams, params->access);
> +       snd_pcm_hw_params_set_format(*handle, hwparams, params->format);
> +       snd_pcm_hw_params_set_channels(*handle, hwparams,
> params->channels);
> +       snd_pcm_hw_params_set_rate_near(*handle, hwparams, &params->rate,
> 0);
> +       snd_pcm_hw_params_set_period_size_near(*handle, hwparams,
> &params->period_size, 0);
> +       snd_pcm_hw_params_set_buffer_size_near(*handle, hwparams,
> &params->buffer_size);
> +       snd_pcm_hw_params(*handle, hwparams);
> +       snd_pcm_sw_params_current(*handle, swparams);
> +
> +       snd_pcm_hw_params_set_rate_resample(*handle, hwparams, 0);
> +       snd_pcm_sw_params_set_avail_min(*handle, swparams,
> params->period_size);
> +       snd_pcm_hw_params_set_buffer_size_near(*handle, hwparams,
> &params->buffer_size);
> +       snd_pcm_hw_params_set_period_size_near(*handle, hwparams,
> &params->period_size, 0);
> +       snd_pcm_sw_params(*handle, swparams);
> +       snd_pcm_hw_params(*handle, hwparams);
> +
> +       return 0;
> +}
> +
> +FIXTURE(pcmtest) {
> +       int card;
> +       snd_pcm_sw_params_t *swparams;
> +       snd_pcm_hw_params_t *hwparams;
> +       struct pcmtest_test_params params;
> +};
> +
> +FIXTURE_TEARDOWN(pcmtest) {
> +}
> +
> +FIXTURE_SETUP(pcmtest) {
> +       char *card_name;
> +       int err;
> +
> +       if (geteuid())
> +               SKIP(exit(-1), "This test needs root to run!");
> +
> +       err =3D read_patterns();
> +       if (err)
> +               SKIP(exit(-1), "Can't read patterns. Probably, module
> isn't loaded");
> +
> +       card_name =3D malloc(127);
> +       ASSERT_NE(card_name, NULL);
> +       self->params.buffer_size =3D 16384;
> +       self->params.period_size =3D 4096;
> +       self->params.channels =3D CH_NUM;
> +       self->params.rate =3D 8000;
> +       self->params.access =3D SND_PCM_ACCESS_RW_INTERLEAVED;
> +       self->params.format =3D SND_PCM_FORMAT_S16_LE;
> +       self->card =3D -1;
> +       self->params.sample_size =3D
> snd_pcm_format_physical_width(self->params.format) / 8;
> +
> +       self->params.sec_buf_len =3D get_sec_buf_len(self->params.rate,
> self->params.channels,
> +                                                  self->params.format);
> +       self->params.time =3D 4;
> +
> +       while (snd_card_next(&self->card) >=3D 0) {
> +               if (self->card =3D=3D -1)
> +                       break;
> +               snd_card_get_name(self->card, &card_name);
> +               if (!strcmp(card_name, "PCM-Test"))
> +                       break;
> +       }
> +       free(card_name);
> +       ASSERT_NE(self->card, -1);
> +}
> +
> +/*
> + * Here we are trying to send the looped monotonically increasing
> sequence of bytes to the driver.
> + * If our data isn't corrupted, the driver will set the content of
> 'pc_test' debugfs file to '1'
> + */
> +TEST_F(pcmtest, playback) {
> +       snd_pcm_t *handle;
> +       unsigned char *it;
> +       size_t write_res;
> +       int test_results;
> +       int i, cur_ch, pos_in_ch;
> +       void *samples;
> +       struct pcmtest_test_params *params =3D &self->params;
> +
> +       samples =3D calloc(self->params.sec_buf_len * self->params.time, =
1);
> +       ASSERT_NE(samples, NULL);
> +
> +       snd_pcm_sw_params_alloca(&self->swparams);
> +       snd_pcm_hw_params_alloca(&self->hwparams);
> +
> +       ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams,
> params,
> +                              self->card, SND_PCM_STREAM_PLAYBACK), 0);
> +       snd_pcm_format_set_silence(params->format, samples,
> +                                  params->rate * params->channels *
> params->time);
> +       it =3D samples;
> +       for (i =3D 0; i < self->params.sec_buf_len * params->time; i++) {
> +               cur_ch =3D (i / params->sample_size) % CH_NUM;
> +               pos_in_ch =3D i / params->sample_size / CH_NUM *
> params->sample_size
> +                           + (i % params->sample_size);
> +               it[i] =3D patterns[cur_ch].buf[pos_in_ch %
> patterns[cur_ch].len];
> +       }
> +       write_res =3D snd_pcm_writei(handle, samples, params->rate *
> params->time);
> +       ASSERT_GE(write_res, 0);
> +
> +       snd_pcm_close(handle);
> +       free(samples);
> +       test_results =3D get_test_results("pc_test");
> +       ASSERT_EQ(test_results, 1);
> +}
> +
> +/*
> + * Here we test that the virtual alsa driver returns looped and
> monotonically increasing sequence
> + * of bytes. In the interleaved mode the buffer will contain samples in
> the following order:
> + * C0, C1, C2, C3, C0, C1, ...
> + */
> +TEST_F(pcmtest, capture) {
> +       snd_pcm_t *handle;
> +       unsigned char *it;
> +       size_t read_res;
> +       int i, cur_ch, pos_in_ch;
> +       void *samples;
> +       struct pcmtest_test_params *params =3D &self->params;
> +
> +       samples =3D calloc(self->params.sec_buf_len * self->params.time, =
1);
> +       ASSERT_NE(samples, NULL);
> +
> +       snd_pcm_sw_params_alloca(&self->swparams);
> +       snd_pcm_hw_params_alloca(&self->hwparams);
> +
> +       ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams,
> +                              params, self->card,
> SND_PCM_STREAM_CAPTURE), 0);
> +       snd_pcm_format_set_silence(params->format, samples,
> +                                  params->rate * params->channels *
> params->time);
> +       read_res =3D snd_pcm_readi(handle, samples, params->rate *
> params->time);
> +       ASSERT_GE(read_res, 0);
> +       snd_pcm_close(handle);
> +       it =3D (unsigned char *)samples;
> +       for (i =3D 0; i < self->params.sec_buf_len * self->params.time; i=
++)
> {
> +               cur_ch =3D (i / params->sample_size) % CH_NUM;
> +               pos_in_ch =3D i / params->sample_size / CH_NUM *
> params->sample_size
> +                           + (i % params->sample_size);
> +               ASSERT_EQ(it[i], patterns[cur_ch].buf[pos_in_ch %
> patterns[cur_ch].len]);
> +       }
> +       free(samples);
> +}
> +
> +// Test capture in the non-interleaved access mode. The are buffers for
> each recorded channel
> +TEST_F(pcmtest, ni_capture) {
> +       snd_pcm_t *handle;
> +       struct pcmtest_test_params params =3D self->params;
> +       char **chan_samples;
> +       size_t i, j, read_res;
> +
> +       chan_samples =3D calloc(CH_NUM, sizeof(*chan_samples));
> +       ASSERT_NE(chan_samples, NULL);
> +
> +       snd_pcm_sw_params_alloca(&self->swparams);
> +       snd_pcm_hw_params_alloca(&self->hwparams);
> +
> +       params.access =3D SND_PCM_ACCESS_RW_NONINTERLEAVED;
> +
> +       ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams,
> +                              &params, self->card,
> SND_PCM_STREAM_CAPTURE), 0);
> +
> +       for (i =3D 0; i < CH_NUM; i++)
> +               chan_samples[i] =3D calloc(params.sec_buf_len * params.ti=
me,
> 1);
> +
> +       for (i =3D 0; i < 1; i++) {
> +               read_res =3D snd_pcm_readn(handle, (void **)chan_samples,
> params.rate * params.time);
> +               ASSERT_GE(read_res, 0);
> +       }
> +       snd_pcm_close(handle);
> +
> +       for (i =3D 0; i < CH_NUM; i++) {
> +               for (j =3D 0; j < params.rate * params.time; j++)
> +                       ASSERT_EQ(chan_samples[i][j], patterns[i].buf[j %
> patterns[i].len]);
> +               free(chan_samples[i]);
> +       }
> +       free(chan_samples);
> +}
> +
> +TEST_F(pcmtest, ni_playback) {
> +       snd_pcm_t *handle;
> +       struct pcmtest_test_params params =3D self->params;
> +       char **chan_samples;
> +       size_t i, j, read_res;
> +       int test_res;
> +
> +       chan_samples =3D calloc(CH_NUM, sizeof(*chan_samples));
> +       ASSERT_NE(chan_samples, NULL);
> +
> +       snd_pcm_sw_params_alloca(&self->swparams);
> +       snd_pcm_hw_params_alloca(&self->hwparams);
> +
> +       params.access =3D SND_PCM_ACCESS_RW_NONINTERLEAVED;
> +
> +       ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams,
> +                              &params, self->card,
> SND_PCM_STREAM_PLAYBACK), 0);
> +
> +       for (i =3D 0; i < CH_NUM; i++) {
> +               chan_samples[i] =3D calloc(params.sec_buf_len * params.ti=
me,
> 1);
> +               for (j =3D 0; j < params.sec_buf_len * params.time; j++)
> +                       chan_samples[i][j] =3D patterns[i].buf[j %
> patterns[i].len];
> +       }
> +
> +       for (i =3D 0; i < 1; i++) {
> +               read_res =3D snd_pcm_writen(handle, (void **)chan_samples=
,
> params.rate * params.time);
> +               ASSERT_GE(read_res, 0);
> +       }
> +
> +       snd_pcm_close(handle);
> +       test_res =3D get_test_results("pc_test");
> +       ASSERT_EQ(test_res, 1);
> +
> +       for (i =3D 0; i < CH_NUM; i++)
> +               free(chan_samples[i]);
> +       free(chan_samples);
> +}
> +
> +/*
> + * Here we are testing the custom ioctl definition inside the virtual
> driver. If it triggers
> + * successfully, the driver sets the content of 'ioctl_test' debugfs fil=
e
> to '1'.
> + */
> +TEST_F(pcmtest, reset_ioctl) {
> +       snd_pcm_t *handle;
> +       unsigned char *it;
> +       int test_res;
> +       struct pcmtest_test_params *params =3D &self->params;
> +
> +       snd_pcm_sw_params_alloca(&self->swparams);
> +       snd_pcm_hw_params_alloca(&self->hwparams);
> +
> +       ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams,
> params,
> +                              self->card, SND_PCM_STREAM_CAPTURE), 0);
> +       snd_pcm_reset(handle);
> +       test_res =3D get_test_results("ioctl_test");
> +       ASSERT_EQ(test_res, 1);
> +       snd_pcm_close(handle);
> +}
> +
> +TEST_HARNESS_MAIN
> --
> 2.34.1
>
>
>
> ------------------------------
>
> Message: 2
> Date: Tue, 6 Jun 2023 23:50:19 +0200
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> To: Atul Kumar Pant <atulpant.linux@gmail.com>
> Cc: a.zummo@towertech.it, shuah@kernel.org,
>         linux-kernel-mentees@lists.linuxfoundation.org
> Subject: Re: [PATCH v2] selftests: rtc: Improves rtctest error
>         handling.
> Message-ID: <20230606215019b362e348@mail.local>
> Content-Type: text/plain; charset=3Dus-ascii
>
> On 29/04/2023 12:19:17+0530, Atul Kumar Pant wrote:
> > When running the rtctest if we pass wrong rtc device file as an argumen=
t
> > the test fails expectedly, but prints the logs that are not useful
> > to point out the issue.
> > To handle this, the patch adds a checks to verify if the rtc_file is
> valid.
> >
> > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > ---
> >
> > changes since v1:
> >     Removed check for uid=3D0
> >     If rtc file is invalid, then exit the test.
> >
> >  tools/testing/selftests/rtc/rtctest.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/rtc/rtctest.c
> b/tools/testing/selftests/rtc/rtctest.c
> > index 2b9d929a24ed..07f7dcd47102 100644
> > --- a/tools/testing/selftests/rtc/rtctest.c
> > +++ b/tools/testing/selftests/rtc/rtctest.c
> > @@ -17,6 +17,7 @@
> >  #include <unistd.h>
> >
> >  #include "../kselftest_harness.h"
> > +#include "../kselftest.h"
> >
> >  #define NUM_UIE 3
> >  #define ALARM_DELTA 3
> > @@ -388,6 +389,8 @@ __constructor_order_last(void)
> >
> >  int main(int argc, char **argv)
> >  {
> > +     int ret =3D -1;
> > +
> >       switch (argc) {
> >       case 2:
> >               rtc_file =3D argv[1];
> > @@ -399,5 +402,11 @@ int main(int argc, char **argv)
> >               return 1;
> >       }
> >
> > -     return test_harness_run(argc, argv);
> > +     // Run the test if rtc_file is valid
>
> if access to rtc_file is valid
>
> > +     if (access(rtc_file, F_OK) =3D=3D 0)
> > +             ret =3D test_harness_run(argc, argv);
> > +     else
> > +             ksft_exit_fail_msg("[ERROR]: %s : File does not exists -
> Exiting\n", rtc_file);
>
> It doesn't necessarily means the file does not exist but that you don't
> have access to it.
>
> > +
> > +     return ret;
> >  }
> > --
> > 2.25.1
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> ------------------------------
>
> Subject: Digest Footer
>
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
>
>
> ------------------------------
>
> End of Linux-kernel-mentees Digest, Vol 51, Issue 5
> ***************************************************
>

--0000000000006c6afd05fd893a2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">unsubscribe<br><br><br><br></div><br><img=
 width=3D"0" height=3D"0" class=3D"mailtrack-img" alt=3D"" style=3D"display=
:flex" src=3D"https://mailtrack.io/trace/mail/c6b1cb2cd859a46c29e635002e89b=
25fe61d6796.png?u=3D6996257"><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, Jun 7, 2023 at 5:30=E2=80=AFPM &lt;<a href=3D"ma=
ilto:linux-kernel-mentees-request@lists.linuxfoundation.org">linux-kernel-m=
entees-request@lists.linuxfoundation.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Send Linux-kernel-mentees mailing l=
ist submissions to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel-mentees@lists.li=
nuxfoundation.org" target=3D"_blank">linux-kernel-mentees@lists.linuxfounda=
tion.org</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lists.linuxfoundation.org/ma=
ilman/listinfo/linux-kernel-mentees" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees</a><=
br>
<br>
or, via email, send a message with subject or body &#39;help&#39; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel-mentees-request@=
lists.linuxfoundation.org" target=3D"_blank">linux-kernel-mentees-request@l=
ists.linuxfoundation.org</a><br>
<br>
You can reach the person managing the list at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel-mentees-owner@li=
sts.linuxfoundation.org" target=3D"_blank">linux-kernel-mentees-owner@lists=
.linuxfoundation.org</a><br>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of Linux-kernel-mentees digest...&quot;<br>
<br>
<br>
Today&#39;s Topics:<br>
<br>
=C2=A0 =C2=A01. [PATCH v4 3/3] selftests: ALSA: Add test for the &#39;pcmte=
st&#39;<br>
=C2=A0 =C2=A0 =C2=A0 driver (Ivan Orlov)<br>
=C2=A0 =C2=A02. Re: [PATCH v2] selftests: rtc: Improves rtctest error<br>
=C2=A0 =C2=A0 =C2=A0 handling. (Alexandre Belloni)<br>
<br>
<br>
----------------------------------------------------------------------<br>
<br>
Message: 1<br>
Date: Tue,=C2=A0 6 Jun 2023 23:32:54 +0400<br>
From: Ivan Orlov &lt;<a href=3D"mailto:ivan.orlov0322@gmail.com" target=3D"=
_blank">ivan.orlov0322@gmail.com</a>&gt;<br>
To: <a href=3D"mailto:perex@perex.cz" target=3D"_blank">perex@perex.cz</a>,=
 <a href=3D"mailto:tiwai@suse.com" target=3D"_blank">tiwai@suse.com</a>, <a=
 href=3D"mailto:corbet@lwn.net" target=3D"_blank">corbet@lwn.net</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:broonie@kernel.org" target=3D=
"_blank">broonie@kernel.org</a>, <a href=3D"mailto:skhan@linuxfoundation.or=
g" target=3D"_blank">skhan@linuxfoundation.org</a><br>
Cc: <a href=3D"mailto:alsa-devel@alsa-project.org" target=3D"_blank">alsa-d=
evel@alsa-project.org</a>, <a href=3D"mailto:linux-doc@vger.kernel.org" tar=
get=3D"_blank">linux-doc@vger.kernel.org</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel@vger.kernel.org"=
 target=3D"_blank">linux-kernel@vger.kernel.org</a>, <a href=3D"mailto:linu=
x-kselftest@vger.kernel.org" target=3D"_blank">linux-kselftest@vger.kernel.=
org</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel-mentees@lists.li=
nuxfoundation.org" target=3D"_blank">linux-kernel-mentees@lists.linuxfounda=
tion.org</a><br>
Subject: [PATCH v4 3/3] selftests: ALSA: Add test for the &#39;pcmtest&#39;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 driver<br>
Message-ID: &lt;<a href=3D"mailto:20230606193254.20791-3-ivan.orlov0322@gma=
il.com" target=3D"_blank">20230606193254.20791-3-ivan.orlov0322@gmail.com</=
a>&gt;<br>
<br>
This test covers the new Virtual PCM Test Driver, including the capturing,<=
br>
playback and ioctl redefinition functionalities for both interleaved and<br=
>
non-interleaved access modes. This test is also helpful as an usage example=
<br>
of the &#39;pcmtest&#39; driver.<br>
<br>
We have a lot of different virtual media drivers, which can be used for<br>
testing of the userspace applications and media subsystem middle layer.<br>
However, all of them are aimed at testing the video functionality and<br>
simulating the video devices. For audio devices we have only snd-dummy<br>
module, which is good in simulating the correct behavior of an ALSA device.=
<br>
I decided to write a tool, which would help to test the userspace ALSA<br>
programs (and the PCM middle layer as well) under unusual circumstances<br>
to figure out how they would behave. So I came up with this Virtual PCM<br>
Test Driver.<br>
<br>
This new Virtual PCM Test Driver has several features which can be useful<b=
r>
during the userspace ALSA applications testing/fuzzing, or testing/fuzzing<=
br>
of the PCM middle layer. Not all of them can be implemented using the<br>
existing virtual drivers (like dummy or loopback). Here is what can this<br=
>
driver do:<br>
<br>
- Simulate both capture and playback processes<br>
- Generate random or pattern-based capture data<br>
- Check the playback stream for containing the looped pattern<br>
- Inject delays into the playback and capturing processes<br>
- Inject errors during the PCM callbacks<br>
<br>
Also, this driver can check the playback stream for containing the<br>
predefined pattern, which is used in the corresponding selftest to check<br=
>
the PCM middle layer data transferring functionality. Additionally, this<br=
>
driver redefines the default RESET ioctl, and the selftest covers this PCM<=
br>
API functionality as well.<br>
<br>
The driver supports both interleaved and non-interleaved access modes, and<=
br>
have separate pattern buffers for each channel. The driver supports up to<b=
r>
4 channels and up to 8 substreams.<br>
<br>
Signed-off-by: Ivan Orlov &lt;<a href=3D"mailto:ivan.orlov0322@gmail.com" t=
arget=3D"_blank">ivan.orlov0322@gmail.com</a>&gt;<br>
---<br>
V1 -&gt; V2:<br>
<br>
- Rename the driver from from &#39;valsa&#39; to &#39;pcmtest&#39;.<br>
- Implement support for interleaved and non-interleaved access modes<br>
- Add support for 8 substreams and 4 channels<br>
- Extend supported formats<br>
- Extend and rewrite in C the selftest for the driver<br>
<br>
V2 -&gt; V3:<br>
<br>
- Add separate pattern buffers for each channel<br>
- Speed up the capture data generation when using interleaved access mode<b=
r>
- Extend the corresponding selftest to cover the multiple channels<br>
capturing and playback functionalities when using interleaved access mode.<=
br>
- Fix documentation issues<br>
<br>
V3 -&gt; V4:<br>
<br>
- Fix issue in the selftest: there was a typo in the fscanf argument.<br>
<br>
=C2=A0tools/testing/selftests/alsa/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../selftests/alsa/test-pcmtest-driver.c=C2=A0 =C2=A0 =C2=A0 | 333 ++=
++++++++++++++++<br>
=C2=A02 files changed, 334 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 tools/testing/selftests/alsa/test-pcmtest-driver.c=
<br>
<br>
diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftest=
s/alsa/Makefile<br>
index 901949db80ad..5af9ba8a4645 100644<br>
--- a/tools/testing/selftests/alsa/Makefile<br>
+++ b/tools/testing/selftests/alsa/Makefile<br>
@@ -12,7 +12,7 @@ LDLIBS+=3D-lpthread<br>
<br>
=C2=A0OVERRIDE_TARGETS =3D 1<br>
<br>
-TEST_GEN_PROGS :=3D mixer-test pcm-test<br>
+TEST_GEN_PROGS :=3D mixer-test pcm-test test-pcmtest-driver<br>
<br>
=C2=A0TEST_GEN_PROGS_EXTENDED :=3D libatest.so<br>
<br>
diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/tes=
ting/selftests/alsa/test-pcmtest-driver.c<br>
new file mode 100644<br>
index 000000000000..71931b240a83<br>
--- /dev/null<br>
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c<br>
@@ -0,0 +1,333 @@<br>
+// SPDX-License-Identifier: GPL-2.0<br>
+/*<br>
+ * This is the test which covers PCM middle layer data transferring using<=
br>
+ * the virtual pcm test driver (snd-pcmtest).<br>
+ *<br>
+ * Copyright 2023 Ivan Orlov &lt;<a href=3D"mailto:ivan.orlov0322@gmail.co=
m" target=3D"_blank">ivan.orlov0322@gmail.com</a>&gt;<br>
+ */<br>
+#include &lt;string.h&gt;<br>
+#include &lt;alsa/asoundlib.h&gt;<br>
+#include &quot;../kselftest_harness.h&quot;<br>
+<br>
+#define CH_NUM 4<br>
+<br>
+struct pattern_buf {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[1024];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int len;<br>
+};<br>
+<br>
+struct pattern_buf patterns[CH_NUM];<br>
+<br>
+struct pcmtest_test_params {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long buffer_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long period_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long channels;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int rate;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_access_t access;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t sec_buf_len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t sample_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int time;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_format_t format;<br>
+};<br>
+<br>
+static int read_patterns(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0FILE *fp, *fpl;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char pf[64];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char plf[64];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; CH_NUM; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(plf, &quot;=
/sys/kernel/debug/pcmtest/fill_pattern%d_len&quot;, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fpl =3D fopen(plf, =
&quot;r&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fpl)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fscanf(fpl, &quot;%=
u&quot;, &amp;patterns[i].len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(fpl);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(pf, &quot;/=
sys/kernel/debug/pcmtest/fill_pattern%d&quot;, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fp =3D fopen(pf, &q=
uot;r&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fclose(fpl);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fread(patterns[i].b=
uf, 1, patterns[i].len, fp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(fp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int get_test_results(char *debug_name)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int result;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0FILE *f;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char fname[128];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(fname, &quot;/sys/kernel/debug/pcmtest/=
%s&quot;, debug_name);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D fopen(fname, &quot;r&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!f) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Failed=
 to open file\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fscanf(f, &quot;%d&quot;, &amp;result);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(f);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return result;<br>
+}<br>
+<br>
+static size_t get_sec_buf_len(unsigned int rate, unsigned long channels, s=
nd_pcm_format_t format)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return rate * channels * snd_pcm_format_physica=
l_width(format) / 8;<br>
+}<br>
+<br>
+static int setup_handle(snd_pcm_t **handle, snd_pcm_sw_params_t *swparams,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0snd_pcm_hw_params_t *hwparams, struct pcmtest_test_params *params=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int card, snd_pcm_stream_t stream)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char pcm_name[32];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sprintf(pcm_name, &quot;hw:%d,0,0&quot;, card);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D snd_pcm_open(handle, pcm_name, stream, =
0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_any(*handle, hwparams);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_set_rate_resample(*handle, hw=
params, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_set_access(*handle, hwparams,=
 params-&gt;access);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_set_format(*handle, hwparams,=
 params-&gt;format);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_set_channels(*handle, hwparam=
s, params-&gt;channels);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_set_rate_near(*handle, hwpara=
ms, &amp;params-&gt;rate, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_set_period_size_near(*handle,=
 hwparams, &amp;params-&gt;period_size, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_set_buffer_size_near(*handle,=
 hwparams, &amp;params-&gt;buffer_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params(*handle, hwparams);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_sw_params_current(*handle, swparams);<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_set_rate_resample(*handle, hw=
params, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_sw_params_set_avail_min(*handle, swpara=
ms, params-&gt;period_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_set_buffer_size_near(*handle,=
 hwparams, &amp;params-&gt;buffer_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_set_period_size_near(*handle,=
 hwparams, &amp;params-&gt;period_size, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_sw_params(*handle, swparams);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params(*handle, hwparams);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+FIXTURE(pcmtest) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int card;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_sw_params_t *swparams;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_t *hwparams;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcmtest_test_params params;<br>
+};<br>
+<br>
+FIXTURE_TEARDOWN(pcmtest) {<br>
+}<br>
+<br>
+FIXTURE_SETUP(pcmtest) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char *card_name;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (geteuid())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SKIP(exit(-1), &quo=
t;This test needs root to run!&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D read_patterns();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SKIP(exit(-1), &quo=
t;Can&#39;t read patterns. Probably, module isn&#39;t loaded&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0card_name =3D malloc(127);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_NE(card_name, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;params.buffer_size =3D 16384;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;params.period_size =3D 4096;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;params.channels =3D CH_NUM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;params.rate =3D 8000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;params.access =3D SND_PCM_ACCESS_RW_IN=
TERLEAVED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;params.format =3D SND_PCM_FORMAT_S16_L=
E;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;card =3D -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;params.sample_size =3D snd_pcm_format_=
physical_width(self-&gt;params.format) / 8;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;params.sec_buf_len =3D get_sec_buf_len=
(self-&gt;params.rate, self-&gt;params.channels,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 self-&gt;params.format);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;params.time =3D 4;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (snd_card_next(&amp;self-&gt;card) &gt;=
=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (self-&gt;card =
=3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snd_card_get_name(s=
elf-&gt;card, &amp;card_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp(card_na=
me, &quot;PCM-Test&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(card_name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_NE(self-&gt;card, -1);<br>
+}<br>
+<br>
+/*<br>
+ * Here we are trying to send the looped monotonically increasing sequence=
 of bytes to the driver.<br>
+ * If our data isn&#39;t corrupted, the driver will set the content of &#3=
9;pc_test&#39; debugfs file to &#39;1&#39;<br>
+ */<br>
+TEST_F(pcmtest, playback) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_t *handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *it;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t write_res;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int test_results;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, cur_ch, pos_in_ch;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void *samples;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcmtest_test_params *params =3D &amp;sel=
f-&gt;params;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0samples =3D calloc(self-&gt;params.sec_buf_len =
* self-&gt;params.time, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_NE(samples, NULL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_sw_params_alloca(&amp;self-&gt;swparams=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_alloca(&amp;self-&gt;hwparams=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_EQ(setup_handle(&amp;handle, self-&gt;sw=
params, self-&gt;hwparams, params,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self-&gt;card, SND_PCM_STREAM_PLAYBACK), 0)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_format_set_silence(params-&gt;format, s=
amples,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params-&gt;rate * params-&gt;=
channels * params-&gt;time);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0it =3D samples;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; self-&gt;params.sec_buf_le=
n * params-&gt;time; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cur_ch =3D (i / par=
ams-&gt;sample_size) % CH_NUM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pos_in_ch =3D i / p=
arams-&gt;sample_size / CH_NUM * params-&gt;sample_size<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0+ (i % params-&gt;sample_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0it[i] =3D patterns[=
cur_ch].buf[pos_in_ch % patterns[cur_ch].len];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0write_res =3D snd_pcm_writei(handle, samples, p=
arams-&gt;rate * params-&gt;time);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_GE(write_res, 0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_close(handle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(samples);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_results =3D get_test_results(&quot;pc_test=
&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_EQ(test_results, 1);<br>
+}<br>
+<br>
+/*<br>
+ * Here we test that the virtual alsa driver returns looped and monotonica=
lly increasing sequence<br>
+ * of bytes. In the interleaved mode the buffer will contain samples in th=
e following order:<br>
+ * C0, C1, C2, C3, C0, C1, ...<br>
+ */<br>
+TEST_F(pcmtest, capture) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_t *handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *it;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t read_res;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, cur_ch, pos_in_ch;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void *samples;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcmtest_test_params *params =3D &amp;sel=
f-&gt;params;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0samples =3D calloc(self-&gt;params.sec_buf_len =
* self-&gt;params.time, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_NE(samples, NULL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_sw_params_alloca(&amp;self-&gt;swparams=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_alloca(&amp;self-&gt;hwparams=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_EQ(setup_handle(&amp;handle, self-&gt;sw=
params, self-&gt;hwparams,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params, self-&gt;card, SND_PCM_STREAM_CAPTU=
RE), 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_format_set_silence(params-&gt;format, s=
amples,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params-&gt;rate * params-&gt;=
channels * params-&gt;time);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0read_res =3D snd_pcm_readi(handle, samples, par=
ams-&gt;rate * params-&gt;time);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_GE(read_res, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_close(handle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0it =3D (unsigned char *)samples;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; self-&gt;params.sec_buf_le=
n * self-&gt;params.time; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cur_ch =3D (i / par=
ams-&gt;sample_size) % CH_NUM;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pos_in_ch =3D i / p=
arams-&gt;sample_size / CH_NUM * params-&gt;sample_size<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0+ (i % params-&gt;sample_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_EQ(it[i], pa=
tterns[cur_ch].buf[pos_in_ch % patterns[cur_ch].len]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(samples);<br>
+}<br>
+<br>
+// Test capture in the non-interleaved access mode. The are buffers for ea=
ch recorded channel<br>
+TEST_F(pcmtest, ni_capture) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_t *handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcmtest_test_params params =3D self-&gt;=
params;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char **chan_samples;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t i, j, read_res;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chan_samples =3D calloc(CH_NUM, sizeof(*chan_sa=
mples));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_NE(chan_samples, NULL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_sw_params_alloca(&amp;self-&gt;swparams=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_alloca(&amp;self-&gt;hwparams=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0params.access =3D SND_PCM_ACCESS_RW_NONINTERLEA=
VED;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_EQ(setup_handle(&amp;handle, self-&gt;sw=
params, self-&gt;hwparams,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;params, self-&gt;card, SND_PCM_STREAM_=
CAPTURE), 0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; CH_NUM; i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chan_samples[i] =3D=
 calloc(params.sec_buf_len * params.time, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 1; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read_res =3D snd_pc=
m_readn(handle, (void **)chan_samples, params.rate * params.time);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_GE(read_res,=
 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_close(handle);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; CH_NUM; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j &lt=
; params.rate * params.time; j++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ASSERT_EQ(chan_samples[i][j], patterns[i].buf[j % patterns[i].len=
]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(chan_samples[i=
]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(chan_samples);<br>
+}<br>
+<br>
+TEST_F(pcmtest, ni_playback) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_t *handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcmtest_test_params params =3D self-&gt;=
params;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char **chan_samples;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t i, j, read_res;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int test_res;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chan_samples =3D calloc(CH_NUM, sizeof(*chan_sa=
mples));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_NE(chan_samples, NULL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_sw_params_alloca(&amp;self-&gt;swparams=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_alloca(&amp;self-&gt;hwparams=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0params.access =3D SND_PCM_ACCESS_RW_NONINTERLEA=
VED;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_EQ(setup_handle(&amp;handle, self-&gt;sw=
params, self-&gt;hwparams,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;params, self-&gt;card, SND_PCM_STREAM_=
PLAYBACK), 0);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; CH_NUM; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chan_samples[i] =3D=
 calloc(params.sec_buf_len * params.time, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; j &lt=
; params.sec_buf_len * params.time; j++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0chan_samples[i][j] =3D patterns[i].buf[j % patterns[i].len];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 1; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read_res =3D snd_pc=
m_writen(handle, (void **)chan_samples, params.rate * params.time);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_GE(read_res,=
 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_close(handle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_res =3D get_test_results(&quot;pc_test&quo=
t;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_EQ(test_res, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; CH_NUM; i++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(chan_samples[i=
]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0free(chan_samples);<br>
+}<br>
+<br>
+/*<br>
+ * Here we are testing the custom ioctl definition inside the virtual driv=
er. If it triggers<br>
+ * successfully, the driver sets the content of &#39;ioctl_test&#39; debug=
fs file to &#39;1&#39;.<br>
+ */<br>
+TEST_F(pcmtest, reset_ioctl) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_t *handle;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *it;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int test_res;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pcmtest_test_params *params =3D &amp;sel=
f-&gt;params;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_sw_params_alloca(&amp;self-&gt;swparams=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_hw_params_alloca(&amp;self-&gt;hwparams=
);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_EQ(setup_handle(&amp;handle, self-&gt;sw=
params, self-&gt;hwparams, params,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self-&gt;card, SND_PCM_STREAM_CAPTURE), 0);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_reset(handle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0test_res =3D get_test_results(&quot;ioctl_test&=
quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ASSERT_EQ(test_res, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_pcm_close(handle);<br>
+}<br>
+<br>
+TEST_HARNESS_MAIN<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Tue, 6 Jun 2023 23:50:19 +0200<br>
From: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com=
" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
To: Atul Kumar Pant &lt;<a href=3D"mailto:atulpant.linux@gmail.com" target=
=3D"_blank">atulpant.linux@gmail.com</a>&gt;<br>
Cc: <a href=3D"mailto:a.zummo@towertech.it" target=3D"_blank">a.zummo@tower=
tech.it</a>, <a href=3D"mailto:shuah@kernel.org" target=3D"_blank">shuah@ke=
rnel.org</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:linux-kernel-mentees@lists.li=
nuxfoundation.org" target=3D"_blank">linux-kernel-mentees@lists.linuxfounda=
tion.org</a><br>
Subject: Re: [PATCH v2] selftests: rtc: Improves rtctest error<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 handling.<br>
Message-ID: &lt;20230606215019b362e348@mail.local&gt;<br>
Content-Type: text/plain; charset=3Dus-ascii<br>
<br>
On 29/04/2023 12:19:17+0530, Atul Kumar Pant wrote:<br>
&gt; When running the rtctest if we pass wrong rtc device file as an argume=
nt<br>
&gt; the test fails expectedly, but prints the logs that are not useful<br>
&gt; to point out the issue.<br>
&gt; To handle this, the patch adds a checks to verify if the rtc_file is v=
alid.<br>
&gt; <br>
&gt; Signed-off-by: Atul Kumar Pant &lt;<a href=3D"mailto:atulpant.linux@gm=
ail.com" target=3D"_blank">atulpant.linux@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; changes since v1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0Removed check for uid=3D0<br>
&gt;=C2=A0 =C2=A0 =C2=A0If rtc file is invalid, then exit the test.<br>
&gt; <br>
&gt;=C2=A0 tools/testing/selftests/rtc/rtctest.c | 11 ++++++++++-<br>
&gt;=C2=A0 1 file changed, 10 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/sel=
ftests/rtc/rtctest.c<br>
&gt; index 2b9d929a24ed..07f7dcd47102 100644<br>
&gt; --- a/tools/testing/selftests/rtc/rtctest.c<br>
&gt; +++ b/tools/testing/selftests/rtc/rtctest.c<br>
&gt; @@ -17,6 +17,7 @@<br>
&gt;=C2=A0 #include &lt;unistd.h&gt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &quot;../kselftest_harness.h&quot;<br>
&gt; +#include &quot;../kselftest.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define NUM_UIE 3<br>
&gt;=C2=A0 #define ALARM_DELTA 3<br>
&gt; @@ -388,6 +389,8 @@ __constructor_order_last(void)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 int main(int argc, char **argv)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret =3D -1;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (argc) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case 2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc_file =3D arg=
v[1];<br>
&gt; @@ -399,5 +402,11 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0return test_harness_run(argc, argv);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// Run the test if rtc_file is valid<br>
<br>
if access to rtc_file is valid<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (access(rtc_file, F_OK) =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D test_harness_=
run(argc, argv);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ksft_exit_fail_msg(&q=
uot;[ERROR]: %s : File does not exists - Exiting\n&quot;, rtc_file);<br>
<br>
It doesn&#39;t necessarily means the file does not exist but that you don&#=
39;t<br>
have access to it.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 }<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
------------------------------<br>
<br>
Subject: Digest Footer<br>
<br>
_______________________________________________<br>
Linux-kernel-mentees mailing list<br>
<a href=3D"mailto:Linux-kernel-mentees@lists.linuxfoundation.org" target=3D=
"_blank">Linux-kernel-mentees@lists.linuxfoundation.org</a><br>
<a href=3D"https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-=
mentees" rel=3D"noreferrer" target=3D"_blank">https://lists.linuxfoundation=
.org/mailman/listinfo/linux-kernel-mentees</a><br>
<br>
<br>
------------------------------<br>
<br>
End of Linux-kernel-mentees Digest, Vol 51, Issue 5<br>
***************************************************<br>
</blockquote></div></div>

--0000000000006c6afd05fd893a2c--

--===============0751202349892829346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0751202349892829346==--
