Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779415;
	b=MJ7MBKzVi7xPMvcy1ftj+OIWpZcI7hbFvGDypWFmyWFlqP5UNrgX8PP9pqz4VG2ooMwp
	 kslsvMxSoYPpc9g3XAqVwjL91OTkAzb22vW+HoQYVsOG+WOxvlvRm29k7sRcR6Nu/dfgM
	 KwjL4DggHFRnRmMfyYYBaHa4tiwZ75LhmK6NFvHwpYHXXCOM/iFIaCwW+ooh88vHPQ/QK
	 CnwBcnVAZxw44lqayaa2HJ4Xpy56K/ntkx3Tl7G627iIy2FMnKN5/kIUcGqd7INCNaUtT
	 a/Z7Be/NAhDDERFsu3l0db/aezQ/WFJg8zre5ZmVRkAHn34pc0x2ZXmFfIGDQp5jfkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DKhKnChRRvEIqs8abBQ2ImMZ5jJiR20dxd3W+JwXAzQ=;
	b=5s6MSK79tIJ41Xy/j1xx3WNHKXw58++cZa+ubRo26OmlmZaeAFae3nZOhQ7GeWRz7Vi6
	 gh64ViKkkazxmow7g1dtxvuLvDMm+1BkhajjD8jPK1iTWQODP4LX66S2pT4ridCy8yZnH
	 ro2YhosQ1kwpcI5K4CSAU5dWIHnbn3yYYi1Axn2vRBHle2bJ7GI/EAXj0zBJD5JkadQAo
	 kJ2/9Bq4HZwVFizidszJkrTWlj8sb2MlfQGL3fwyBt7ekj5FT3GP9ARGFNxY07ZhYwpuP
	 BbV0xUl32bwwq3bjY636r7ClvD/9sdU9/PEt6ix7q+PdsTRC4oDMu4kUijiveUj98aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=twws2QhH;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E0E606A31F
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 11:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03E0E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=twws2QhH
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8c5ebbc5150so5469283b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 03:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779414; x=1796384214; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DKhKnChRRvEIqs8abBQ2ImMZ5jJiR20dxd3W+JwXAzQ=;
        b=twws2QhHWQK9hujShjmXQBf5x34UxaOlnecLt5jB/NZEzetjcB+0E+n2Kw5i+kItgU
         9KcWHByFh4YFCZvChCiUDvScTxeVVe8v5dvGI6RdNskhNMMTjlodkjEJBR/C+igfWPVf
         ZuZCI6IrufyXMHeLmIBtF5bH0qdkimX/GYJKSVoL+M3NxauBV7WWZNZ1bCrEjEUK48jh
         0+BYMel+XKCssmr9zHxyMRXBQJZyTLT8CYXXSehPUzwQt2tzdWvTyxAyevvY53W5kVLC
         AE/oVJ5LP6Vk5z4HSVOHEA0FehUTB3zzFXzPQDu7OoMouUrdqEGpz+xA5+Rc8QH/shqa
         AjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779414; x=1796384214;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKhKnChRRvEIqs8abBQ2ImMZ5jJiR20dxd3W+JwXAzQ=;
        b=f+eJpNIGVmJC2xTF/Bkr8K3e1pb58DC4y+rRLbYRybLKcG5AlrfgRHtxqOFx9SsE0g
         3/LMAnEC8rJLGUC/NbKoKrf1Sf88gxltTyu5vyz45YvEZT3jCCpm+diKvyXr9SGw35cl
         F3dhDiCw6jtgH4diV4J6ZFLe3GZyhHMlkH3Xt5QAnVwnkaplG6r5ZnTXs5TPArNo8Twk
         eb1vqCRx7UQdhfX8Z8H3KkKRRLbA535EMNQ5+J2gSJ4NR67AW7k0Vx21i7cZ/o0gQJsV
         UNHEYfmpP7ZL17u2KiA6xo9TU1/uAZP7VirP+bqqhIRKRt9udznRNEaBCTQf1sN95uBY
         EbDg==
X-Forwarded-Encrypted: i=1; AL+hErHcjei4xfsRy2vFhe8Z0owzbAadksBilLsNW9q5a1rcJJLbaMan8Qxb/4IT3doqAohvqYu7VRjBzJwud9rBg79gMdODKA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+s4K0+Hj9jmZyMmgJZ/uSEVmvAlos8rZvU3WjAoQAUiOf/ZG9U
	kmb5+cu9cVJA9jANo3qveGFutv4ryxxfh4WBhM+6KbV89ulFj2eeTc3u
X-Gm-Gg: AZFdTZcVRwbEY/cyCtVsgO2UdXm7DGszNoR2J7V9eUDwE89WRPW8xwYP9U/a31hLgAA
	K2FvbiiuigJ0NolTOSlUrDtdeAWRP8J/HDdVvqfVYixTtu5bsOeCOKLuVmx27EjVBRoCQlw7mLO
	qecyxk2jMVoE0s1GUpJFh4DYmbT0C+CfiBXXQI0bAzm4k2ZZ8nO09sGcMNw34MS44V6lm3bZkjd
	nQEnmXcDvyOM5Tn953EGStEpgLr1Zs278tOaRTeamm5EQWJHzOavYbwpKFjRcU6U5NvERdkwcIB
	PmjCMTare10xOwf+BkD2bay3BVHd+mHfmzzJJETS4gg6DMvrmiugatYWUUOES+jIjEJea5mNAZI
	LolDH5f9sp8NREbzICzeldVXkmhlxkXqj8lRqVIOlvx+x+YcpmoIuEwRRgCUqm5kb2A3nHAqAhT
	dy5NW5TmI9yGmoqhww0rq+wLl4X6/hTh6x6cYU08UJvu2mXoaXZvDl8FQm2QarHaBXoTXXIlrXw
	Dej/vkCwK6iOKr2ATTCpxPmIyfFzcDU1I0PxbAJA0s6XGYj4cvvscFrvFROwYVWkqHf4Px7X2Tl
	UDCc+BwbRuyqzJfdfo5jgeYWGFCoQzoNftcnX5EXOAfAwHQoxlMANGLDcKAWIH75EN+SQvYFQP2
	BXQ4ht+YZgJGR2oMQrTQ6ZKGzjWNoG6WNA9Pyxvj4pHRj3+R/8pBh8YM94J8dDYYtfUYUMPZb6V
	4DZXapvfgWNrsxLvu/1bUcF1Y=
X-Received: by 2002:a05:6a00:2d06:b0:882:e3a6:27c9 with SMTP id d2e1a72fcca58-8c87c28e012mr23070308b3a.30.1795779414330;
        Fri, 27 Nov 2026 03:36:54 -0800 (PST)
Received: from kapoor ([149.40.62.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f16b41sm12398520b3a.56.2026.11.27.03.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:36:53 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Marco Chen <marcochen.dev@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Hartmut Knaack <knaack.h@gmx.de>,
	Daniel Baluta <daniel.baluta@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-iio@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 0/2] tools: iio: iio_generic_buffer: fix exit status
Date: Fri, 27 Nov 2026 17:06:39 +0530
Message-ID: <20261127113640.215803-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127085722.126797-1-marcochen.dev@gmail.com>
References: <20261127085722.126797-1-marcochen.dev@gmail.com>
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Nov 27, 2026 at 03:57:20AM -0500, Marco Chen wrote:
> This series fixes a wrong exit status in two cases for
> iio_generic_buffer.

Both look right to me. For 1/2, the exit status of 1 with -e comes from
write_sysfs_int("enable", ..., 1): without verify it returns the
fprintf() count, which is 1 for "1". Without -e it is poll()'s return
value, so resetting ret before the error label covers both, and the
read() error path now matches the poll() one.

For 2/2, -ENOENT is fine, it matches the "No channels are enabled" path
right below.

The reason you get that far as non-root, though, is that
enable_disable_all_channels() ignores failed writes: it stores the
write_sysfs_int() result in ret, only prints a message, and always
returns 0 (the ret = -ENOENT at the top is never used either). So the
"Failed to enable all channels" check in main() can't fire for a write
failure. Returning the error from there, as a separate patch, would
make the non-root case fail earlier with -EACCES. Your 2/2 is still
useful as a safety net.

Both apply to iio testing, build cleanly and are checkpatch --strict
clean.

For the series:
Reviewed-by: Arnav Kapoor <kapoorarnav43@gmail.com>
