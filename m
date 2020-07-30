Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4B8C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 15:35:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B420A2082E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 15:35:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLH18p6F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B420A2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 72B1F203D3;
	Thu, 30 Jul 2020 15:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5us1BzW2psCr; Thu, 30 Jul 2020 15:35:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DB90B203C2;
	Thu, 30 Jul 2020 15:35:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE6DAC004F;
	Thu, 30 Jul 2020 15:35:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D90FBC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 15:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BFCF48830E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 15:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4Vm7y4He7xe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 15:35:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7F2018683F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 15:35:26 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id j187so25923639qke.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 08:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ww+VtdoA6riXvdcxQjNRAvO2TJJKFKtGr51sohVqrlg=;
 b=mLH18p6FsRXXWhEsi1fYEMYmlm3hbSqTdTWG9Vg2KnurRTVgSWrzNywe9PFBUGrKhu
 GgnMY57pdTTtIEzcVUISk/uBXFXlaLonjnJgVFHBaT0WSJC+3zqNljViWuv56CdWFf+s
 XDL97RhXLxC2aR7OAn1HOFiDN2bbmL0avQgPSZWLFVir52fgi11RBJiCfoDej1bdI7dk
 wtOwb+N6pkfvqfQerLZMcOWMzp8B5PJ9eqs9l5JipPWuWQTTHBOIis5joYtgWFieKCn3
 5ySQzQm3mR73g5UR0UPqB7ERZcohT0Nz4sR6JvwaeppoRjst0eakZHyNiwje2VfMRrDZ
 Npbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ww+VtdoA6riXvdcxQjNRAvO2TJJKFKtGr51sohVqrlg=;
 b=Emvg26npTRhjv1fR6Qfu74Epg/pYGE0CcIuv83rc8CGnPsXj3NN1eni0Qu54F9KAPl
 KrKqx5xrIEB+XYnpdai2enXhC8H4PQPndVUPCeTdysjOOJ50lGSNiP9sudkFWVt9dYtY
 +JEfj/ruffmYU6RVBT1TS1kEYJE9HwzttOXuthuwmE4bugIKmcL12uw2EV8slB1/BOd4
 q0MVIQbtiq9o7ZvorBqZcPvWCKTLIu9DoSeXEwCjoWdFPjN7jL7c4a/lSa7TyAt8dxye
 0hd2oFd+tPkEEaP5z7KPoYacOXx7i4aoBHnRYeVmEK13BMGHk30ozqa7CXSmoSjgql2U
 4T2w==
X-Gm-Message-State: AOAM532KS4Mhar7MtS99Rx/qAurqlEa3VdbWVB/ygNBbVeZZH/WRdnKh
 vEy2ubuiI0/c5pZOquzZ4RM=
X-Google-Smtp-Source: ABdhPJxWTkiCH9U+VuFEcwhQD6FLBSq3WDEOT3bXoozCq2UfOlTo4OVcEHYLExZtRcWh0C82ifnN3Q==
X-Received: by 2002:a37:8305:: with SMTP id f5mr39702199qkd.497.1596123325201; 
 Thu, 30 Jul 2020 08:35:25 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id i7sm659047qtb.27.2020.07.30.08.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 08:35:24 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Thu, 30 Jul 2020 12:34:57 -0300
Message-Id: <20200730153501.742993-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W . S . Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [v8 0/4] media: vidtv: Implement a virtual
	DVB driver
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

From: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

This series is work in progress. It represents the current work done on a
virtual DVB driver for the Linux media subsystem. I am new to the media
subsystem and to kernel development in general.

This driver aims to:
	- Serve as template for new DVB driver writers
	- Help userspace application writers in general
	- Push fake audio/video to userspace for testing
	purposes
	- Push debug information to userspace via debugfs

Current state for this driver:
	- Driver is modprobed without any errors on dmesg
	- Using dvbv5-scan does not cause the driver to crash
	- Driver feeds the demux with TS packets (PSI, PCR, AES3 audio
	and NULL packets for padding), but the stream is not valid
	yet.
	- Kmemleak shows no leaks. UBSAN & KASAN pick up some bugs



The Virtual Digital TV Driver (vidtv)

Background
----------

Vidtv is a virtual DVB driver that aims to serve as a reference for driver
writers by serving as a template. It also validates the existing media DVB
APIs, thus helping userspace application writers.

Currently, it consists of:

- A fake tuner driver, which will report a bad signal quality if the chosen
  frequency is too far away from a table of valid frequencies for a
  particular delivery system.

- A fake demod driver, which will constantly poll the fake signal quality
  returned by the tuner, simulating a device that can lose/reacquire a lock
  on the signal depending on the CNR levels.

- A fake bridge driver, which is the module responsible for modprobing the
  fake tuner and demod modules and implementing the demux logic. This module
  takes parameters at initialization that will dictate how the simulation
  behaves.

- Code reponsible for encoding a valid MPEG Transport Stream, which is then
  passed to the bridge driver. This fake stream contains some hardcoded content.
  For now, we have a single, audio-only channel containing a single MPEG
  Elementary Stream, which in turn contains a SMPTE 302m encoded sine-wave.
  Note that this particular encoder was chosen because it is the easiest
  way to encode PCM audio data in a MPEG Transport Stream.

Building vidtv
--------------
vidtv is a test driver and thus is **not** enabled by default when
compiling the kernel.

In order to enable compilation of vidtv:

- Enable **DVB_TEST_DRIVERS**, then
- Enable **DVB_VIDTV**

When compiled as a module, expect the following .ko files:

- dvb_vidtv_tuner.ko

- dvb_vidtv_demod.ko

- dvb_vidtv_bridge.ko

Running vidtv
-------------
When compiled as a module, run::

	modprobe dvb_vidtv_bridge

That's it! The bridge driver will initialize the tuner and demod drivers as
part of its own initialization.

You can optionally define some command-line arguments to vidtv, see the
documentation for more info.

Testing vidtv with v4l-utils
============================

Start by installing v4l-utils and then modprobing vidtv::

	modprobe dvb_vidtv_bridge

If the driver is OK, it should load and its probing code will run. This will
pull in the tuner and demod drivers.

Using dvb-fe-tool
-----------------

The first step to check whether the demod loaded successfully is to run::

	$ dvb-fe-tool

This should return what is currently set up at the demod struct, i.e.::

	static const struct dvb_frontend_ops vidtv_demod_ops = {
		.delsys = {
			SYS_DVBT,
			SYS_DVBT2,
			SYS_DVBC_ANNEX_A,
			SYS_DVBS,
			SYS_DVBS2,
		},

		.info = {
			.name                   = "Dummy demod for DVB-T/T2/C/S/S2",
			.frequency_min_hz       = 51 * MHz,
			.frequency_max_hz       = 2150 * MHz,
			.frequency_stepsize_hz  = 62500,
			.frequency_tolerance_hz = 29500 * kHz,
			.symbol_rate_min        = 1000000,
			.symbol_rate_max        = 45000000,

			.caps = FE_CAN_FEC_1_2 |
				FE_CAN_FEC_2_3 |
				FE_CAN_FEC_3_4 |
				FE_CAN_FEC_4_5 |
				FE_CAN_FEC_5_6 |
				FE_CAN_FEC_6_7 |
				FE_CAN_FEC_7_8 |
				FE_CAN_FEC_8_9 |
				FE_CAN_QAM_16 |
				FE_CAN_QAM_64 |
				FE_CAN_QAM_32 |
				FE_CAN_QAM_128 |
				FE_CAN_QAM_256 |
				FE_CAN_QAM_AUTO |
				FE_CAN_QPSK |
				FE_CAN_FEC_AUTO |
				FE_CAN_INVERSION_AUTO |
				FE_CAN_TRANSMISSION_MODE_AUTO |
				FE_CAN_GUARD_INTERVAL_AUTO |
				FE_CAN_HIERARCHY_AUTO,
		}

		....

Using dvb-scan
--------------

In order to tune into a channel and read the PSI tables, we can use dvb-scan.

For this, one should provide a configuration file known as a 'scan file',
here's an example::

	[Channel]
	FREQUENCY = 330000000
	MODULATION = QAM/AUTO
	SYMBOL_RATE = 6940000
	INNER_FEC = AUTO
	DELIVERY_SYSTEM = DVBC/ANNEX_A

	NOTE:
	The parameters depend on the video standard you're testing.

	NOTE:
	Vidtv is a fake driver and does not validate much of the information
	in the scan file. Just specifying 'FREQUENCY' and 'DELIVERY_SYSTEM'
	should be enough for DVB-T/DVB-T2. For DVB-S/DVB-C however, you
	should also provide 'SYMBOL_RATE'.

Assuming this channel is named 'channel.conf', you can then run::

        $ dvbv5-scan dresden_dvbc_channel.conf

Using dvb-zap
-------------

dvbv5-zap is a command line tool that can be used to record MPEG-TS to disk. The
typical use is to tune into a channel and put it into record mode. The example
below - which is taken from the documentation - illustrates that::

        $ dvbv5-zap -c dvb_channel.conf "trilhas sonoras" -r
        using demux '/dev/dvb/adapter0/demux0'
        reading channels from file 'dvb_channel.conf'
        service has pid type 05:  204
        tuning to 573000000 Hz
        audio pid 104
          dvb_set_pesfilter 104
        Lock   (0x1f) Quality= Good Signal= 100.00% C/N= -13.80dB UCB= 70 postBER= 3.14x10^-3 PER= 0
        DVR interface '/dev/dvb/adapter0/dvr0' can now be opened

The channel can be watched by playing the contents of the DVR interface, with
some player that recognizes the MPEG-TS format, such as *mplayer* or *vlc*.

By playing the contents of the stream one can visually inspect the workings of
vidtv, e.g.::

	$ mplayer /dev/dvb/adapter0/dvr0

Daniel W. S. Almeida (4):
  media: vidtv: implement a tuner driver
  media: vidtv: implement a demodulator driver
  media: vidtv: add a bridge driver
  media: Documentation: vidtv: Add ReST documentation for vidtv

 .../driver-api/media/drivers/index.rst        |    1 +
 .../driver-api/media/drivers/vidtv.rst        |  417 ++++++
 MAINTAINERS                                   |    8 +
 drivers/media/test-drivers/Kconfig            |   16 +
 drivers/media/test-drivers/Makefile           |    1 +
 drivers/media/test-drivers/vidtv/Kconfig      |   11 +
 drivers/media/test-drivers/vidtv/Makefile     |    9 +
 .../media/test-drivers/vidtv/vidtv_bridge.c   |  547 ++++++++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |   60 +
 .../media/test-drivers/vidtv/vidtv_channel.c  |  360 ++++++
 .../media/test-drivers/vidtv/vidtv_channel.h  |   82 ++
 .../media/test-drivers/vidtv/vidtv_common.c   |   90 ++
 .../media/test-drivers/vidtv/vidtv_common.h   |   33 +
 .../media/test-drivers/vidtv/vidtv_demod.c    |  440 +++++++
 .../media/test-drivers/vidtv/vidtv_demod.h    |   73 ++
 .../media/test-drivers/vidtv/vidtv_encoder.h  |   99 ++
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  454 +++++++
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  154 +++
 drivers/media/test-drivers/vidtv/vidtv_pes.c  |  434 +++++++
 drivers/media/test-drivers/vidtv/vidtv_pes.h  |  243 ++++
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 1131 +++++++++++++++++
 drivers/media/test-drivers/vidtv/vidtv_psi.h  |  686 ++++++++++
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  663 ++++++++++
 .../media/test-drivers/vidtv/vidtv_s302m.h    |  136 ++
 drivers/media/test-drivers/vidtv/vidtv_ts.c   |  147 +++
 drivers/media/test-drivers/vidtv/vidtv_ts.h   |  138 ++
 .../media/test-drivers/vidtv/vidtv_tuner.c    |  427 +++++++
 .../media/test-drivers/vidtv/vidtv_tuner.h    |   43 +
 28 files changed, 6903 insertions(+)
 create mode 100644 Documentation/driver-api/media/drivers/vidtv.rst
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
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
