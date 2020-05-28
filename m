Return-Path: <SRS0=onbg=7K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55913C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 23:57:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0E5B206DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 May 2020 23:57:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g6wU66f8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0E5B206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D61088117;
	Thu, 28 May 2020 23:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aS1UFLCPMc-D; Thu, 28 May 2020 23:57:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DAEE388111;
	Thu, 28 May 2020 23:57:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2165C07FF;
	Thu, 28 May 2020 23:57:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B30D8C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 23:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8E5C5207A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 23:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kLBY7FDpYRMz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 23:57:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 8E14E20415
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 23:57:09 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id d26so605236otc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 May 2020 16:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xnF7bq7shkx7ZcZIcnn6B6sGwM0ZzIQoJAt50fdb1lY=;
 b=g6wU66f8zXGdp21Ow/ISdTjTk2aewuSnho+SgCTmA88zRbjOXKq1JbE0GeZcvOoPly
 guioGavkhd6Gv/CMMRThDWZL11FlvnsG2H3FGCSgE3vpcPndDDnPfhLge/Jpblfj7MVX
 DWxwu5XybHZ9tHq7fB00zjuD2lScIT8/9Dd08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xnF7bq7shkx7ZcZIcnn6B6sGwM0ZzIQoJAt50fdb1lY=;
 b=BftG98kKzl33j8999xpI9o06Eq9R5vcpEBsN+jL+MOnE831qIlMkZ94zWKmJCH0ruu
 14or9WLyo5xq1SwFE1k8XI0c1bTa5BoE+5zvTfG3Bu7p5H8hr4SUBpb9hbWLEPik+pFd
 RiZfF7gJILBmaxIDQ2XtMqBZ5JHFtwlO6IhUcF7Bnn55+7/9B6wVyksBmrgw7dJngNve
 9Y6obv1hyXGXwnh0BItBSSWwQ9WSU8KlL6Pa2aD1ohyMQdQV9nQrrFshmtbqNg3SwKnc
 yocHAGjHpaXTB3wX3HbBmRfVh64RH3T2ZnKikoW5VUGiN56fOb/1lVboVGvsGeXoKrGy
 /s8A==
X-Gm-Message-State: AOAM530xWjXVBP+XpD9bmIrP2Vn2Og0o0cwyU8uBoAEuienA+lkC99Vm
 gJmC3JIz67AsRaoXG/UyypcEYRMM
X-Google-Smtp-Source: ABdhPJy45otod0QGQWGG3vYYmcncDUzaXwvZhkSi7OEnoIuK/+N4n84/oWewfMcT7wnd/dwJJYRDuA==
X-Received: by 2002:a9d:650a:: with SMTP id i10mr3926829otl.245.1590710228527; 
 Thu, 28 May 2020 16:57:08 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id u129sm2206799oou.19.2020.05.28.16.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2020 16:57:08 -0700 (PDT)
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
References: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <aed92295-4057-ff21-36e4-48b6f238ab54@linuxfoundation.org>
Date: Thu, 28 May 2020 17:57:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
	v6 00/10] media: vidtv: implement a virtual DVB driver
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

On 5/20/20 1:03 AM, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> This series is work in progress. It represents the current work done on a
> virtual DVB driver for the Linux media subsystem. I am new to the media
> subsystem and to kernel development in general.
> 
> This driver aims to:
> 	- Serve as template for new DVB driver writers
> 	- Help userspace application writers in general
> 	- Push fake audio/video to userspace for testing
> 		purposes
> 	- Push debug information to userspace via debugfs
> 
> This should currently be able to feed PSI and PCM audio data to
> userspace.
> 
> I appreciate any feedback!
> 
> Changes in v6:
> 	Addressed the following issues:
> 	- Makefile was not actually compiling everything;
> 	- The bridge driver should be a platform driver;
> 	- There are lots of warnings and other errors produced
> 	by the driver.
> 
> Changes in v5:
> 
> Removed all calls to WARN_ON in favor of pr_warn_ratelimited
> Add a #define for pr_fmt
> Reworked the byte swapping logic for big/little endian support:
> 	big endian fields now prepended with __beXX for 'sparse' checks
> 	bitfields now laid in reverse order if LITTLE_ENDIAN_BITFIELD
> 		is set
> 
> media: vidtv: implement a tuner driver
> 	Return -EINVAL instead of -1 in vidtv_tuner_check_frequency_shift
> media: vidtv: implement a demodulator driver
> 	Add POLL_THRD_TIME #define
> 	Implement dvb_frontend_ops as a single struct instead of three
> media: vidtv: move config structs into a separate header
> 	Removed this commit, configs are now in vidtv_tuner.h and vidtv_demod.h
> media: vidtv: add a bridge driver
> 	module_param: all fs permissions set to 0
> 	removed param 'chosen_delsys'
> 	module_param: removed "optional" string: all module_params are optional
> 	renamed vidtv_bridge -> vidtv_bridg: so the source code and module names
> 		are different
> media: vidtv: add wrappers for memcpy and memset
> 	Added kernel-docs
> 	write address is now computed internally
> media: vidtv: add MPEG TS common code
> 	Drop packets if the buffer is full
> media: vidtv: implement a PSI generator
> 	Removed vidtv_psi_ts_psi_write_stuffing()
> 	Forcibly align misaligned buffers
> 	Drop packets if buffer is full
> media: vidtv: implement a PES packetizer
> 	Remove vidtv_extract_bits() in favor of GENMASK() and bitwise &
> 	Forcibly align misaligned buffers
> media: vidtv: Implement a SMPTE 302M encoder
> 	Added kernel-docs for struct vidtv_encoder
> media: vidtv: Add a MPEG Transport Stream Multiplexer
> 	Added check for minimum and maximum buffer size.
> 	Drop packets if buffer is full
> 
> 
> Changes in v4:
> Added a PES packetizer
> Implemented a minimum version of the SMPTE 302m encoder for AES3 audio
> Fixed endianness in the PSI generator, converting fields to big endian where applicable
> Added a minimal TS mux abstraction
> 
> Changes in v3:
> Added a bridge driver
> Renamed the driver to vidtv
> Renamed/reworked commits into smaller pieces
> Moved the driver into its own directory
> Fixed the code for the signal strength in the tuner
> Removed useless enums in the tuner driver (e.g. lock_status, power_status...)
> Reworked the logic for the poll_snr thread in the demodulator driver
> Moved MPEG related code to the bridge driver, as it controls the demux logic
> Changed literals to #defines, used sizeof in place of integer literals when
> computing the size of PSI structs
> Moved the MPEG PSI tables to the heap to reduce stack space usage
> Now using usleep_range in place of msleep_interruptible in the MPEG TS thread
> Wrapped memcpy and memset to protect against buffer overflow when writing to the
> MPEG TS buffer.
> 
> Changes in v2:
> Attempted not to break assignments into multiple lines as much as possible.
> Code now passes checkpatch strict mode
> 
> media: dvb_dummy_tuner: implement driver skeleton	
> Changed snr values to mili db
> Return value from 0-100 to indicate how far off the requested
> frequency is from a valid one
> 
> Use the frequency shift to interpolate between 34dB and 10dB if
> we can not match against the SNR lookup table
> Remove sleep calls for suspend/resume
> 
> Fix memcpy call for the config struct
> 
> media: dvb_dummy_fe.c: lose TS lock on bad snr
> Randomly recover the TS lock if the signal quality improves
> 
> media: dvb_dummy_fe.c: write PSI information into DMX buffer
> Split the patch into multiple header/source files
> 
> Hexadecimal literals are now lower case
> 
> Prefer short function names / reduce function signatures
> 
> Add #defines for constants when computing section lengths
> 
> Change signature for functions that take a dummy channel as
> argument (i.e. channels* is now channels[NUM_CHANNELS])
> 
> Daniel W. S. Almeida (10):
>    media: vidtv: add Kconfig entry
>    media: vidtv: implement a tuner driver

You can collapse patch 1 and 2. I don't see why you need two
separate patches.

>    media: vidtv: implement a demodulator driver
>    media: vidtv: add a bridge driver
>    media: vidtv: add wrappers for memcpy and memset
>    media: vidtv: add MPEG TS common code
>    media: vidtv: implement a PSI generator
>    media: vidtv: implement a PES packetizer
>    media: vidtv: Implement a SMPTE 302M encoder
>    media: vidtv: Add a MPEG Transport Stream Multiplexer
> 
>   arch/Kconfig                                  |    2 +-

Why do you need this change. It is part of patch 04 with no
explanation on why this change is necessary.


>   drivers/media/dvb-core/dvbdev.c               |    1 +

Same here.

>   drivers/media/test-drivers/Kconfig            |   10 +
>   drivers/media/test-drivers/Makefile           |    1 +
>   drivers/media/test-drivers/vidtv/Kconfig      |   11 +
>   drivers/media/test-drivers/vidtv/Makefile     |    9 +
>   .../media/test-drivers/vidtv/vidtv_bridge.c   |  511 ++++++++
>   .../media/test-drivers/vidtv/vidtv_bridge.h   |   41 +
>   .../media/test-drivers/vidtv/vidtv_channel.c  |  339 ++++++
>   .../media/test-drivers/vidtv/vidtv_channel.h  |   66 ++
>   .../media/test-drivers/vidtv/vidtv_common.c   |   86 ++
>   .../media/test-drivers/vidtv/vidtv_common.h   |   34 +
>   .../media/test-drivers/vidtv/vidtv_demod.c    |  444 +++++++
>   .../media/test-drivers/vidtv/vidtv_demod.h    |   41 +
>   .../media/test-drivers/vidtv/vidtv_encoder.h  |  103 ++
>   drivers/media/test-drivers/vidtv/vidtv_mux.c  |  434 +++++++
>   drivers/media/test-drivers/vidtv/vidtv_mux.h  |  105 ++
>   drivers/media/test-drivers/vidtv/vidtv_pes.c  |  450 +++++++
>   drivers/media/test-drivers/vidtv/vidtv_pes.h  |  186 +++
>   drivers/media/test-drivers/vidtv/vidtv_psi.c  | 1055 +++++++++++++++++
>   drivers/media/test-drivers/vidtv/vidtv_psi.h  |  420 +++++++
>   .../media/test-drivers/vidtv/vidtv_s302m.c    |  636 ++++++++++
>   .../media/test-drivers/vidtv/vidtv_s302m.h    |  119 ++
>   drivers/media/test-drivers/vidtv/vidtv_ts.c   |  157 +++
>   drivers/media/test-drivers/vidtv/vidtv_ts.h   |  120 ++
>   .../media/test-drivers/vidtv/vidtv_tuner.c    |  408 +++++++
>   .../media/test-drivers/vidtv/vidtv_tuner.h    |   26 +
>   27 files changed, 5814 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/media/test-drivers/vidtv/Kconfig
>   create mode 100644 drivers/media/test-drivers/vidtv/Makefile
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.h
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.h
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.h
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_encoder.h
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.h
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.h
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.h
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.h
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.h
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.c
>   create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.h
> 

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
