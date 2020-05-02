Return-Path: <SRS0=N6Le=6Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDA4C3A5A9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 06:02:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 610CA2184D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 06:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYEbQx2Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 610CA2184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 335BB874D4;
	Sat,  2 May 2020 06:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3CGi1Dmr9ta; Sat,  2 May 2020 06:02:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AB4AB8742C;
	Sat,  2 May 2020 06:02:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B6B8C0864;
	Sat,  2 May 2020 06:02:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89B18C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 06:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5FDE92049A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 06:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-WWeh0cJIH3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 06:02:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id DFC802048E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 06:02:53 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 639402137B;
 Sat,  2 May 2020 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588399373;
 bh=X6Pyfnz26T+hJ29/OcUlpITVEM0zBDu0xTBVgr1Bm5A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kYEbQx2Qfw6A2h8FmLpSpJ3fdgdQMJkl5xKb69ugUjEsYdVnVO66/c8tNwZKSEm+W
 hyjvg0FCHhATdwVklcTu6GQJhziRZpyV8tHDOsDqLWHjT6u4WLxz0sAGo9xYe20ODo
 GQWsOXAKaH1Rd89ab60jvu0fHPVKFf1yiMcpinOI=
Date: Sat, 2 May 2020 08:02:48 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200502080248.559cb0b9@coco.lan>
In-Reply-To: <20200502032216.197977-5-dwlsalmeida@gmail.com>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
 <20200502032216.197977-5-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, sean@mess.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, linux-kernel-mentees@lists.linuxfoundation.org,
 allison@lohutok.net, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
 v4 04/11] media: vidtv: move config structs into a separate header
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

Em Sat,  2 May 2020 00:22:09 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Move config structs to a common header so they can be used by the bridge
> driver and by their respective drivers.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  .../media/test-drivers/vidtv/vidtv_config.h   | 35 +++++++++++++++++++
>  .../media/test-drivers/vidtv/vidtv_demod.c    |  1 +
>  .../media/test-drivers/vidtv/vidtv_demod.h    |  9 -----
>  .../media/test-drivers/vidtv/vidtv_tuner.c    | 12 ++-----

Hmm... We generally use "foo.h" for kAPI definitions (like config structs)
and "foo-priv.h" for internal structs used within the driver.

So, I would be expecting a "vidtv_tuner.h" with kAPI definitions for
"vid_tuner.c" and a "vidtv_demod.h" for kAPI definitions for the
"vidtv_demod.c" driver.


>  4 files changed, 38 insertions(+), 19 deletions(-)
>  create mode 100644 drivers/media/test-drivers/vidtv/vidtv_config.h
> 
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_config.h b/drivers/media/test-drivers/vidtv/vidtv_config.h
> new file mode 100644
> index 0000000000000..7b95bf2444556
> --- /dev/null
> +++ b/drivers/media/test-drivers/vidtv/vidtv_config.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * The Virtual DTV test driver serves as a reference DVB driver and helps
> + * validate the existing APIs in the media subsystem. It can also aid
> + * developers working on userspace applications.
> + *
> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> + */
> +
> +#ifndef VIDTV_CONFIG_H
> +#define VIDTV_CONFIG_H
> +
> +#include <linux/types.h>
> +#include <media/dvb_frontend.h>
> +
> +struct vidtv_tuner_config {
> +	struct dvb_frontend *fe;
> +	u32 mock_power_up_delay_msec;
> +	u32 mock_tune_delay_msec;
> +	u32 vidtv_valid_dvb_t_freqs[8];
> +	u32 vidtv_valid_dvb_c_freqs[8];
> +	u32 vidtv_valid_dvb_s_freqs[8];
> +	u8  max_frequency_shift_hz;
> +};
> +
> +struct vidtv_demod_config {
> +	struct dvb_frontend *frontend;
> +	/* probability of losing the lock due to low snr */
> +	u8 drop_tslock_prob_on_low_snr;
> +	/* probability of recovering when the signal improves */
> +	u8 recover_tslock_prob_on_good_snr;
> +	u8 chosen_delsys;
> +};
> +
> +#endif //VIDTV_CONFIG_H
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
> index e5f157e4bbe48..15436e565a7b0 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
> @@ -19,6 +19,7 @@
>  #include <linux/i2c.h>
>  #include <media/dvb_frontend.h>
>  #include "vidtv_demod.h"
> +#include "vidtv_config.h"
>  
>  MODULE_DESCRIPTION("Virtual DVB Demodulator Driver");
>  MODULE_AUTHOR("Daniel W. S. Almeida");
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.h b/drivers/media/test-drivers/vidtv/vidtv_demod.h
> index 49c2a43f71661..269855efb77f3 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_demod.h
> +++ b/drivers/media/test-drivers/vidtv/vidtv_demod.h
> @@ -21,15 +21,6 @@ struct vidtv_demod_cnr_to_qual_s {
>  	u32 cnr_ok, cnr_good;
>  };
>  
> -struct vidtv_demod_config {
> -	struct dvb_frontend *frontend;
> -	/* probability of losing the lock due to low snr */
> -	u8 drop_tslock_prob_on_low_snr;
> -	/* probability of recovering when the signal improves */
> -	u8 recover_tslock_prob_on_good_snr;
> -	u8 chosen_delsys;
> -};
> -
>  struct vidtv_demod_state {
>  	struct dvb_frontend frontend;
>  	struct vidtv_demod_config config;
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
> index a790508f935b3..ece4a94b0c3ac 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
> @@ -17,20 +17,12 @@
>  #include <linux/types.h>
>  #include <media/dvb_frontend.h>
>  
> +#include "vidtv_config.h"
> +
>  MODULE_DESCRIPTION("Virtual DTV Tuner");
>  MODULE_AUTHOR("Daniel W. S. Almeida");
>  MODULE_LICENSE("GPL");
>  
> -struct vidtv_tuner_config {
> -	struct dvb_frontend *fe;
> -	u32 mock_power_up_delay_msec;
> -	u32 mock_tune_delay_msec;
> -	u32 vidtv_valid_dvb_t_freqs[8];
> -	u32 vidtv_valid_dvb_c_freqs[8];
> -	u32 vidtv_valid_dvb_s_freqs[8];
> -	u8  max_frequency_shift_hz;
> -};
> -
>  struct vidtv_tuner_cnr_to_qual_s {
>  	/* attempt to use the same values as libdvbv5 */
>  	u32 modulation;



Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
