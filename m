Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F2238BF7F
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  7 Jun 2026 11:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831641; cv=none; b=V8ntzCv0doU5pVXmbj/fzX9TAKk5w8DOuoWlpNOM4SNukdSbG9SwHhRTIMMlR2+Xlre6WT6HOPoMf9XwHEXWxtSLtZ+DdfzyS5HnyQiFvGyEOTAL+ZVUCjyTh79qMI3JArR79xb/2lIIhBHomzcbqxjlacjgFOYkykUT9y5sHds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831641; c=relaxed/simple;
	bh=EfjlZaSCk7Flr1YQsaFF4e4aJleZVR4m+pl1Kfqy4Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q6PyidCPReI7kMPsmwuMoXtlD01pflOYmVCd+YKhtLzNV7v93T30llK1TCsdNpaeQHTr0ajGexKtHSd9Gd0CKkDeo9e7zkhXK/gh9I3O7YjTdepC5cQWCJ9tnAX+v+IELYLmkO1zd5wJcI8zuQ8SQY/zoV3mYh2/qvQh4R1nlu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awD06b6h; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awD06b6h"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490ac357c55so39208285e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 07 Jun 2026 04:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780831636; x=1781436436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HvCm+mV31Pu8L6vlkqbl/FJGTVqj84fS7tWvLkjdltA=;
        b=awD06b6hWX6EdgSGWI/0JZw10Ab4zhc0gueW6YgXQvF9rrn3e+ybAglozMV+uXtsbt
         S4ZMzItS11EVQIfPgSIDfOSgDDtB4ihFPxR2m1aVaTtCoTm7AihtkI4VUWX/pgyn/8p/
         S2FmNKwAFhm8vxXyrswZOgT6kcMOGknwcH4y1Q486obpS5RLV0m74nQ6uxHUgDK1jtIQ
         G2lLVywwDe9KRqN2KCrCF/X4Kgpk7iT7NM9xS61ADjNPekbIhWBI6d4g7fuXKgdieTq9
         CtfuXrGm4hgo5osfbiYhTE4clPfzRTiaukeGf6YWw13ZazehK7Td+SiVUqPRuRNTmx55
         GhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780831636; x=1781436436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvCm+mV31Pu8L6vlkqbl/FJGTVqj84fS7tWvLkjdltA=;
        b=dAkB3fQIfWH1tILNG6+HonIn99pHjO9+MD7OA/MPfqdfJKVGXVYB9J0shijZ8NFDaP
         3esRdndhkFwQ7C6xb8GrloUr58eNBcli9LObSYSGO+vbU+px5tYOy9ngV1VkTTOEaGhz
         1sWFqhV50ihW7tMcNqhPxNq1XDXP0NMltbpUENR4FMxv2uPsw5jcG0nXwNFzMXRUcUP0
         wIRuG6qXMhPqLGJjyHJjMZ8d3L/QPMuvPZSo5PanEqyTb/4QUxcMlR9gOBLevqidmnNr
         hh6DUzjjWT4fJz9LQCZrq9Hbk0g2Vcsy9t7bbTGj2JRtmUQxZDmFRgrsVwL51/tpftya
         WwqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QRDKrHlMLbaI+w2I8s/OAepFYNXLwc2ry4UtD3JlRrvacXzMO3Eyf4hTY7k/giAE3WJORnu+ricWNaX/sm34B1fEaeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDjBJhAgL3g/vyQT0Rv6b4dpvl81JCsX16UGm15q/PeGNHwols
	fb7iIiiYfR4LsabbPv2tNt9g1kcAnURl654pgKgZkAzN8LGhDfMqMAel9gLyTw==
X-Gm-Gg: Acq92OEsaNv6ngIOakf8MJfoeqa4N3I7t7ffv1xiLhzn7EX2Edtii7P8hhaYkijoX6d
	shsK/DZFQ+Ll0Eawzde26KCmRqqvHhQmtIZFJWcnVR1/K2wvOAfkmoXGIHBL8bExaQKuQH5ISbz
	MPewaCPH/b9v7f5cEx59HCaD52umC/spodE8MdY8ovlqFGDT7nfJ3lRsVGdxisl3Ti532mGie3G
	mnEbl7pn1QA5ZOOgONUqrYPdj+DjmYH8MwVttggR0bS1jjTvp1ZxfOUAAs1JUigL9+3mCYSDhzB
	BqfFkOg7WpO1RC4X6aQ1XkE8lYY1OWCn4hUltnx5X2X7iLPSXpCebU477uQc7+tWEIydXMcss6u
	rjO3K6aFDEi/yoak2QwP1OyxZZqu3sFGXsLaQ2lmPcw0BhfNta75vPuIXPmZQYlwPrhMi5aZzFp
	Vqj0KprFn2fKtv3Rq6uQuairIDb7N6+pRXI1rcVupEqt4934aQi3Xca6yBQ6gHmZ5RJQ==
X-Received: by 2002:a05:600c:608e:b0:490:b355:9c8c with SMTP id 5b1f17b1804b1-490c25f3f00mr165837425e9.23.1780831635425;
        Sun, 07 Jun 2026 04:27:15 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([2a01:e11:5402:d840:f1ee:c5d:74e4:6e19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2c9ea37sm324586475e9.0.2026.06.07.04.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:27:14 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	shuah@kernel.org,
	joshua.crofts1@gmail.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v4] iio: tcs3472: implement wait time and sampling frequency
Date: Sun,  7 Jun 2026 13:27:13 +0200
Message-ID: <20260607112713.299968-1-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TCS3472 has a wait state controlled by the WEN bit in the ENABLE
register and the WAIT register, with an additional WLONG bit in CONFIG
that if set multiplies the wait step by 12. The driver previously
defined TCS3472_WTIME but never used it leaving the TODO comment on
the top of the source file.

Implement control of the wait time through IIO_CHAN_INFO_SAMP_FREQ:

  - Reading sampling_frequency returns the chip's current cycle time,
    computed as the sum of ATIME, the fixed RGBC initialization time
    and the wait time (which depends on WEN and WLONG).

  - Writing sampling_frequency programs WTIME so that the resulting
    cycle period approximates the requested frequency. If the
    requested frequency cannot be reached with any
    non-zero wait time, WEN is disabled and the chip runs
    back-to-back conversions at the maximum rate allowed by ATIME.
    If the requested period exceeds the maximum WTIME range, WLONG
    is enabled to extend the wait step from 2.4 ms to 28.8 ms.

  - The user's last requested frequency is stored in the driver's
    private data so that subsequent changes to integration_time
    recompute WTIME and preserve the requested sampling rate as
    closely as possible.

Add TCS3472_ENABLE_WEN, TCS3472_ENABLE_RUN and TCS3472_CONFIG_WLONG
bit definitions. TCS3472_ENABLE_RUN bundles the bits
(AEN | PON | WEN) that are simultaneously set when the chip is in
running state and cleared during powerdown, and is used by
tcs3472_probe(), tcs3472_powerdown().

Add a u8 enable_pre_suspend field to struct tcs3472_data:
tcs3472_powerdown() snapshots data->enable into it, and
tcs3472_resume() restores enable register content from the snapshot.
This preserves the user's WEN choice across suspend/resume.

Bound tcs3472_req_data() polling to the worst-case cycle time
(~8 seconds with ATIME=0x00, WTIME=0x00, WLONG=1).

Remove the "TODO: wait time" comment at the top of the file.

Reported-by: Sashiko <sashiko@lists.linux.dev>
Closes: https://sashiko.dev/#/patchset/20260522123420.45495-1-aldocontelk%40gmail.com
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
v4:
- Bound tcs3472_req_data() polling to the worst-case cycle time
  (~8 s)
- Add struct enable_pre_suspend field to struct tcs3472_data so
  tcs3472_powerdown() can snapshot the running ENABLE state and
  tcs3472_resume() can restore it intact, preserving the user's WEN
  choice across suspend/resume
- Split tcs3472_set_sampling_freq() into a public wrapper and an
  unlocked __tcs3472_set_sampling_freq() helper to keep ATIME and
  WTIME atomic in the INT_TIME case of write_raw().
- Take data->lock in read_raw() for SAMP_FREQ.
- Apply the compute / write / commit-on-success pattern in
  __tcs3472_set_sampling_freq(), tcs3472_probe() and the INT_TIME
  case of tcs3472_write_raw().
---
 drivers/iio/light/tcs3472.c | 280 +++++++++++++++++++++++++++++++++---
 1 file changed, 258 insertions(+), 22 deletions(-)

diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
index 1f597ca93697..f0c98dec3825 100644
--- a/drivers/iio/light/tcs3472.c
+++ b/drivers/iio/light/tcs3472.c
@@ -9,8 +9,6 @@
  * TCS34727)
  *
  * Datasheet: http://ams.com/eng/content/download/319364/1117183/file/TCS3472_Datasheet_EN_v2.pdf
- *
- * TODO: wait time
  */
 
 #include <linux/cleanup.h>
@@ -53,19 +51,28 @@
 #define TCS3472_STATUS_AINT BIT(4)
 #define TCS3472_STATUS_AVALID BIT(0)
 #define TCS3472_ENABLE_AIEN BIT(4)
+#define TCS3472_ENABLE_WEN BIT(3)
 #define TCS3472_ENABLE_AEN BIT(1)
 #define TCS3472_ENABLE_PON BIT(0)
+#define TCS3472_ENABLE_RUN						\
+	(TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON | TCS3472_ENABLE_WEN)
 #define TCS3472_CONTROL_AGAIN_MASK (BIT(0) | BIT(1))
+#define TCS3472_CONFIG_WLONG BIT(1)
 
 struct tcs3472_data {
 	struct i2c_client *client;
 	struct mutex lock;
+	int target_freq_hz;
+	int target_freq_uhz;
 	u16 low_thresh;
 	u16 high_thresh;
 	u8 enable;
+	u8 enable_pre_suspend;
 	u8 control;
 	u8 atime;
 	u8 apers;
+	u8 wtime;
+	bool wlong;
 };
 
 static const struct iio_event_spec tcs3472_events[] = {
@@ -91,6 +98,7 @@ static const struct iio_event_spec tcs3472_events[] = {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_CALIBSCALE) | \
 		BIT(IIO_CHAN_INFO_INT_TIME), \
+	.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ), \
 	.channel2 = IIO_MOD_LIGHT_##_color, \
 	.address = _addr, \
 	.scan_index = _si, \
@@ -114,9 +122,58 @@ static const struct iio_chan_spec tcs3472_channels[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(4),
 };
 
+/*
+ * The chip's cycle time is the sum of three components:
+ *   - ATIME: the programmable RGBC integration time.
+ *   - The fixed RGBC initialization time (2400 us).
+ *   - WTIME: the wait time, used only if WEN is set. If WLONG is active,
+ *     the wait step is multiplied by 12 (2400 us -> 28800 us).
+ */
+static unsigned int tcs3472_cycle_time_us(struct tcs3472_data *data)
+{
+	unsigned int atime_us = (256 - data->atime) * 2400;
+	unsigned int init_us = 2400;
+	unsigned int wtime_us;
+
+	if (!(data->enable & TCS3472_ENABLE_WEN))
+		wtime_us = 0;
+	else if (data->wlong)
+		wtime_us = (256 - data->wtime) * 28800;
+	else
+		wtime_us = (256 - data->wtime) * 2400;
+
+	return atime_us + init_us + wtime_us;
+}
+
+/*
+ * Convert a cycle time in microseconds to a frequency in Hz and microhertz.
+ *
+ * Given cycle_us = T (the cycle period in microseconds), the corresponding
+ * frequency is:
+ *   f = 1e6 / T  [Hz]
+ *
+ * The result is split into the IIO_VAL_INT_PLUS_MICRO format:
+ *   val  = floor(1e6 / T)                [Hz]
+ *   val2 = (1e6 mod T) * 1e6 / T         [microhertz]
+ */
+static void tcs3472_cycle_to_freq(unsigned int cycle_us, int *val, int *val2)
+{
+	*val = USEC_PER_SEC / cycle_us;
+	*val2 = div_u64((u64)(USEC_PER_SEC % cycle_us) * USEC_PER_SEC,
+			cycle_us);
+}
+
 static int tcs3472_req_data(struct tcs3472_data *data)
 {
-	int tries = 50;
+	/*
+	 * The worst-case cycle time is reached with ATIME=0x00, WTIME=0x00
+	 * and WLONG=1. So: 614 ms (Max Integration Time) + 2.4 ms (RGBC Init) +
+	 * 7.37 s (Max Wait Time) = ~ 8 s (Total Max cycle time).
+	 * Use that as a polling upper bound; in normal operation the loop
+	 * exits as soon as AVALID is set. So the total number of tries in 8
+	 * seconds considering a polling period of 20 ms is 400.
+	 */
+	int tries = 400;
 	int ret;
 
 	while (tries--) {
@@ -166,16 +223,147 @@ static int tcs3472_read_raw(struct iio_dev *indio_dev,
 		*val = 0;
 		*val2 = (256 - data->atime) * 2400;
 		return IIO_VAL_INT_PLUS_MICRO;
+	case IIO_CHAN_INFO_SAMP_FREQ: {
+		unsigned int cycle_us;
+
+		guard(mutex)(&data->lock);
+		cycle_us = tcs3472_cycle_time_us(data);
+		tcs3472_cycle_to_freq(cycle_us, val, val2);
+		return IIO_VAL_INT_PLUS_MICRO;
+	}
 	default:
 		return -EINVAL;
 	}
 }
 
+/*
+ * __tcs3472_set_sampling_freq() - implementation of sampling frequency
+ * configuration. The caller must hold data->lock.
+ */
+static int __tcs3472_set_sampling_freq(struct tcs3472_data *data,
+				       int val, int val2)
+{
+	unsigned int atime_us;
+	unsigned int init_us = 2400;
+	u64 cycle_us;
+	s64 wait_us;
+	int wtime;
+	bool wlong = false;
+	u8 config;
+	int ret;
+
+	if (val < 0 || val2 < 0 || (val == 0 && val2 == 0))
+		return -EINVAL;
+
+	atime_us = (256 - data->atime) * 2400;
+	cycle_us = div64_u64(PSEC_PER_SEC,
+			     (u64)val * USEC_PER_SEC + val2);
+
+	/*
+	 * wait_us can be negative when the requested frequency is too high
+	 * to be reached, or very large when the requested frequency is
+	 * close to zero. Use s64 to cover the full range:
+	 *
+	 *   cycle_us = PSEC_PER_SEC / (val * USEC_PER_SEC + val2)
+	 *
+	 * The divisor of the formula above reaches its maximum when
+	 * val = val2 = INT_MAX:
+	 *  INT_MAX * USEC_PER_SEC + INT_MAX = ~2.15e18
+	 * so cycle_us_min = floor(1e12 / 2.15e18) = 0.
+	 *
+	 * The divisor reaches its minimum (1) when val = 0 and val2 = 1,
+	 * so cycle_us_max = 1e12 / 1 = 1e12.
+	 *
+	 * Therefore:
+	 *   wait_us_min = 0 - 2400 - 612000 = -616800
+	 *   wait_us_max = 1e12 - 2400 - 2400 = 999999995200
+	 *
+	 * Both fit comfortably in s64.
+	 */
+	wait_us = (s64)cycle_us - init_us - atime_us;
+
+	if (wait_us < 2400) {
+		if (data->enable & TCS3472_ENABLE_WEN) {
+			u8 enable = data->enable & ~TCS3472_ENABLE_WEN;
+
+			ret = i2c_smbus_write_byte_data(data->client,
+							TCS3472_ENABLE, enable);
+			if (ret)
+				return ret;
+
+			data->enable = enable;
+		}
+
+		data->target_freq_hz = val;
+		data->target_freq_uhz = val2;
+		return 0;
+	}
+
+	/*
+	 * Wait state is needed: make sure WEN is active before programming
+	 * WTIME (and possibly WLONG).
+	 */
+	if (!(data->enable & TCS3472_ENABLE_WEN)) {
+		u8 enable = data->enable | TCS3472_ENABLE_WEN;
+
+		ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
+						enable);
+		if (ret)
+			return ret;
+
+		data->enable = enable;
+	}
+
+	wtime = 256 - DIV_ROUND_CLOSEST_ULL(wait_us, 2400);
+	if (wtime < 0) {
+		wlong = true;
+		wtime = 256 - DIV_ROUND_CLOSEST_ULL(wait_us, 28800);
+	}
+	wtime = clamp(wtime, 0, 255);
+
+	if (wlong != data->wlong) {
+		ret = i2c_smbus_read_byte_data(data->client, TCS3472_CONFIG);
+		if (ret < 0)
+			return ret;
+
+		config = ret;
+		if (wlong)
+			config |= TCS3472_CONFIG_WLONG;
+		else
+			config &= ~TCS3472_CONFIG_WLONG;
+
+		ret = i2c_smbus_write_byte_data(data->client, TCS3472_CONFIG,
+						config);
+		if (ret)
+			return ret;
+
+		data->wlong = wlong;
+	}
+
+	ret = i2c_smbus_write_byte_data(data->client, TCS3472_WTIME, wtime);
+	if (ret)
+		return ret;
+
+	data->wtime = wtime;
+	data->target_freq_hz = val;
+	data->target_freq_uhz = val2;
+
+	return 0;
+}
+
+static int tcs3472_set_sampling_freq(struct tcs3472_data *data,
+				     int val, int val2)
+{
+	guard(mutex)(&data->lock);
+	return __tcs3472_set_sampling_freq(data, val, val2);
+}
+
 static int tcs3472_write_raw(struct iio_dev *indio_dev,
 			       struct iio_chan_spec const *chan,
 			       int val, int val2, long mask)
 {
 	struct tcs3472_data *data = iio_priv(indio_dev);
+	int ret;
 	int i;
 
 	switch (mask) {
@@ -196,15 +384,31 @@ static int tcs3472_write_raw(struct iio_dev *indio_dev,
 		if (val != 0)
 			return -EINVAL;
 		for (i = 0; i < 256; i++) {
-			if (val2 == (256 - i) * 2400) {
-				data->atime = i;
-				return i2c_smbus_write_byte_data(
-					data->client, TCS3472_ATIME,
-					data->atime);
-			}
-
+			if (val2 != (256 - i) * 2400)
+				continue;
+
+			guard(mutex)(&data->lock);
+
+			ret = i2c_smbus_write_byte_data(data->client,
+							TCS3472_ATIME, i);
+			if (ret)
+				return ret;
+
+			data->atime = i;
+
+			/*
+			 * ATIME just changed, so the cycle time changed too.
+			 * Re-run the sampling frequency logic to recompute
+			 * WTIME and preserve the user's last requested
+			 * frequency. Lock is already held.
+			 */
+			return __tcs3472_set_sampling_freq(data,
+							 data->target_freq_hz,
+							 data->target_freq_uhz);
 		}
 		return -EINVAL;
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		return tcs3472_set_sampling_freq(data, val, val2);
 	default:
 		return -EINVAL;
 	}
@@ -434,17 +638,16 @@ static const struct iio_info tcs3472_info = {
 static int tcs3472_powerdown(struct tcs3472_data *data)
 {
 	int ret;
-	u8 enable_mask = TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON;
 
 	guard(mutex)(&data->lock);
 
+	data->enable_pre_suspend = data->enable;
+
 	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
-					data->enable & ~enable_mask);
+					data->enable & ~TCS3472_ENABLE_RUN);
 	if (ret)
 		return ret;
 
-	data->enable &= ~enable_mask;
-
 	return 0;
 }
 
@@ -458,7 +661,9 @@ static int tcs3472_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct tcs3472_data *data;
 	struct iio_dev *indio_dev;
+	unsigned int cycle_us;
 	int ret;
+	u8 enable;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!indio_dev)
@@ -498,6 +703,16 @@ static int tcs3472_probe(struct i2c_client *client)
 		return ret;
 	data->atime = ret;
 
+	ret = i2c_smbus_read_byte_data(data->client, TCS3472_WTIME);
+	if (ret < 0)
+		return ret;
+	data->wtime = ret;
+
+	ret = i2c_smbus_read_byte_data(data->client, TCS3472_CONFIG);
+	if (ret < 0)
+		return ret;
+	data->wlong = (ret & TCS3472_CONFIG_WLONG) ? 1 : 0;
+
 	ret = i2c_smbus_read_word_data(data->client, TCS3472_AILT);
 	if (ret < 0)
 		return ret;
@@ -518,14 +733,30 @@ static int tcs3472_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	/* enable device */
-	data->enable = ret | TCS3472_ENABLE_PON | TCS3472_ENABLE_AEN;
-	data->enable &= ~TCS3472_ENABLE_AIEN;
-	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
-		data->enable);
+	/*
+	 * Enable the chip in its full running state, including WEN. The
+	 * actual wait time is controlled by the WTIME and WLONG registers,
+	 * which retain their power-on defaults until userspace writes to
+	 * sampling_frequency.
+	 */
+	enable = (ret | TCS3472_ENABLE_RUN) & ~TCS3472_ENABLE_AIEN;
+
+	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE, enable);
 	if (ret < 0)
 		return ret;
 
+	data->enable = enable;
+
+	/*
+	 * Initialize target frequency from the chip's current state so that
+	 * subsequent integration_time changes via IIO_CHAN_INFO_INT_TIME can
+	 * preserve a meaningful sampling rate, even before userspace writes
+	 * sampling_frequency for the first time.
+	 */
+	cycle_us = tcs3472_cycle_time_us(data);
+	tcs3472_cycle_to_freq(cycle_us, &data->target_freq_hz,
+			      &data->target_freq_uhz);
+
 	ret = devm_add_action_or_reset(dev, tcs3472_powerdown_action, data);
 	if (ret)
 		return ret;
@@ -561,16 +792,21 @@ static int tcs3472_resume(struct device *dev)
 	struct tcs3472_data *data = iio_priv(i2c_get_clientdata(
 		to_i2c_client(dev)));
 	int ret;
-	u8 enable_mask = TCS3472_ENABLE_AEN | TCS3472_ENABLE_PON;
 
 	guard(mutex)(&data->lock);
 
+	/*
+	 * Restore the full ENABLE register from the snapshot taken in
+	 * tcs3472_powerdown(). This preserves the user's last
+	 * sampling_frequency configuration (in particular the WEN bit)
+	 * across suspend/resume.
+	 */
 	ret = i2c_smbus_write_byte_data(data->client, TCS3472_ENABLE,
-		data->enable | enable_mask);
+					data->enable_pre_suspend);
 	if (ret)
 		return ret;
 
-	data->enable |= enable_mask;
+	data->enable = data->enable_pre_suspend;
 
 	return 0;
 }
-- 
2.54.0

