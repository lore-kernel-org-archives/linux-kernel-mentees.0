Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB11A306B28
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758097043; cv=none; b=Ac3CRfYPQvs827YQMG5XRRTcE02IsZH0sMS38+ImzjQKv0A1GOvOy9UCsRz3Mh5phQCBoU3QNISJuA8fmwOWrL4xhueK+fzJ25fla14n1RvLNLGTq+Lu1ak0Vu2W9grvApF0YRmEy+0d9h4mOUd9m/8KI4i0Nok3io8gmOjHSSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758097043; c=relaxed/simple;
	bh=p93rnHzaYY1EKGqqeaVdEpYdoaH3KDGBdfemxVFPeCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uvan5bNGdMaRkrCZsjuYegf1T1yVLuxx2Hc6t+V4tYUvHXwSm0s3OVrHFuHtIhLL6VNBUx0E7dyyRvEMTeXJHcQVZ4o5pmYwtyxbQHUCBOlTfFedN1X4vE20bWSoc/5FUZG9r1gLqgvhb5wZjoabz53audp+EO7/7FG38fQHTHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=ufX2HNaA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="ufX2HNaA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45f2313dd86so43882515e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1758097038; x=1758701838; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1cfwZOPZzFsvlNm3ek81Eqwcg/vwsqzjRAGhBUvpRL8=;
        b=ufX2HNaAMVtXuf6cA7vsN7RJ2v3E6EgNzy1gntOV/ub4ZgJGJcsbadbAQi9RBA+dnO
         QjuG8elNuY+FN0PjjXvIb0mSYbkrv6AXMzPbmfSeq5SjL+BHT9zYsMCcl/ovKkl1iRD7
         mxp/WRexbUTnyqC2QvJuXxYEH8HG+mLsyJvu1yLZzwEbW1zGBjAXpqIp9Gz+mtf2RqNU
         RjTEY97TZMoCG6+HhYZuUo/w6ft45jLCfq092vNqKHAGkVm9rQ0SL/8Qdv9sidlCfBEu
         +XoZXfrGQXWLNnv1WCpnRh1dF7lXxiAeKpBGCckZNC7DGtt+s/aPNNDBEVykmmf9ILq8
         6iwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758097038; x=1758701838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1cfwZOPZzFsvlNm3ek81Eqwcg/vwsqzjRAGhBUvpRL8=;
        b=V766aFq6q30UFR8Ww0xCdqmQRJF+RBbUAu+tXbwziEYqXMBqUttRQWi+iH2fgdYg+W
         nbhFcvwL/ohz/Orbe+d5gkNzy4zVme6qx/qTW1xK+59Tx0a9ywBU2BSGtFy5NABB9r8V
         g0OrMKlg84jzSLwoYfoY7Wz2XPfn7WdebQ9d4tTvx9Cbxcc6abQzPKejhkvqUQakAJj7
         b2ANqXqklZP1BcZoM87TcRqCGCrbgqmqi7+Cn0ZDHb2VsPdxDqoG5qix/oj2E+9eR5nR
         eYpL8Cr2g8QZkefb21UQBgyiQff9HUqH6FNP6qqDfkNTIsqebDUZQ1jp4pj+jChBfOo0
         SGtw==
X-Forwarded-Encrypted: i=1; AJvYcCVtj40PLZEl3J3d7A9MhXU78u0y2+SR7tJ32G30Wbl9bx2/ekbeHMuLiGxlNE9d73DYkZ+bJvPotTKUPIcu+5A/H7xAaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXh4iBaHYhmF9N6A557xdGVbtpljTAHWBd4SPprwp4dxyFOGIN
	rP8ZKFTCR49s2n5DRx7LHeqgSZGyUy3+lYTshXhbYXLHq+KMpOkFJPaGZy8z/cuJXhM=
X-Gm-Gg: ASbGncvls8ncVNRXNsqBQ3XfLWzf0YBWcTg2sR514MudN8Abzokj+a/5KD0ulbGKpnW
	Nx5sLaSVQU4UWkbpe1zemoc1mrfOhiHuYuuOtgy+qyEUZ2+DQE+sSgIo3RkJ8R/Z0DY47SV58sy
	rzR+lMTuK0IOqamyypmV57WK4ieU6Vd6qsBamCIe2UVu86EX9hVB1FDtl8GAnv/HVpFVaxaQ8Z+
	vF9gJwNgB9Y+iD6PhJh/d+kZOIFK4LJkvaRZXZ+TaK3b+aKG27RK3mHz5isEtYrX46aoUfn51I7
	ibtJ8KGG0H5Gtt2+VJwduWOCnuScN3kMcHK5lkCasS7Zsbaek89zuaOpeJ2c732/I94nfYH25Zy
	loOMhxWy0jbXJuuNW//BlJF2ON9O14t0JxmS2s6ApHfDqGzF47m1/LurSGBXk3k4sqVyc7k7IC4
	MPIr5XcDa07N+8Cg==
X-Google-Smtp-Source: AGHT+IHQauNqpq8lY/6H7jPfKtMFBDpqtFt79W/QicqW57Kb6YWQ9jdKsOFDxKIhImInFtNC7PPBqw==
X-Received: by 2002:a05:600c:1554:b0:45d:d6fc:24f7 with SMTP id 5b1f17b1804b1-462074c55cfmr10061175e9.32.1758097037873;
        Wed, 17 Sep 2025 01:17:17 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:1b1a:e580:5909:925c? ([2a02:1807:2a00:3400:1b1a:e580:5909:925c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32081248sm37379855e9.0.2025.09.17.01.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 01:17:17 -0700 (PDT)
Message-ID: <b76520ff-f039-465c-a58d-8f0f37bd1664@hammernet.be>
Date: Wed, 17 Sep 2025 10:17:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] riscv: dts: spacemit: add UART pinctrl combinations
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250917065907.160615-1-hendrik.hamerlinck@hammernet.be>
 <F213A85E78015F1A+aMpnVc9S_ynYGDF8@LT-Guozexi>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <F213A85E78015F1A+aMpnVc9S_ynYGDF8@LT-Guozexi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Troy,

Thank you for reviewing.

On 9/17/25 09:46, Troy Mitchell wrote:
> Hi Hendrik, Thanks for your patch!
>
> On Wed, Sep 17, 2025 at 08:59:07AM +0200, Hendrik Hamerlinck wrote:
>> Add UART pinctrl configurations based on the SoC datasheet and the
>> downstream Bianbu Linux tree. The drive strength values were taken from
>> the downstream implementation, which uses medium drive strength.
>> CTS/RTS are moved to separate *-cts-rts-cfg states so boards can enable
>> hardware flow control conditionally.
>>
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> Reviewed-by: Yixun Lan <dlan@gentoo.org>
>> ---
>> Changes in v4:
>> - Explicitly use 0 as bias-pull-up value
>>
>> Changes in v3:
>> - Added /omit-if-no-ref/ to pinctrl states to reduce DT size
>>
>> Changes in v2:
>> - Split cts/rts into separate pinctrl configs as suggested
>> - Removed options from board DTS files to keep them cleaner
>> ---
>>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 430 ++++++++++++++++++-
>>  1 file changed, 428 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> +	/omit-if-no-ref/
>> +	uart2_0_cts_rts_cfg: uart2-0-cts-rts-cfg {
>> +		uart2-0-pins {
>> +			pinmux = <K1_PADCONF(23, 1)>,	/* uart2_cts */
>> +				 <K1_PADCONF(24, 1)>;	/* uart2_rts */
>> +			bias-pull-up = <0>;
>> +			drive-strength = <32>;
>> +		};
>> +	};
> We are currently using the 8250 UART driver, but hardware flow control does not
> work properly on K1. We are considering fixing this when time permits.
>
> Should we add a comment here to avoid confusing others who may run into this?
> If so, I will remove the comment once the issue has been fixed.
Not sure if I’m missing something, but hardware flow control seems to work
with the `8250_of` driver?

On both ends I configured the ports with:
`stty -F /dev/ttyS1 115200 crtscts -ixon -ixoff raw -echo`

With this setup, data sent with echo only goes through when the peer is
actually reading on the other side, which looks like RTS/CTS is
functioning correctly.

>
> Anyway,
>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> +
>> +	/omit-if-no-ref/
>> +	uart3_0_cfg: uart3-0-cfg {
>> +		uart3-0-pins {
>> +			pinmux = <K1_PADCONF(81, 2)>,	/* uart3_txd */
>> +				 <K1_PADCONF(82, 2)>;	/* uart3_rxd */
>> +			bias-pull-up = <0>;
>> +			drive-strength = <32>;
>> +		};
>> +	};
>> +
...
>> -- 
>> 2.43.0
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
Kind regards,
Hendrik
