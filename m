Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769851;
	b=PUDP39OIEHQ5meMHHc1c69WtI+i7cC9Yd+rzfkkLG34xA1H/E3T70OceEk2cvjlBBemI
	 iExVJps6vU2YvbcL93zxMLrovRg69eB9A20XusxGfPbs5OkX6VhKAx6VOvRG9y9EKaPUI
	 kA2bqAO1wv9FfAKIhiWOu1o9w693SV9UYRrIqK7oOomzNSNGUc6CbFo5JGaNXjrf0JrCY
	 z989Ua/9EKv84MLrlnjAGcU8Uh+mKoqkkvRVKnYeBCDAHuQnnqqxAFu8KTcb8Ba6M1Rl5
	 9Tb0qlsTu3z0043ieOE+HI41uDHDfGXSuytkzHPPLRbYySDgm1bUMEVYuJVx0P2VMAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D3BUd04JVrnXcutr4tZgrlnJxoE4YwrhlZjXYG1JjPI=;
	b=YmE3TzP9SMoHaHJFdMWNAldOr4KNFrJHvZHwuy7bOAqrBmxJ/LaS/akx84Oo64TQyiCO
	 GE0FgAJC0fphXkxvBv+EDf+apxcp4YsuNeJWBMuydONrZVNWvpREg2L3D880aiJged25U
	 xVj9X0Qzidfad1Fj7D3BWftX30T9VR37xIIMdA1psiNURjBOyvRwmgRL/xPdaF66+s0vN
	 SDmTZvwpsIAHxeghU5F3smsr9SQKuCKErJNW4/IwIFM3hsEiCCYhVy5VfH6VsC5aIyvdv
	 nPHmilDaaLBYQvTPd0n89wHY0pljqusWfUacDXQnVMr/+i6xmdJiv55BXlNBThGkkZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGKp3WRW;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3351606A323
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 08:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3351606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGKp3WRW
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53634b8328eso73934941cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 00:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795769850; x=1796374650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3BUd04JVrnXcutr4tZgrlnJxoE4YwrhlZjXYG1JjPI=;
        b=zGKp3WRWmUwYGy+Bb+VldR0kchJndLuqV/2ULablXqWYJ+BrEiyGh3Yit5EpAcIuu3
         nM0BjwtND4mBbhhrLNwdZgegLjmNyzA8jC9VyIWvPbPki3prjzEX5FsvmIT2NGeTZ6R/
         X1x8Go7V1ZswukXGc7DO6fpYysjFedo13zLwaIgLeaVBo44SUsBnwsOI/dLq+hCpfjFA
         07hjq0dShSLTWs2Ug03muNL/XitlitOSZW5eufapI0hCFrtTJVd5NXj9CSStYHniQYcI
         PbRRtxZq+spdqqikA4DvzhBtpM2nNTByI+d/wxwLZ/ffOIb/tgDd1l587PL/0nUi6o71
         nYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769850; x=1796374650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3BUd04JVrnXcutr4tZgrlnJxoE4YwrhlZjXYG1JjPI=;
        b=GGL53rmD6cOAP+TZIjStURzebNRpSNOIjmZL4jTb9QhO/+VbGKRK0LGq/D9u0wxL6i
         qaIg7aOjdJ0EKyLRZnQF+dw62LfPKs8j5htfpWMcwLNOO06FGuAR+DGKdhXfdjQAfdgb
         3ZMnIaUPfhHes614tpzNRmKYSHUUEQ/IfxUsrdKkWvav5zMmDHTv437hdfICha+e+rPw
         F2NFQOWD4GojfWrSVOL+yOYhkQVEFgmUpeO7fjfnGepJ1ZjpmqGNZvtZjEgwe8Vmd2J5
         adCHuMbVme6vupz5IpfrBX57Cy65BYqDI8GHnjj4rnja5/RKKBJhXcfHLuA/17Cgkge9
         M5fw==
X-Forwarded-Encrypted: i=1; AL+hErECCIQI5wFQtoY8oofSH5GOSTS2kOKe4lzEnnbDhmFctuNeDWATDPQvIGCOYlGpAt77UnQI2yVEAru2yVukbHdb45YNFA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8W7QklM3DPbx3Tjp6tQlluCa22bc34+3fg00XPBnisBj4LWLOs
	ZhfyWGwCWCCqFXyVIJpb0M5MmHQAc6P3O015fNVXlRkQNm5mxZXrUzTw
X-Gm-Gg: AZFdTZfTY3jZQs9cgpPOzUtlZMdGL2fNi+kD6/XOHcRGGYkxNR/UustkJqQqgc0MGWi
	EZEq9BOurBmF5L7JH5mb+0dU+BI4fk4sNHFWX0vJ5uAwzpvi5P5cr4L/IO7qtIjzE1Xm5AVF49O
	HcQZG5OeYKCBCvWEVB16CW8sgUmoI54L9FmKOAp4fXk3tt2CFhcQjuFMALiH5ldEm8vqoiP9FoO
	EC0IGdetzGL6jxr6ZTXF609HM1aSRmnzy51Cgf8Suqa8EO7Mi44pe4I7Gr3grLYEf209ss8WdKv
	mdozVUeNdT16Hm7yQ4+jZWH8lbscWZnPnUoTOlyEkqE6WECAWlESv7CDCp5EdBSJAf5wWaebiLs
	IJOYC+vrVVMXlG92Cj4b1iAFn4TD4cGaAL8bzzrsmacRYR+L93vYeD7mKuHFCwbiz59igggif4d
	I1iLK8RvM3t1zAcwRaNBhI8BK4a6wzGf3MT3G6lSOOaf2EEVc9PjA9qOQzr8GGWHc601S472aQo
	RDx4dCCgsJojVf87upMIpYUCduS9Z7uOcHSuP8xxyvTHvhQKZRHBQVPhdibhQWnbZgpp+3byYXr
	vZuizEBZbmp3YbFdh4xxVZgmwCLuPiulA48=
X-Received: by 2002:a05:622a:1909:b0:55c:840:1307 with SMTP id d75a77b69052e-55d76a2609fmr418679661cf.20.1795769849822;
        Fri, 27 Nov 2026 00:57:29 -0800 (PST)
Received: from localhost ([2600:4808:5693:8201:394e:8b9f:994c:b59f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7882ea2dsm203415471cf.15.2026.11.27.00.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:57:29 -0800 (PST)
From: Marco Chen <marcochen.dev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Hartmut Knaack <knaack.h@gmx.de>,
	Daniel Baluta <daniel.baluta@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-iio@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 2/2] tools: iio: iio_generic_buffer: return error if no channels can be enabled
Date: Fri, 27 Nov 2026 03:57:22 -0500
Message-ID: <20261127085722.126797-3-marcochen.dev@gmail.com>
X-Mailer: git-send-email 2.56.1
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
Content-Transfer-Encoding: 8bit

If no channels end up being enabled when using the -a flag,
iio_generic_buffer prints "Still no channels after auto-enabling, giving
up". However, it exits with status 0 because ret still holds 0 from
the preceding build_channel_array() call, so callers see success even
though no data was captured. This happens, for example, when
iio_generic_buffer runs without permission to write to the scan element
enable files.

Set ret=-ENOENT before jumping to the error label. This fix matches the
"No channels are enabled" error directly below, which already returns
-ENOENT.

Fixes: 5f991a921a08 ("iio: tools: generic_buffer: auto-enable channels")
Signed-off-by: Marco Chen <marcochen.dev@gmail.com>
---
I used -ENOENT to match the existing "No channels are enabled" path,
but I am not 100% sure if this is the right error code to return here. 
I would be glad to hear your input on this.
Thank you.

 tools/iio/iio_generic_buffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/iio/iio_generic_buffer.c b/tools/iio/iio_generic_buffer.c
index 122fa54bb74a..974548150eb1 100644
--- a/tools/iio/iio_generic_buffer.c
+++ b/tools/iio/iio_generic_buffer.c
@@ -643,6 +643,7 @@ int main(int argc, char **argv)
 		if (!num_channels) {
 			fprintf(stderr, "Still no channels after "
 				"auto-enabling, giving up\n");
+			ret = -ENOENT;
 			goto error;
 		}
 	}
-- 
2.56.1

