Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C64235354
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 06:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758091157; cv=none; b=IxfCywi0CignxLc/NJ4hxCF5QbxTbmSafo6z631jSmgW7gOctDDkGfTv54Kx03feE9dx5oGaTbQqxWQl5CJ+Ac0zz8CTDJn9FAoJnx44cFWRNhgkJPULzR85aOfdELhOj7r66MTWVd/53DtY6ebGgrhKLkIifdGRlDLjI00bpWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758091157; c=relaxed/simple;
	bh=xX+N/SN6MUaa28wK4TLjv1haNtZLkkAoQ0rN+SnsVF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C9K017/PESYT5yZgSwVtyEPX0gShoUQ8PSbjzyhR4itSZ1vJhOEaZIgfojq5ln4VitMpnLcE4zczXzt57hXgL85Dwxq22dfDXb/5EhS3rPpXx+8tisjRP64GeHsU4k0biiFvSw+BKEFAVVQC9/sNanjYuAVZbecO+hcZYfPP+/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=Qv1lsOhL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="Qv1lsOhL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3e957ca53d1so3113687f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Sep 2025 23:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1758091152; x=1758695952; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=77F0eh5zIcs6VOlyvrc/5uKyRtamVm6y2K0LLyVNiHg=;
        b=Qv1lsOhL1A2iBvdjBW8NuwaGsuvYM5lkgrvoZx8y0vp1/v92qp/BE4R73dS5Tyy4iN
         x3wWX3gaIrZiCONeIIWyUxXDGx4YnKakKNW5U+ZL2YN8UkZ9GRHBgO6bHzfPU3We24O/
         3339FItIF/b7RBdBliPQeRMqdZfxtHo6hwGHgLWZQOLeZ764AJVM5QzZkuVvZeGyaAe6
         IFBUDAsVBiAQXrTbPWNw61n4TXI2TYXoNcNCpF6UZPp7kJEHKWnRnHmtfgD1+z5WLISM
         LULM3JMD7X6eU/U7+GB2CHQ1IaxfWNG9vd5SaC5U9+8DzG3XmpJECDcnR9UP46sRSFmr
         /bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758091152; x=1758695952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77F0eh5zIcs6VOlyvrc/5uKyRtamVm6y2K0LLyVNiHg=;
        b=Quzu16opnWPH/f2JSOoP5sYkWn0CCY0phlobHsKlgOd3pOmztyEkD2RVzFgNYr6Jq3
         M+mXW6N5+Eid3w80qtgNz6RAOt6G3StFQhY1U3cjbdApFvAfiCPhl4XHeMK5o+OI5NCy
         FfOakTFiwCRv0uWMaIF87NHzhh0hLmq1Y8H/wJYQCGzjrQVKTCydI/PvZ81bawQc1SNd
         4fPSJf1P5EemgLARmKym7fSoXNcSUZsikhz4/DFwF5D1YA9CJScUGhemhEA84g6niATA
         afrGeFF23YfVGSB1MXaJNnDWZXAirFXw76ngKYTB7JlKQ0bFjxla44BhLtROXM6ikxYB
         et0w==
X-Forwarded-Encrypted: i=1; AJvYcCVRCqo5FPm4uA92SwSMasKiQmndzhD+ugS9Bnwkk+npFsmkwg6FYaOOG+Q7h89j0FrSvhFnqIHdL+rwBElwZ+u5DIYPZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEfGNmMxC/pakJ4/Qsrrk6rNAzJumcZkIymJLgj1Xg9yg9UtzA
	ZyYNZe4tfXDbw6w8V9lN0dFB7APihO9CwrHpQOm4yTAi4cvAMSFubGblFxbd+1GP+ms=
X-Gm-Gg: ASbGncvREZimR2gCKwCGuOvDNWiMEBLaFiAoOrxd3hEu75oTcQloPITWxemj8aaesfS
	SB7l2dNfm+6rSHQwsph9slC37+Bcasznh7FOYc07oUxt9e1EkPY37/V38UFfjo6LLGbGSnUAdlz
	AZ94TOQjw52aZQqxIRfE3qVIfDff+CwggjKzmFjdSlpB9IjYAv6pT2u86F+L0T5wdnuccAspb4b
	rpSmrYnn1S3URq85tpAdz8m38CAK6LgzoEuxVauBU9MhqF7ec7LPpeismaoUBxAPHZv6O1YPZP+
	0P4SD5u9ocuHoHooFFvR5jX6qQcHJbx5DzccASXzqtlzAGxxH40kYSBS1BK2r4Fiqyv6rjJy4Of
	gERh0GEMtagpq/E6GQbgkWJC91uFAEsv/AVCBM09XjkZycKJX3FeZn9E4lYZb657rGaNzdlfHmX
	w+IH6Ef45YRKBcZg==
X-Google-Smtp-Source: AGHT+IG6Qsc5VU9s+KLN/ObymCbaRcvmgFQYQp7jQl2dFNfoKqhHY6bNfm9aOpDZbu6Xlk5fJjmiww==
X-Received: by 2002:adf:a2d6:0:b0:3e9:d54:19a0 with SMTP id ffacd0b85a97d-3ecdfa4239cmr495573f8f.57.1758091151984;
        Tue, 16 Sep 2025 23:39:11 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:1b1a:e580:5909:925c? ([2a02:1807:2a00:3400:1b1a:e580:5909:925c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdbc7fe1bsm3414155f8f.52.2025.09.16.23.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 23:39:11 -0700 (PDT)
Message-ID: <55237b5d-c9b8-4606-8b5d-c7a97218c085@hammernet.be>
Date: Wed, 17 Sep 2025 08:39:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: dts: spacemit: add UART pinctrl combinations
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250916064739.196695-1-hendrik.hamerlinck@hammernet.be>
 <20250917012941-GYA1263349@gentoo.org>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250917012941-GYA1263349@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Yixun,

On 9/17/25 03:29, Yixun Lan wrote:
> Hi Hendrik,
>
> On 08:47 Tue 16 Sep     , Hendrik Hamerlinck wrote:
>> Add UART pinctrl configurations based on the SoC datasheet and the
>> downstream Bianbu Linux tree. The drive strength values were taken from
>> the downstream implementation, which uses medium drive strength.
>> CTS/RTS are moved to separate *-cts-rts-cfg states so boards can enable
>> hardware flow control conditionally.
>>
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> ---
>> Changes in v3:
>> - Added /omit-if-no-ref/ to pinctrl states to reduce DT size
>>
>> Changes in v2:
>> - Split cts/rts into separate pinctrl configs as suggested
>> - Removed options from board DTS files to keep them cleaner
>> ---
>>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 432 ++++++++++++++++++-
>>  1 file changed, 429 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> index 381055737422..7811fb485bd4 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> @@ -11,12 +11,438 @@
>>  #define K1_GPIO(x)	(x / 32) (x % 32)
>>  
>>  &pinctrl {
>> +	/omit-if-no-ref/
>> +	uart0_0_cfg: uart0-0-cfg {
>> +		uart0-0-pins {
>> +			pinmux = <K1_PADCONF(104, 3)>,	/* uart0_txd */
>> +				 <K1_PADCONF(105, 3)>;	/* uart0_rxd */
>> +			power-source = <3300>;
>> +			bias-pull-up;
>> +			drive-strength = <19>;
>> +		};
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	uart0_1_cfg: uart0-1-cfg {
>> +		uart0-1-pins {
>> +			pinmux = <K1_PADCONF(108, 1)>,	/* uart0_txd */
>> +				 <K1_PADCONF(80, 3)>;	/* uart0_rxd */
>> +			power-source = <3300>;
> ..
>> +			bias-pull-up;
> here, see comment below
>> +			drive-strength = <19>;
>> +		};
>> +	};
>> +
>> +	/omit-if-no-ref/
>>  	uart0_2_cfg: uart0-2-cfg {
>>  		uart0-2-pins {
>> -			pinmux = <K1_PADCONF(68, 2)>,
>> -				 <K1_PADCONF(69, 2)>;
>> +			pinmux = <K1_PADCONF(68, 2)>,	/* uart0_txd */
>> +				 <K1_PADCONF(69, 2)>;	/* uart0_rxd */
>> +			bias-pull-up;
>> +			drive-strength = <32>;
>> +		};
>> +	};
>>  
>> -			bias-pull-up = <0>;
> Sorry, I've overlooked this, the bias-pull-up need to explicitly set to
> a vale of 0, 1 - normal pull up, or strong pull up.. for uart, the normal
> pull up should be ok
>
> please refer Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
>
> Since the rc6 is already tagged, I'm about to prepare a PR, so If you able 
> to respin a new version quickly, I'd be happy to take, otherwise let's wait
> for next merge window (which shouldn't be a big problem)
>
> btw, please always do a DT check: 
>   make ARCH=riscv dtbs_check W=1
>
Oh, I wasn’t aware of this. I’ll update it accordingly and run the check
before sending a new version. Thanks for the advice!

Kind regards,
Hendrik

