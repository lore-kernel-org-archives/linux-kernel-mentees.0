Return-Path: <SRS0=N6Le=6Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2D1C47256
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 03:22:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 636AB20731
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 May 2020 03:22:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmFwTdgv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 636AB20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 39DA1873F0;
	Sat,  2 May 2020 03:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uoCtXEFixjI8; Sat,  2 May 2020 03:22:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 884A987286;
	Sat,  2 May 2020 03:22:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A860C0864;
	Sat,  2 May 2020 03:22:30 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5213C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D548F8844C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kU3Nf2vqwRY2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AE9AB883CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 May 2020 03:22:28 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id s9so8520292qkm.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 01 May 2020 20:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qiwM8YuY++j6Qywzk7l2v88t8lfc2timetql0FUntf0=;
 b=AmFwTdgv/5go8FbghU+zeou6QNFBRuMQ0VWLqZLj6PtheexVMLvnAMpO6pj3VCTxmA
 b3H57HtlfMK6qOJvjhbZoy0XWIywF8uEdu+D4RtWNzNC/m74E23Wu/N9I/CUcc825ImT
 kNbS3csbDeSaTHoA6mXBVeuXTLGbVeaImzfHVA5mziTKaKWH6yHxyUJigRUHDq9/iRjx
 PpKFKYw2i3EFrF6nepjDnL3PDusqCLK7FoS87zVtrmQxa9LevqY6XOnXgculX0EBTYwL
 V3usrrd8sRJJgyisQkpPuIy5LYiqWtrVJqOFh90OZ0vDf+cusSbX7i6SqsBWUQbIR2Yw
 2P1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qiwM8YuY++j6Qywzk7l2v88t8lfc2timetql0FUntf0=;
 b=EHV27NHGeW3nr9GjEDYHcKO/4ZVNaY4uAnqLJppthjVGjFBWuYyF8GuWORjtk6GXGR
 6s2GaS8h6lXG5f2otYOWfAJHsz0tN+M4DFouWcvjiln9uTPGRHcAO/nGRCDZUpSyEctn
 5NU0A2QTEjMzSUTynLEwXB6HN4t9l+xz5yl8EE477+c7rTDOiqqI2C3paCmZzy42k8Hr
 nrSww+UWnv5JbF/0ZDGqD/at27Ds1QMgwQSyEdm0rpsLZtMbad1dV4pS1tZ6nNxFx8hZ
 lANdohUFZV8kpMWx/TuzmQdy7ZsjQep44Yf0vL8c3QX38hto4fmugWDToDarRIIRTXbp
 N3Pw==
X-Gm-Message-State: AGi0PuZBQwIyHk+WLgNfzAUYgpoNRpFvPqoC2YLTJrUVomXtmDSVOCG2
 mzL5I8HRkx8TRtNJjoAErHU=
X-Google-Smtp-Source: APiQypL6aoL3SPLd1zGUq5eZin3g5GpQefi02P+yIjq+YghEc+iEMYrLVUCPy3jBFKyatJHZtZUd0g==
X-Received: by 2002:a05:620a:239:: with SMTP id
 u25mr5985234qkm.304.1588389747447; 
 Fri, 01 May 2020 20:22:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:18:602b:723a:1b2a:57a1:a611:34ed])
 by smtp.gmail.com with ESMTPSA id
 c41sm4410399qta.96.2020.05.01.20.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 20:22:26 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+huawei@kernel.org, sean@mess.org, kstewart@linuxfoundation.org,
 allison@lohutok.net, tglx@linutronix.de
Date: Sat,  2 May 2020 00:22:05 -0300
Message-Id: <20200502032216.197977-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [RFC, WIP,
	v4 00/11] media: vidtv: implement a virtual DVB driver
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

This series currently adds:
-fake tuner, demodulator and bridge drivers
-a PSI generator
-a PES/TS packetizer
-a SMPTE 302m encoder, capable of encoding AES3 audio into MPEG TS
-a barebones TS mux abstraction

I appreciate any feedback!

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


Daniel W. S. Almeida (11):
  media: vidtv: add Kconfig entry
  media: vidtv: implement a tuner driver
  media: vidtv: implement a demodulator driver
  media: vidtv: move config structs into a separate header
  media: vidtv: add a bridge driver
  media: vidtv: add wrappers for memcpy and memset
  media: vidtv: add MPEG TS common code
  media: vidtv: implement a PSI generator
  media: vidtv: implement a PES packetizer
  media: vidtv: Implement a SMPTE 302M encoder
  media: vidtv: Add a MPEG Transport Stream Multiplexer

 drivers/media/test-drivers/Kconfig            |   10 +
 drivers/media/test-drivers/Makefile           |    1 +
 drivers/media/test-drivers/vidtv/Kconfig      |   11 +
 drivers/media/test-drivers/vidtv/Makefile     |    7 +
 .../media/test-drivers/vidtv/vidtv_bridge.c   |  442 +++++++
 .../media/test-drivers/vidtv/vidtv_bridge.h   |   39 +
 .../media/test-drivers/vidtv/vidtv_channel.c  |  326 +++++
 .../media/test-drivers/vidtv/vidtv_channel.h  |   66 +
 .../media/test-drivers/vidtv/vidtv_common.c   |   51 +
 .../media/test-drivers/vidtv/vidtv_common.h   |   35 +
 .../media/test-drivers/vidtv/vidtv_config.h   |   35 +
 .../media/test-drivers/vidtv/vidtv_demod.c    |  494 +++++++
 .../media/test-drivers/vidtv/vidtv_demod.h    |   34 +
 .../media/test-drivers/vidtv/vidtv_encoder.h  |  103 ++
 drivers/media/test-drivers/vidtv/vidtv_mux.c  |  423 ++++++
 drivers/media/test-drivers/vidtv/vidtv_mux.h  |  105 ++
 drivers/media/test-drivers/vidtv/vidtv_pes.c  |  429 ++++++
 drivers/media/test-drivers/vidtv/vidtv_pes.h  |  185 +++
 drivers/media/test-drivers/vidtv/vidtv_psi.c  | 1155 +++++++++++++++++
 drivers/media/test-drivers/vidtv/vidtv_psi.h  |  362 ++++++
 .../media/test-drivers/vidtv/vidtv_s302m.c    |  608 +++++++++
 .../media/test-drivers/vidtv/vidtv_s302m.h    |   99 ++
 drivers/media/test-drivers/vidtv/vidtv_ts.c   |  130 ++
 drivers/media/test-drivers/vidtv/vidtv_ts.h   |  103 ++
 .../media/test-drivers/vidtv/vidtv_tuner.c    |  403 ++++++
 25 files changed, 5656 insertions(+)
 create mode 100644 drivers/media/test-drivers/vidtv/Kconfig
 create mode 100644 drivers/media/test-drivers/vidtv/Makefile
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_bridge.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_channel.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.c
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_common.h
 create mode 100644 drivers/media/test-drivers/vidtv/vidtv_config.h
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

-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
