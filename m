Return-Path: <SRS0=pM+b=5W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B095DC2BA80
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 23:21:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 768CC206C3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Apr 2020 23:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6QX0Cub"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 768CC206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 577C184ADC;
	Mon,  6 Apr 2020 23:21:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6EJnsawtZ0IZ; Mon,  6 Apr 2020 23:21:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4929F84A92;
	Mon,  6 Apr 2020 23:21:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DF4AC1AE2;
	Mon,  6 Apr 2020 23:21:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD9A2C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 23:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A868484ADC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 23:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGiD-SoxDeaj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 23:21:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C3B1784A92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Apr 2020 23:21:08 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id ca9so941873qvb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Apr 2020 16:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EI3fvdQqo6rWLTVe2rmui3f2Khg7EPctCx3cXAlE7J0=;
 b=J6QX0CubGX5SPxKtgX9CF/xkUrvX8lYSkpj12JTpMIi/HnVgM6KBJcV5Groh7Y3kG9
 sXV4eEwc8yiykvAbn5wkZuwBp0QSa2X3U9dlrY1hDHOoc7W0ev3IBlLXH3RLucolBTvm
 hvweeAb90juSY5rcx+ExyIKa9wXyqXPdgP1Vy2tIuj2u4LOF2nvrhRwm+MsdI1lQBi/A
 7krV8bTjq759psp4TI683/dvROhBQCtUKfD+ypQLzSx+RTJuCs1qvGL8BxrSHR6ogO6X
 Mvrd4V4sU0fgXlg24fWIG1KI/SRiYXnMcb2lop9iKEbhxSE2jKqYDMebn9q1Z2/fqOJb
 QIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EI3fvdQqo6rWLTVe2rmui3f2Khg7EPctCx3cXAlE7J0=;
 b=Zq6YZr+y2dqH4IY5owoUCrZt/0ClGT4pgreF4v+7XfRtFzmNqX+Z7zIgbCzdeEqy29
 5jlfnessLQxoB4b83ZaQ/k7DOQC9xREo2t6MkN8xLfyklytlv/5eWRLeTakwz8K1gEep
 K05qQDFKebdKEQ/QKp42AgHKd++wnsbmEUOSahyg8HEty7U7Sn5VKTrhSzBBz90SdC3F
 qP6vtmShVI/Ea3lFw82PaXwKYwYhoouopPFTeGZd+GW40ytT1fijVwcF3MzElCzwo2Dn
 T8gQ0FOCzfegnUgQk52md3LZFysRPuhZKwFnkDLdh0rVwWEWrthANwFW86Cbz0CJOdt+
 ednA==
X-Gm-Message-State: AGi0PuYptqDuGs55npdD54U5kCfaUb5Iem3gngxWEsR0rqdbMWZ9Wwbf
 +jjIneysXMhP0etDS3sN2UA=
X-Google-Smtp-Source: APiQypJMewMvKoVtBgRnRk/+pX8EOOTVw2UhVe+4wO5clgqS5WzO63yET9RcNc2blnDiu8lJQWS+Sw==
X-Received: by 2002:a0c:a284:: with SMTP id g4mr2180127qva.131.1586215267533; 
 Mon, 06 Apr 2020 16:21:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id u26sm1490978qku.54.2020.04.06.16.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 16:21:06 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Mon,  6 Apr 2020 20:20:49 -0300
Message-Id: <20200406232055.1023946-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v3 0/6] media: vidtv: implement a virtual DVB driver
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This series is work in progress. It represents the current work done on a
virtual DVB driver for the Linux media subsystem. I am new to the media
subsystem and to kernel development in general.

This applies on top of this branch
https://git.linuxtv.org/mchehab/experimental.git/log/?h=media-kconfig
for now, as these changes have not been applied to the media tree yet.
The changes in this branch have reorganized where test drivers go in
the subsystem. The dummy driver written by Emard was left untouched.

As for vidtv, we currently have a tuner driver, a demodulator driver, a
bridge driver and some MPEG PSI code. This should be, therefore, a
minimum viable example for what this driver intends to become in the
future.

I appreciate any feedback given. Thank you.


Changes in v3:
	Added a bridge driver
	Renamed the driver to vidtv
	Renamed/reworked commits into smaller pieces
	Moved the driver into its own directory
	Fixed the code for the signal strength in the tuner
	Removed useless enums in the tuner driver (e.g. lock_status, power_status...)
	Reworked the logic for the poll_snr thread in the demodulator driver
	Moved MPEG related code to the bridge driver, as it controls the demux logic
	Changed literals to #defines, used sizeof in place of integer literals when
	computing the size of PSI structs
	Moved the MPEG PSI tables to the heap to reduce stack space usage
	Now using usleep_range in place of msleep_interruptible in the MPEG TS thread
	Wrapped memcpy and memset to protect against buffer overflow when writing to the
	MPEG TS buffer.

Changes in v2:
	Attempted not to break assignments into multiple lines as much as possible.
	Code now passes checkpatch strict mode

	media: dvb_dummy_tuner: implement driver skeleton	
		Changed snr values to mili db
		Return value from 0-100 to indicate how far off the requested
		frequency is from a valid one

		Use the frequency shift to interpolate between 34dB and 10dB if
		we can not match against the SNR lookup table
		Remove sleep calls for suspend/resume

		Fix memcpy call for the config struct

        media: dvb_dummy_fe.c: lose TS lock on bad snr
		Randomly recover the TS lock if the signal quality improves
				
  	media: dvb_dummy_fe.c: write PSI information into DMX buffer
		Split the patch into multiple header/source files

		Hexadecimal literals are now lower case

		Prefer short function names / reduce function signatures

		Add #defines for constants when computing section lengths

		Change signature for functions that take a dummy channel as
		argument (i.e. channels* is now channels[NUM_CHANNELS])

Daniel W. S. Almeida (6):
  media: vidtv: add Kconfig entry
  media: vidtv: implement a tuner driver
  media: vidtv: implement a demodulator driver
  media: vidtv: implement a PSI generator
  media: vidtv: move config structs into a common header
  media: vidtv: add a bridge driver

 drivers/media/test_drivers/Kconfig            |  10 +
 drivers/media/test_drivers/Makefile           |   1 +
 drivers/media/test_drivers/vidtv/Kconfig      |  11 +
 drivers/media/test_drivers/vidtv/Makefile     |   6 +
 .../media/test_drivers/vidtv/vidtv_bridge.c   | 736 ++++++++++++++
 .../media/test_drivers/vidtv/vidtv_bridge.h   |  51 +
 .../media/test_drivers/vidtv/vidtv_common.c   |  44 +
 .../media/test_drivers/vidtv/vidtv_common.h   | 105 ++
 .../media/test_drivers/vidtv/vidtv_demod.c    | 493 +++++++++
 .../media/test_drivers/vidtv/vidtv_demod.h    |  34 +
 drivers/media/test_drivers/vidtv/vidtv_psi.c  | 960 ++++++++++++++++++
 drivers/media/test_drivers/vidtv/vidtv_psi.h  | 294 ++++++
 .../media/test_drivers/vidtv/vidtv_tuner.c    | 403 ++++++++
 13 files changed, 3148 insertions(+)
 create mode 100644 drivers/media/test_drivers/vidtv/Kconfig
 create mode 100644 drivers/media/test_drivers/vidtv/Makefile
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_bridge.c
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_bridge.h
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_common.c
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_common.h
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_demod.c
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_demod.h
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_psi.c
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_psi.h
 create mode 100644 drivers/media/test_drivers/vidtv/vidtv_tuner.c

-- 
2.26.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
