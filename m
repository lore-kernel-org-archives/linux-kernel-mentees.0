Return-Path: <SRS0=9k96=B4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32363C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Aug 2020 22:50:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA78E2065D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Aug 2020 22:50:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNQy9jcA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA78E2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ABEC285BDF;
	Tue, 18 Aug 2020 22:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xb049sSbSxuv; Tue, 18 Aug 2020 22:50:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AE0A885BB5;
	Tue, 18 Aug 2020 22:50:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A15A1C088B;
	Tue, 18 Aug 2020 22:50:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71B83C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 22:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 65C9286C5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 22:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AAw0naItHMTv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 22:50:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F1BEB86A10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 22:50:49 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id l13so10381268qvt.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Aug 2020 15:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=stvJSEiRQlkQk1xgxGeEI5VeClVnzATPsmgtcnuI91Y=;
 b=nNQy9jcADzVsy8w2nob4APiooUOhoqeqYoBLwzwcU7+V5rmI8M0dFVLhnLrXnVXCs1
 T3iFIxdy1fcgSiVuFl2PFqBna+SFmHtgH17eB+gmEwsx5hnbQrs/JSOCkJYA1N+fmkSv
 DuKW9Vqr8GHx/OkoLTztwpWW8EOz1i1dslrvytmQhGKB8DWhbQYhuc7URwImyXtzQeow
 Hdaf94W/qNBKwBrcyWPwMNHyUjoqKMyPMGs2AHgkm67tidcEVL7xuEXRaeCySwavzjE7
 VUG1z+6YtCddXDLDg70QqDPswoopgn28ChHSSHI4fGsrrfbzVC2PaQ4Bsf+cL1xPCcTD
 2hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=stvJSEiRQlkQk1xgxGeEI5VeClVnzATPsmgtcnuI91Y=;
 b=Y0OtfcX/agzQXM4ewf8WSjLQqSQXaXbE9KNJaHtCwehTxdlCH1Qnke8UF5Nw0YF3RD
 8/+gqaqKr4Y/dR7q6y+4RJQCs/cNHYYfv0TGPZxzxeKU/GToG4/2UNrJKGiRoEs/+UBG
 WkljyvB38aWBexb9zXI2f7XKlwfDzUHQu+Bk8uMgk8dEOFWEzhvhf1nLz/emUxSxgeAn
 sqjTBr6Qj40K2hDQbyMsS/pXpgLodYlEpETTm1eQCX6+IpHtqSnwHX0CMR1J+EuGjgyg
 T/b9gtRXD2qT5305/EEixvbwMgRP3bRfm055p7lNZVJMoYGMb1sZ3KI8mt2I/ZcBrnzQ
 yMPQ==
X-Gm-Message-State: AOAM531JweWIfJagzt73RfgE9Kn/bDzdtb85I8ZpX/CxCwChHmiZI/gT
 3cwiWqTsr4mRBRR9ZlUYvzU=
X-Google-Smtp-Source: ABdhPJxSq6PBUmtqppAEiA6LEO/D0duMhcF5PPgzELPA2JsT6QAUhFlndit2Tnh1ANzz71/V+BQvUw==
X-Received: by 2002:a0c:a9c6:: with SMTP id c6mr20074239qvb.151.1597791048669; 
 Tue, 18 Aug 2020 15:50:48 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id h13sm24566519qtu.7.2020.08.18.15.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 15:50:48 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org
Date: Tue, 18 Aug 2020 19:50:37 -0300
Message-Id: <20200818225041.1133770-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [v9 0/4] media: vidtv: Implement a virtual
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

Current state for this driver:
	- Driver generates PSI information (PAT, PMT, SDT)
	- Driver generates PCR packets
	- Driver generates NULL packets for padding
	- PCM audio stream is not decoded by ffmpeg yet


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
 .../driver-api/media/drivers/vidtv.rst        |  417 +++++
 MAINTAINERS                                   |    8 +
 drivers/media/test-drivers/Kconfig            |   16 +
 drivers/media/test-drivers/Makefile           |    1 +
 drivers/media/test-drivers/vidtv/Kconfig      |   11 +
 drivers/media/test-drivers/vidtv/Makefile     |    9 +
 .../media/test-drivers/vidtv/vidtv_bridge.c   |  548 +++++++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |   60 +
 .../media/test-drivers/vidtv/vidtv_channel.c  |  364 +++++
 .../media/test-drivers/vidtv/vidtv_channel.h  |   85 ++
 .../media/test-drivers/vidtv/vidtv_common.c   |   90 ++
 .../media/test-drivers/vidtv/vidtv_common.h   |   33 +
 .../media/test-drivers/vidtv/vidtv_demod.c    |  440 ++++++
 .../media/test-drivers/vidtv/vidtv_demod.h    |   73 +
 .../media/test-drivers/vidtv/vidtv_encoder.h  |   96 ++
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  479 ++++++
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  160 ++
 drivers/media/test-drivers/vidtv/vidtv_pes.c  |  396 +++++
 drivers/media/test-drivers/vidtv/vidtv_pes.h  |  189 +++
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 1350 +++++++++++++++++
 drivers/media/test-drivers/vidtv/vidtv_psi.h  |  593 ++++++++
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  627 ++++++++
 .../media/test-drivers/vidtv/vidtv_s302m.h    |  110 ++
 drivers/media/test-drivers/vidtv/vidtv_ts.c   |  137 ++
 drivers/media/test-drivers/vidtv/vidtv_ts.h   |  130 ++
 .../media/test-drivers/vidtv/vidtv_tuner.c    |  427 ++++++
 .../media/test-drivers/vidtv/vidtv_tuner.h    |   43 +
 28 files changed, 6893 insertions(+)
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
2.28.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
