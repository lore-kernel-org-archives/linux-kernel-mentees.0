Return-Path: <SRS0=jt7Q=7C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7F7C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 07:03:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18154207FB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 May 2020 07:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTTorZGJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18154207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DCA18862BC;
	Wed, 20 May 2020 07:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iu45tzRVlhRx; Wed, 20 May 2020 07:03:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 27DD385B4D;
	Wed, 20 May 2020 07:03:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0ECA9C088A;
	Wed, 20 May 2020 07:03:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 686B5C0176
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4C36887662
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mtnpwK3E2jYk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:03:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4E2518569B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 07:03:44 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id a23so1807348qto.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 May 2020 00:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SPg3UerPg90w3ZwY/BvCPc4omVM0mKRl5Uw6ZCALGQg=;
 b=cTTorZGJAZha9tsJP76UL9hMit//fhSOijqnlZQdU9ZwX1UdJnFHBfSCiuMHJRltWt
 K/pz9L9H9GCvv2PPK2cLm740MVfaZYexWrhxTB/IQpSyOsXN+7B2NfL9Pk+tielFT7YJ
 OyuAGdaiRbnF7rGS4fMswOg5bNPbm6V37lC7KfJarvibbyrHcyWkZJduxIp3phsK8yk2
 T82xPoYx7MCc64MUS9tmo50SkK+feh+8P0i0di+uW2qWUzcrNRN60xCpaSNfMDeqrKuq
 zEE6H/4oqIW6eKY6/Qwxr32jfMoCokSGJOJPTXtGXEo+oWhsuYRf3MLnz/nTf+LNVjNF
 NVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SPg3UerPg90w3ZwY/BvCPc4omVM0mKRl5Uw6ZCALGQg=;
 b=hNiMrgG4S9E//zg2kEvgiI1IiZHJoxqk6ZMg64TwmZU17CQUBOeSD74+435jDF5D1t
 dGRNNMfPbTKZUqNrsnMy5IEeYQ/CU2TcKJfpaQ4wwIlhUZMhp6cYhSHg15e3dhm79ojg
 L/BdT7RGJegQ2JiYxZvakr5WWxvkCXZ6osXSQ6584XKtTR8TGgBG3lGYs+CIqc/jhpFb
 /UOYZ+iL7bMii4BALCYvwsgNmSZYu3RVTMFdGNrdIf2o8XqjrQ9taMCiEUZgjQT1cCne
 3Cthu/dqWUm12L72fhb6YbLrBuVHdTtHlvUetCeY4M+CkH5dX3Rr621bMtZqGt6+VaLH
 9RNw==
X-Gm-Message-State: AOAM530ViCOGasZS3j6LVR4Y5GBBwZqIXH9bsY98mRrlf/3v5MW5BY90
 C0I63eIPJ+ipbMiUPhK27rU=
X-Google-Smtp-Source: ABdhPJwmGRFWIiu1DJVRB/u/ecF9p0MpmYAe8g5W0ZqK/dP/eT2jN9q3m+TF08mo4vRe0f+B8YcU7Q==
X-Received: by 2002:ac8:2db0:: with SMTP id p45mr3278993qta.354.1589958223103; 
 Wed, 20 May 2020 00:03:43 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id i23sm1598893qke.65.2020.05.20.00.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 00:03:41 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Wed, 20 May 2020 04:03:24 -0300
Message-Id: <20200520070334.1778751-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This series is work in progress. It represents the current work done on a
virtual DVB driver for the Linux media subsystem. I am new to the media
subsystem and to kernel development in general.

This driver aims to:
	- Serve as template for new DVB driver writers
	- Help userspace application writers in general
	- Push fake audio/video to userspace for testing
		purposes
	- Push debug information to userspace via debugfs

This should currently be able to feed PSI and PCM audio data to
userspace.

I appreciate any feedback!

Changes in v6:
	Addressed the following issues:
	- Makefile was not actually compiling everything;
	- The bridge driver should be a platform driver;
	- There are lots of warnings and other errors produced
	by the driver.

Changes in v5:

Removed all calls to WARN_ON in favor of pr_warn_ratelimited
Add a #define for pr_fmt
Reworked the byte swapping logic for big/little endian support:
	big endian fields now prepended with __beXX for 'sparse' checks
	bitfields now laid in reverse order if LITTLE_ENDIAN_BITFIELD
		is set

media: vidtv: implement a tuner driver
	Return -EINVAL instead of -1 in vidtv_tuner_check_frequency_shift
media: vidtv: implement a demodulator driver
	Add POLL_THRD_TIME #define
	Implement dvb_frontend_ops as a single struct instead of three
media: vidtv: move config structs into a separate header
	Removed this commit, configs are now in vidtv_tuner.h and vidtv_demod.h
media: vidtv: add a bridge driver
	module_param: all fs permissions set to 0
	removed param 'chosen_delsys'
	module_param: removed "optional" string: all module_params are optional
	renamed vidtv_bridge -> vidtv_bridg: so the source code and module names
		are different
media: vidtv: add wrappers for memcpy and memset
	Added kernel-docs
	write address is now computed internally
media: vidtv: add MPEG TS common code
	Drop packets if the buffer is full
media: vidtv: implement a PSI generator
	Removed vidtv_psi_ts_psi_write_stuffing()
	Forcibly align misaligned buffers
	Drop packets if buffer is full
media: vidtv: implement a PES packetizer
	Remove vidtv_extract_bits() in favor of GENMASK() and bitwise &
	Forcibly align misaligned buffers
media: vidtv: Implement a SMPTE 302M encoder
	Added kernel-docs for struct vidtv_encoder
media: vidtv: Add a MPEG Transport Stream Multiplexer
	Added check for minimum and maximum buffer size.
	Drop packets if buffer is full


Changes in v4:
Added a PES packetizer
Implemented a minimum version of the SMPTE 302m encoder for AES3 audio
Fixed endianness in the PSI generator, converting fields to big endian where applicable
Added a minimal TS mux abstraction

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

Daniel W. S. Almeida (10):
  media: vidtv: add Kconfig entry
  media: vidtv: implement a tuner driver
  media: vidtv: implement a demodulator driver
  media: vidtv: add a bridge driver
  media: vidtv: add wrappers for memcpy and memset
  media: vidtv: add MPEG TS common code
  media: vidtv: implement a PSI generator
  media: vidtv: implement a PES packetizer
  media: vidtv: Implement a SMPTE 302M encoder
  media: vidtv: Add a MPEG Transport Stream Multiplexer

 arch/Kconfig                                  |    2 +-
 drivers/media/dvb-core/dvbdev.c               |    1 +
 drivers/media/test-drivers/Kconfig            |   10 +
 drivers/media/test-drivers/Makefile           |    1 +
 drivers/media/test-drivers/vidtv/Kconfig      |   11 +
 drivers/media/test-drivers/vidtv/Makefile     |    9 +
 .../media/test-drivers/vidtv/vidtv_bridge.c   |  511 ++++++++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |   41 +
 .../media/test-drivers/vidtv/vidtv_channel.c  |  339 ++++++
 .../media/test-drivers/vidtv/vidtv_channel.h  |   66 ++
 .../media/test-drivers/vidtv/vidtv_common.c   |   86 ++
 .../media/test-drivers/vidtv/vidtv_common.h   |   34 +
 .../media/test-drivers/vidtv/vidtv_demod.c    |  444 +++++++
 .../media/test-drivers/vidtv/vidtv_demod.h    |   41 +
 .../media/test-drivers/vidtv/vidtv_encoder.h  |  103 ++
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  434 +++++++
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  105 ++
 drivers/media/test-drivers/vidtv/vidtv_pes.c  |  450 +++++++
 drivers/media/test-drivers/vidtv/vidtv_pes.h  |  186 +++
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 1055 +++++++++++++++++
 drivers/media/test-drivers/vidtv/vidtv_psi.h  |  420 +++++++
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  636 ++++++++++
 .../media/test-drivers/vidtv/vidtv_s302m.h    |  119 ++
 drivers/media/test-drivers/vidtv/vidtv_ts.c   |  157 +++
 drivers/media/test-drivers/vidtv/vidtv_ts.h   |  120 ++
 .../media/test-drivers/vidtv/vidtv_tuner.c    |  408 +++++++
 .../media/test-drivers/vidtv/vidtv_tuner.h    |   26 +
 27 files changed, 5814 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/test-drivers/vidtv/Kconfig
 create mode 100644 drivers/media/test-drivers/vidtv/Makefile
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_demod.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_encoder.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_mux.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_pes.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_psi.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_s302m.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_ts.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_tuner.h

-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
