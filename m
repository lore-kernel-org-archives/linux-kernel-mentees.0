Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22499C77B7C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 May 2023 18:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FDFC4161D;
	Sun, 21 May 2023 18:32:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FDFC4161D
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oeRP94lm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q__cA8zZzQ3s; Sun, 21 May 2023 18:32:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BDBE541862;
	Sun, 21 May 2023 18:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDBE541862
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A92AC008B;
	Sun, 21 May 2023 18:32:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9631EC0035
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 May 2023 18:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 714E6405B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 May 2023 18:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 714E6405B0
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=oeRP94lm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbgjeoy-ypZs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 May 2023 18:32:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FB7540148
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FB7540148
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 May 2023 18:32:45 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94ea38c90ccso38274966b.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 May 2023 11:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684693964; x=1687285964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DJyNPSTUUMs7c0Obxl2iPIkMqeFcBT3JyMI/OJTExCU=;
 b=oeRP94lmPulozu6xqgST0HHsh50XkoJI9n4qE1bIWCh6jzYkr0N9NXExuGmniBYAPX
 ZRKojyQHqCtykyyhW67rgGWuG69ji5zTpG9sXciU5W67in4bMVzGQ3+mvoP4qilldF7M
 qAPtnXkcBle1gINtmWl0H6k47GolhPMrlHRgiR/AXd4wDlyrosCgttywKoKP6iVOA577
 vcq+MeuJyzz+mt489EyLamaXEOhUn/QjzwnY34UDAOqi5UScKK0cToA05tOz0RmOsUTh
 P5WbvjErp1zf+R8ZtQ2JMAsm7Et0Nu1quGf/0WINsDUOpcxwrkGZZi5s90oJ1hWCp8wE
 09bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684693964; x=1687285964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DJyNPSTUUMs7c0Obxl2iPIkMqeFcBT3JyMI/OJTExCU=;
 b=DRIJwiVY1sORyx+o5SahZLf/LXvt6vF1wWR1AKku/bI2XXbBFGlbiX4B/1oHsuVVtB
 MlWi9fRfh925vJDcJwy+N0FvSuIAh4R3pK0Lf8i9aLJK+lManeZGI8ebraUQYDS6G4c8
 40d1XGuaa4rQtp9RdDMQdS8oUpW5fG3/eO8zludLiuRLb9SazM3qIBGwycnbmI2qdLdQ
 Lf3QXWLZ/W80KKhdcy4k/LzcIq/ODDZatCxXj/ENUDckjVKJmZV50FAXBkOJV0uxz2aF
 Waq5DxYE2ctNZ6D49Z/urfEEnfSf+0BNs1FIOOjbdZllEnwGyWlkI1B7rQXJGwZ47zxW
 84lg==
X-Gm-Message-State: AC+VfDx1f/Ldrgp/x6MkPrW+ZDtf83lE43/5iCx1GeHQJtFE0wtw9LAy
 /lDQUrxsam4BR6cpJiL+SdW4FRHcSiM=
X-Google-Smtp-Source: ACHHUZ5tZW02l7qh1zYz1oas2FtUVTMTsN9MEpoDHXP7SP6vSX/umWDeP7xhLcIi562KWZV15xQR5A==
X-Received: by 2002:a17:906:6495:b0:8d2:78c5:1d4e with SMTP id
 e21-20020a170906649500b008d278c51d4emr8723407ejm.5.1684693964448; 
 Sun, 21 May 2023 11:32:44 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([141.136.93.87])
 by smtp.gmail.com with ESMTPSA id
 mc20-20020a170906eb5400b0096f803afbe3sm2194252ejb.66.2023.05.21.11.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 11:32:44 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz, tiwai@suse.com, corbet@lwn.net, broonie@kernel.org,
 skhan@linuxfoundation.org
Subject: [PATCH v2 3/3] selftests: ALSA: Add test for the 'pcmtest' driver
Date: Sun, 21 May 2023 22:32:18 +0400
Message-Id: <20230521183218.9641-3-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230521183218.9641-1-ivan.orlov0322@gmail.com>
References: <20230521183218.9641-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Ivan Orlov <ivan.orlov0322@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

This test covers the new Virtual PCM Test Driver, including the capturing,
playback and ioctl redefinition functionalities for both interleaved and
non-interleaved access modes. This test is also helpful as an usage example
of the 'pcmtest' driver.

We have a lot of different virtual media drivers, which can be used for
testing of the userspace applications and media subsystem middle layer.
However, all of them are aimed at testing the video functionality and
simulating the video devices. For audio devices we have only snd-dummy
module, which is good in simulating the correct behavior of an ALSA device.
I decided to write a tool, which would help to test the userspace ALSA
programs (and the PCM middle layer as well) under unusual circumstances
to figure out how they would behave. So I came up with this Virtual PCM
Test Driver.

This new Virtual PCM Test Driver has several features which can be useful
during the userspace ALSA applications testing/fuzzing, or testing/fuzzing
of the PCM middle layer. Not all of them can be implemented using the
existing virtual drivers (like dummy or loopback). Here is what can this
driver do:

- Simulate both capture and playback processes
- Generate random or pattern-based capture data
- Check the playback stream for containing the looped pattern
- Inject delays into the playback and capturing processes
- Inject errors during the PCM callbacks

Also, this driver can check the playback stream for containing the
predefined pattern, which is used in the corresponding selftest to check
the PCM middle layer data transferring functionality. Additionally, this
driver redefines the default RESET ioctl, and the selftest covers this PCM
API functionality as well.

After all, I think this driver would be a good start, and I believe in the
future we will see more virtual sound drivers.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
V1 -> V2:

- Rename the driver from 'valsa' to 'pcmtest'.
- Implement support for interleaved and non-interleaved access modes
- Add support for 8 substreams and 4 channels
- Extend supported formats
- Extend and rewrite in C the selftest for the driver

 tools/testing/selftests/alsa/Makefile         |   2 +-
 .../selftests/alsa/test-pcmtest-driver.c      | 323 ++++++++++++++++++
 2 files changed, 324 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/alsa/test-pcmtest-driver.c

diff --git a/tools/testing/selftests/alsa/Makefile b/tools/testing/selftests/alsa/Makefile
index 901949db80ad..5af9ba8a4645 100644
--- a/tools/testing/selftests/alsa/Makefile
+++ b/tools/testing/selftests/alsa/Makefile
@@ -12,7 +12,7 @@ LDLIBS+=-lpthread
 
 OVERRIDE_TARGETS = 1
 
-TEST_GEN_PROGS := mixer-test pcm-test
+TEST_GEN_PROGS := mixer-test pcm-test test-pcmtest-driver
 
 TEST_GEN_PROGS_EXTENDED := libatest.so
 
diff --git a/tools/testing/selftests/alsa/test-pcmtest-driver.c b/tools/testing/selftests/alsa/test-pcmtest-driver.c
new file mode 100644
index 000000000000..47256e58db93
--- /dev/null
+++ b/tools/testing/selftests/alsa/test-pcmtest-driver.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This is the test which covers PCM middle layer data transferring using
+ * the virtual pcm test driver (snd-pcmtest).
+ *
+ * Copyright 2023 Ivan Orlov <ivan.orlov0322@gmail.com>
+ */
+#include <string.h>
+#include <alsa/asoundlib.h>
+#include "../kselftest_harness.h"
+
+#define NI_CH 4
+
+static char pattern_buf[4096];
+static unsigned int pattern_len;
+
+struct pcmtest_test_params {
+	unsigned long buffer_size;
+	unsigned long period_size;
+	unsigned long channels;
+	unsigned int rate;
+	snd_pcm_access_t access;
+	size_t sample_len;
+	int time;
+	snd_pcm_format_t format;
+};
+
+static int read_pattern(void)
+{
+	FILE *fp, *fpl;
+
+	fpl = fopen("/sys/kernel/debug/pcmtest/pattern_len", "r");
+	if (!fpl)
+		return -1;
+	fscanf(fpl, "%u", &pattern_len);
+	fclose(fpl);
+
+	fp = fopen("/sys/kernel/debug/pcmtest/fill_pattern", "r");
+	if (!fp) {
+		fclose(fpl);
+		return -1;
+	}
+	fread(pattern_buf, 1, pattern_len, fp);
+	fclose(fp);
+
+	return 0;
+}
+
+static int get_test_results(char *debug_name)
+{
+	int result;
+	FILE *f;
+	char fname[128];
+
+	sprintf(fname, "/sys/kernel/debug/pcmtest/%s", debug_name);
+
+	f = fopen(fname, "r");
+	if (!f) {
+		printf("Failed to open file\n");
+		return -1;
+	}
+	fscanf(f, "%d", &result);
+	fclose(f);
+
+	return result;
+}
+
+static size_t get_sample_len(unsigned int rate, unsigned long channels, snd_pcm_format_t format)
+{
+	return rate * channels * snd_pcm_format_physical_width(format) / 8;
+}
+
+static int setup_handle(snd_pcm_t **handle, snd_pcm_sw_params_t *swparams,
+			snd_pcm_hw_params_t *hwparams, struct pcmtest_test_params *params,
+			int card, snd_pcm_stream_t stream)
+{
+	char pcm_name[32];
+	int err;
+
+	sprintf(pcm_name, "hw:%d,0,0", card);
+	err = snd_pcm_open(handle, pcm_name, stream, 0);
+	if (err < 0)
+		return err;
+	snd_pcm_hw_params_any(*handle, hwparams);
+	snd_pcm_hw_params_set_rate_resample(*handle, hwparams, 0);
+	snd_pcm_hw_params_set_access(*handle, hwparams, params->access);
+	snd_pcm_hw_params_set_format(*handle, hwparams, params->format);
+	snd_pcm_hw_params_set_channels(*handle, hwparams, params->channels);
+	snd_pcm_hw_params_set_rate_near(*handle, hwparams, &params->rate, 0);
+	snd_pcm_hw_params_set_period_size_near(*handle, hwparams, &params->period_size, 0);
+	snd_pcm_hw_params_set_buffer_size_near(*handle, hwparams, &params->buffer_size);
+	snd_pcm_hw_params(*handle, hwparams);
+	snd_pcm_sw_params_current(*handle, swparams);
+
+	snd_pcm_hw_params_set_rate_resample(*handle, hwparams, 0);
+	snd_pcm_sw_params_set_avail_min(*handle, swparams, params->period_size);
+	snd_pcm_hw_params_set_buffer_size_near(*handle, hwparams, &params->buffer_size);
+	snd_pcm_hw_params_set_period_size_near(*handle, hwparams, &params->period_size, 0);
+	snd_pcm_sw_params(*handle, swparams);
+	snd_pcm_hw_params(*handle, hwparams);
+
+	return 0;
+}
+
+FIXTURE(pcmtest) {
+	int card;
+	snd_pcm_sw_params_t *swparams;
+	snd_pcm_hw_params_t *hwparams;
+	struct pcmtest_test_params params;
+};
+
+FIXTURE_TEARDOWN(pcmtest) {
+}
+
+FIXTURE_SETUP(pcmtest) {
+	char *card_name;
+	int err;
+
+	if (geteuid())
+		SKIP(exit(-1), "This test needs root to run!");
+
+	err = read_pattern();
+	if (err)
+		SKIP(exit(-1), "Can't read pattern. Probably, module isn't loaded");
+
+	card_name = malloc(127);
+	ASSERT_NE(card_name, NULL);
+	self->params.buffer_size = 16384;
+	self->params.period_size = 4096;
+	self->params.channels = 1;
+	self->params.rate = 8000;
+	self->params.access = SND_PCM_ACCESS_RW_INTERLEAVED;
+	self->params.format = SND_PCM_FORMAT_S16_LE;
+	self->card = -1;
+
+	self->params.sample_len = get_sample_len(self->params.rate, self->params.channels,
+						 self->params.format);
+	self->params.time = 4;
+
+	while (snd_card_next(&self->card) >= 0) {
+		if (self->card == -1)
+			break;
+		snd_card_get_name(self->card, &card_name);
+		if (!strcmp(card_name, "PCM-Test"))
+			break;
+	}
+	free(card_name);
+	ASSERT_NE(self->card, -1);
+}
+
+/*
+ * Here we are trying to send the looped monotonically increasing sequence of bytes to the driver.
+ * If our data isn't corrupted, the driver will set the content of 'pc_test' debugfs file to '1'
+ */
+TEST_F(pcmtest, playback) {
+	snd_pcm_t *handle;
+	unsigned char *it;
+	size_t write_res;
+	int test_results;
+	int i;
+	unsigned short *rsamples;
+	void *samples;
+	struct pcmtest_test_params *params = &self->params;
+
+	samples = calloc(self->params.sample_len * self->params.time, 1);
+	ASSERT_NE(samples, NULL);
+
+	snd_pcm_sw_params_alloca(&self->swparams);
+	snd_pcm_hw_params_alloca(&self->hwparams);
+
+	ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams, params,
+			       self->card, SND_PCM_STREAM_PLAYBACK), 0);
+	snd_pcm_format_set_silence(params->format, samples,
+				   params->rate * params->channels * params->time);
+	it = samples;
+	for (i = 0; i < self->params.sample_len * params->time; i++)
+		it[i] = pattern_buf[i % pattern_len];
+	rsamples = samples;
+	for (i = 0; i < params->time; i++) {
+		write_res = snd_pcm_writei(handle, rsamples, params->rate);
+		rsamples += params->rate;
+		ASSERT_GE(write_res, 0);
+	}
+
+	snd_pcm_close(handle);
+	free(samples);
+	test_results = get_test_results("pc_test");
+	ASSERT_EQ(test_results, 1);
+}
+
+/*
+ * Here we test that the virtual alsa driver returns looped and monotonically increasing sequence
+ * of bytes
+ */
+TEST_F(pcmtest, capture) {
+	snd_pcm_t *handle;
+	unsigned char *it;
+	size_t read_res;
+	int i;
+	void *samples;
+	unsigned short *rsamples;
+	struct pcmtest_test_params *params = &self->params;
+
+	samples = calloc(self->params.sample_len * self->params.time, 1);
+	ASSERT_NE(samples, NULL);
+
+	snd_pcm_sw_params_alloca(&self->swparams);
+	snd_pcm_hw_params_alloca(&self->hwparams);
+
+	ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams,
+			       params, self->card, SND_PCM_STREAM_CAPTURE), 0);
+	snd_pcm_format_set_silence(params->format, samples,
+				   params->rate * params->channels * params->time);
+	rsamples = samples;
+	for (i = 0; i < params->time; i++) {
+		read_res = snd_pcm_readi(handle, rsamples, params->rate);
+		rsamples += params->rate;
+		ASSERT_GE(read_res, 0);
+	}
+	snd_pcm_close(handle);
+	it = (unsigned char *)samples;
+	for (i = 0; i < self->params.sample_len * self->params.time; i++)
+		ASSERT_EQ(it[i], pattern_buf[i % pattern_len]);
+	free(samples);
+}
+
+// Test capture in the non-interleaved access mode.
+TEST_F(pcmtest, ni_capture) {
+	snd_pcm_t *handle;
+	struct pcmtest_test_params params = self->params;
+	char **chan_samples;
+	size_t i, j, read_res;
+
+	params.channels = NI_CH;
+	chan_samples = calloc(NI_CH, sizeof(*chan_samples));
+	ASSERT_NE(chan_samples, NULL);
+
+	snd_pcm_sw_params_alloca(&self->swparams);
+	snd_pcm_hw_params_alloca(&self->hwparams);
+
+	params.access = SND_PCM_ACCESS_RW_NONINTERLEAVED;
+
+	ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams,
+			       &params, self->card, SND_PCM_STREAM_CAPTURE), 0);
+
+	for (i = 0; i < NI_CH; i++)
+		chan_samples[i] = calloc(params.sample_len * params.time, 1);
+
+	for (i = 0; i < 1; i++) {
+		read_res = snd_pcm_readn(handle, (void **)chan_samples, params.rate * params.time);
+		ASSERT_GE(read_res, 0);
+	}
+	snd_pcm_close(handle);
+
+	for (i = 0; i < NI_CH; i++) {
+		for (j = 0; j < params.rate * params.time; j++)
+			ASSERT_EQ(chan_samples[i][j], pattern_buf[j % pattern_len]);
+		free(chan_samples[i]);
+	}
+	free(chan_samples);
+}
+
+TEST_F(pcmtest, ni_playback) {
+	snd_pcm_t *handle;
+	struct pcmtest_test_params params = self->params;
+	char **chan_samples;
+	size_t i, j, read_res;
+	int test_res;
+
+	params.channels = NI_CH;
+	chan_samples = calloc(NI_CH, sizeof(*chan_samples));
+	ASSERT_NE(chan_samples, NULL);
+
+	snd_pcm_sw_params_alloca(&self->swparams);
+	snd_pcm_hw_params_alloca(&self->hwparams);
+
+	params.access = SND_PCM_ACCESS_RW_NONINTERLEAVED;
+
+	ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams,
+			       &params, self->card, SND_PCM_STREAM_PLAYBACK), 0);
+
+	for (i = 0; i < NI_CH; i++) {
+		chan_samples[i] = calloc(params.sample_len * params.time, 1);
+		for (j = 0; j < params.sample_len * params.time; j++)
+			chan_samples[i][j] = pattern_buf[j % pattern_len];
+	}
+
+	for (i = 0; i < 1; i++) {
+		read_res = snd_pcm_writen(handle, (void **)chan_samples, params.rate * params.time);
+		ASSERT_GE(read_res, 0);
+	}
+
+	snd_pcm_close(handle);
+	test_res = get_test_results("pc_test");
+	ASSERT_EQ(test_res, 1);
+
+	for (i = 0; i < NI_CH; i++)
+		free(chan_samples[i]);
+	free(chan_samples);
+}
+
+/*
+ * Here we are testing the custom ioctl definition inside the virtual driver. If it triggers
+ * successfully, the driver sets the content of 'ioctl_test' debugfs file to '1'.
+ */
+TEST_F(pcmtest, reset_ioctl) {
+	snd_pcm_t *handle;
+	unsigned char *it;
+	int test_res;
+	struct pcmtest_test_params *params = &self->params;
+
+	snd_pcm_sw_params_alloca(&self->swparams);
+	snd_pcm_hw_params_alloca(&self->hwparams);
+
+	ASSERT_EQ(setup_handle(&handle, self->swparams, self->hwparams, params,
+			       self->card, SND_PCM_STREAM_CAPTURE), 0);
+	snd_pcm_reset(handle);
+	test_res = get_test_results("ioctl_test");
+	ASSERT_EQ(test_res, 1);
+	snd_pcm_close(handle);
+}
+
+TEST_HARNESS_MAIN
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
