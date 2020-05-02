Return-Path: <SRS0=N6Le=6Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48CA1C47256
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 21:12:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3CB020757
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 21:12:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6agc3gQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3CB020757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BB632886BE;
	Sat,  2 May 2020 21:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3OEVTCsSNZCs; Sat,  2 May 2020 21:12:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EC6D08816B;
	Sat,  2 May 2020 21:12:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2860C088A;
	Sat,  2 May 2020 21:12:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD358C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 21:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C5F5888118
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 21:12:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bAUapjzVR2Od
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 21:12:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 95E46880C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 21:12:14 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id v38so6475433qvf.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 02 May 2020 14:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=opbP3xf3scB6RxanodsgfXYW3aH44fhT9/1PEOdh5Os=;
 b=Y6agc3gQS+u6m4uKvq3cQlzf+kRukgCErESV9LuiioRKFTili9IzN3bj8NRpDyFqDg
 qrWdv4kO4qfUwr+j+a+y7qP9LGq5zvjY6U53UTbWW77YiemRnCq/WFVQqLTwkFssMiuq
 IrCpk1YrtnQ7pl6PDT7C5fCkhC3F8z9xQa8fXfkqP1zneQHca3paiKBZz8axWISb7ExV
 nrxjC5I9PirncjHqDgTYRKy434rQzFz2grUrfp0RfzloIM1yCZGefIZArg07Xa98/jyC
 g9lZV4j+5xGCxnkZBlyqMc22bcpswzzdBE/Ghnd0I600xzo1D/Xbbe2BU6f3/kXe0e3I
 /Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=opbP3xf3scB6RxanodsgfXYW3aH44fhT9/1PEOdh5Os=;
 b=KtCSSahTVFaj+QwJQNCCPQXznPyUD+m1MtH0GmWFXo7YpVTzF0fOQNwVBIk/00b2+j
 JbrEOcJeQDa4rSGCs+SPfw/KWQiCMqtdJd9X1PT4jJdUIowqiIdKAQdVy30U3T/6BI4l
 t+jC1QHd67Nf9AdZ5TexCtR4FjP33lQY6sTrWfPsYYN+hYfeEUSHWeH5EfkCYDuamp3W
 O6Xv/qWZ3B6lRQY25vPEw8NfPsS3FAeZBd/2Ot1HWLbpicP8Cewv/NQkl05NTKJcqAs/
 SzrtJsAN/FD+2tgs0ISFWd2eTIfYap/olMbFurnj7Cp4ifXXYlCgE7G9lOZne1CH4nbz
 4H9A==
X-Gm-Message-State: AGi0PuZcVY1pCuIztFb/S3li7zSCNI4lhu/SU5rjBW9g702xCcePj9cV
 rogn88Akh06IJJOaXH6nz/s=
X-Google-Smtp-Source: APiQypKzRqCU1kvTtJ5uzoJEr3JzCfOa17dyXHb9AEMEpg+VgxIgYo1XJK428/4Wxz49HrZCwuS9Tg==
X-Received: by 2002:a0c:8d48:: with SMTP id s8mr9746643qvb.114.1588453933501; 
 Sat, 02 May 2020 14:12:13 -0700 (PDT)
Received: from ?IPv6:2804:18:700c:ffc5:f528:88fe:f276:acfe?
 ([2804:18:700c:ffc5:f528:88fe:f276:acfe])
 by smtp.gmail.com with ESMTPSA id g47sm6483004qte.54.2020.05.02.14.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 May 2020 14:12:12 -0700 (PDT)
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
 <20200502032216.197977-6-dwlsalmeida@gmail.com>
 <20200502083030.2314349d@coco.lan>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <ce98a09d-0f46-bff2-e0fd-fddbec81a815@gmail.com>
Date: Sat, 2 May 2020 18:12:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200502083030.2314349d@coco.lan>
Content-Language: en-US
Cc: kstewart@linuxfoundation.org, sean@mess.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, linux-kernel-mentees@lists.linuxfoundation.org,
 allison@lohutok.net, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
	v4 05/11] media: vidtv: add a bridge driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Mauro, thanks for reviewing this.

On 5/2/20 3:30 AM, Mauro Carvalho Chehab wrote:
 > Em Sat,  2 May 2020 00:22:10 -0300
 > "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:
 >
 >> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
 >>
 >> Digital TV devices consist of several independent hardware 
components which
 >> are controlled by different drivers.
 >> Each media device is controlled by a group of cooperating drivers 
with the
 >> bridge driver as the main driver.
 >>
 >> This patch adds a bridge driver for the Virtual Digital TV driver 
[vidtv].
 >>
 >> The bridge driver binds to the other drivers, that is, vidtv_tuner and
 >> vidtv_demod and implements the digital demux logic, providing userspace
 >> with a MPEG Transport Stream.
 >>
 >> Move config structs to a common header so they can be used by the bridge
 >> driver and by their respective drivers.
 >>
 >> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
 >> ---
 >>   drivers/media/test-drivers/vidtv/Makefile     |   2 +-
 >>   .../media/test-drivers/vidtv/vidtv_bridge.c   | 379 ++++++++++++++++++
 >>   .../media/test-drivers/vidtv/vidtv_bridge.h   |  37 ++
 >>   3 files changed, 417 insertions(+), 1 deletion(-)
 >>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.c
 >>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.h
 >>
 >> diff --git a/drivers/media/test-drivers/vidtv/Makefile 
b/drivers/media/test-drivers/vidtv/Makefile
 >> index 36ba00ddc0d1e..a9f1993dd5443 100644
 >> --- a/drivers/media/test-drivers/vidtv/Makefile
 >> +++ b/drivers/media/test-drivers/vidtv/Makefile
 >> @@ -1,3 +1,3 @@
 >>   # SPDX-License-Identifier: GPL-2.0
 >>
 >> -obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o  vidtv_demod.o
 >> +obj-$(CONFIG_DVB_VIDTV)	+= vidtv_tuner.o vidtv_demod.o vidtv_bridge.o
 >> diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c 
b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
 >> new file mode 100644
 >> index 0000000000000..05ca4027c869f
 >> --- /dev/null
 >> +++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
 >> @@ -0,0 +1,379 @@
 >> +// SPDX-License-Identifier: GPL-2.0
 >> +/*
 >> + * The Virtual DTV test driver serves as a reference DVB driver and 
helps
 >> + * validate the existing APIs in the media subsystem. It can also aid
 >> + * developers working on userspace applications.
 >> + *
 >> + * Written by Daniel W. S. Almeida <dwlsalmeida@gmail.com>
 >> + */
 >> +
 >> +#include <linux/types.h>
 >> +#include <linux/moduleparam.h>
 >> +#include <linux/mutex.h>
 >> +#include <linux/workqueue.h>
 >> +#include <linux/time.h>
 >> +#include "vidtv_bridge.h"
 >> +
 >> +#define TS_BUF_MAX_SZ (128 * 188)
 >> +#define TUNER_DEFAULT_ADDR 0x68
 >> +#define DEMOD_DEFAULT_ADDR 0x60
 >> +
 >> +MODULE_AUTHOR("Daniel W. S. Almeida");
 >> +MODULE_LICENSE("GPL");
 >> +
 >
 >> +static unsigned int drop_tslock_prob_on_low_snr;
 >> +module_param(drop_tslock_prob_on_low_snr, uint, 0644);
 >> +MODULE_PARM_DESC(drop_tslock_prob_on_low_snr,
 >> +		 "Probability of losing the TS lock if the signal quality is bad");
 >> +
 >> +static unsigned int recover_tslock_prob_on_good_snr;
 >> +module_param(recover_tslock_prob_on_good_snr, uint, 0644);
 >> +MODULE_PARM_DESC(recover_tslock_prob_on_good_snr,
 >> +		 "Probability recovering the TS lock when the signal improves");
 >
 > The FS permissions should be reviewed. IMHO, we should allow the
 > group which owns the /dev to be able to change values when they can
 > be changed in runtime.
 >
 > Yet, be sure that changing it on runtime won't cause race conditions.
 >
 > For the two above, I guess the permissions for those should be, instead,
 > 0664.
 >
 >> +
 >> +static unsigned int mock_power_up_delay_msec;
 >> +module_param(mock_power_up_delay_msec, uint, 0644);
 >> +MODULE_PARM_DESC(mock_power_up_delay_msec, "Simulate a power up 
delay");
 >
 > What's the sense of allowing changing it after the probe? I guess
 > permissions should be 0444 here.
 >
 >> +
 >> +static unsigned int mock_tune_delay_msec;
 >> +module_param(mock_tune_delay_msec, uint, 0644);
 >> +MODULE_PARM_DESC(mock_tune_delay_msec, "Simulate a tune delay");
 >
 > Same here: I guess 0664 would work better.
 >
 >> +
 >> +static unsigned int vidtv_valid_dvb_t_freqs[8];
 >> +module_param_array(vidtv_valid_dvb_t_freqs, uint, NULL, 0644);
 >> +MODULE_PARM_DESC(vidtv_valid_dvb_t_freqs,
 >> +		 "Valid DVB-T frequencies to simulate");
 >> +
 >> +static unsigned int vidtv_valid_dvb_c_freqs[8];
 >> +module_param_array(vidtv_valid_dvb_c_freqs, uint, NULL, 0644);
 >> +MODULE_PARM_DESC(vidtv_valid_dvb_c_freqs,
 >> +		 "Valid DVB-C frequencies to simulate");
 >> +
 >> +static unsigned int vidtv_valid_dvb_s_freqs[8];
 >> +module_param_array(vidtv_valid_dvb_s_freqs, uint, NULL, 0644);
 >> +MODULE_PARM_DESC(vidtv_valid_dvb_s_freqs,
 >> +		 "Valid DVB-C frequencies to simulate");
 >
 > Can those be changed in runtime without causing race conditions?
 >
 >> +
 >> +static unsigned int max_frequency_shift_hz;
 >> +module_param(max_frequency_shift_hz, uint, 0644);
 >> +MODULE_PARM_DESC(max_frequency_shift_hz,
 >> +		 "Maximum shift in HZ allowed when tuning in a channel");
 >
 > 0664?
 >
 >> +
 >> +static unsigned int chosen_delsys = SYS_DVBT;
 >> +module_param(chosen_delsys, uint, 0644);
 >> +MODULE_PARM_DESC(chosen_delsys,
 >> +		 "The delivery system to simulate. Currently supported: DVB-T, 
DVB-C, DVB-S");
 >
 > Hmm... in order to allow changing this value on runtime, as you proposed,
 > you should use module_param_cb(). The callback would allow touching the
 > delsys only if the driver is not in use. Otherwise, it would return 
-EBUSY.
 > Also, permissions should be 0664.

Actually, my bad here. I used some other media driver as an example for 
module_param(), I did not intend to be able to change any of these 
during runtime at all, I only wanted to be able to set them at module 
load time. In fact, IIRC, these parameters are used when first setting 
up the driver and then they are not used anymore. Therefore, maybe "0" 
is more fitting?

 > Hmm... in order to allow changing this value on runtime, as you proposed,
 > you should use module_param_cb(). The callback would allow touching the
 > delsys only if the driver is not in use. Otherwise, it would return 
-EBUSY.
 > Also, permissions should be 0664.
 >
 > Btw, after thinking a little bit about that, I would take one step 
back on
 > my demod review, changing it and the bridge's logic to allow 
chosen_delsys,
 > while keeping just one struct for DVB info parameters.
 >
 > The way I see is that the logic here should be changed in order to use a
 > a bitmask for the chosen_delsys, like:
 >
 > 	bit 0: DVB-T
 > 	bit 1: DVB-T2
 > 	bit 2: DVB-C
 > 	bit 3: DVB-S
 > 	bit 4: DVB-S2
 >
 > Of course you will need to document the meaning for each bit somewhere.
 >
 > The default should be to have all supported types enabled.
 >
 > As there's no ops that would allow the bridge driver to change it
 > dynamically, you should instead implement the "chosen_delsys" directly
 > at the demod's driver.

Given what I said above about it being a misunderstanding on my part, do 
you still want to see this?

 > while keeping just one struct for DVB info parameters.

What do you mean by this?


 >> +static unsigned int ts_buf_sz = 20 * 188;
 >> +module_param(ts_buf_sz, uint, 0644);
 >> +MODULE_PARM_DESC(ts_buf_sz, "Optional size for the TS buffer");
 >
 > Huh? Userspace can already change it via an ioctl. Why adding a parameter
 > for that?

This is actually misplaced: it was supposed to be in the last patch for 
this series and probably got left behind as I was moving code around.

Maybe the name I chose was a bit confusing? I called the code 
responsible for collecting ES data from different encoders into a single 
buffer a "mux". Its buffer was thus named "ts_buf". This parameter 
dictates the size allocated at runtime with vmalloc(). This buffer later 
gets passed to dvb_dmx_swfilter().

The source code for this is in patch 11.

It is loosely based on what ffmpeg has going on at libavformat/mpegtsenc.c


- Daniel

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
