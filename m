Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C728286409
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Aug 2026 14:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785682098; cv=none; b=st/JnAcQrXRLTHnS/QKw7cBVhskM0Q+vP5jo3tbz+EcTjJBSAiFD/bEDxs6Cvi6J/vPDSWLKksJwIUbLImBLZ03yt/FRq+TCZuGW8iAUkEyoAo9VlZ9tJD8yza02cw2idOK09eGkMa/aQy8oO8qIdqbYqwUGkgXGVqfBWkPX/eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785682098; c=relaxed/simple;
	bh=Kl/kK6ZYTzg68QYqfqbJ3KVkURCxY2rizcrZuYbmm3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dP9VEAf6f7UGcQXmlIIrCvn5BEicihlCf/Shn/Q2Au0mOUFA49Uz5SNnbRVeL2Cus9TGKSVEx1N29WOS9dq9DpCIIHD5pcmXBTWm7+GCX5JJg/9ZTKJOO3V/fnAUnELCO4h+zMUt/J6kgbzAaN2z90CV9Ah/viibQRVx8+1KAnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=I9mv6Hze; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="I9mv6Hze"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4560d6f82edso1552546fac.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 02 Aug 2026 07:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785682094; x=1786286894; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cS2ofFOue4M8XamUu04ihCfrUZX2sV7BxKpIDM4Wao=;
        b=I9mv6HzePfZQrmUDQtfNm2p+ZOI+TIPam/J00rZ3SRk9kpF8JBNmlsicu1VouvfXK5
         iN8dhRFoYDgUDcUpdF/e/Zvsx3UOnYpdg2fb6S/s/re68UKmJ/mKjmbVLwEm7BbNZbZL
         PAOrgUpaN6wHb3CrIRbCfsTTwK9vICejwdDYkMdPGBG/sDGXM/5X8Voc45oSWRDsk3l4
         X0Q7vmb1/OkemX0mGlXeZx7853K89aVJu6ns20VpEFoaZ9DJiCyHMbcrOUTV9kLqsvSS
         /+IWSsYXNBCln/IxPoIxGigDfE3V4qdPGp4epNws1tBtezNe2V/lZaHOEuRZcnX9Gzdq
         rIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785682094; x=1786286894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cS2ofFOue4M8XamUu04ihCfrUZX2sV7BxKpIDM4Wao=;
        b=EqRSlvghph3fbf0xaun1SQ5TywqGr5o4S6CFrOuz2EwfqSOctnIUhRGJZhsxDBmjUa
         728hNlu5r9dr+sNLNse9n7bGkF6T3TMFgEgLyn/w8NbayOqC+Jb/2P7eLtm4MbKX2Aad
         ndOum0CAORGJek48KCCYxUaFByGAijTwm8EbW+pem7OP0Emkald26iBjc6fuPUb8qiLb
         Zi1KGPeCFMAvRqYJDsNhpju627wWEFjQ22Cv5xSrUcPC1rB0I98+jHfVxkBShboKvf9c
         FWv1Bi+Rg6Onc5z5uQxA8A6ibU24oow6OMwdkAs/MVx1Dhrg0rJ49L6K+6SdJOTnfkTH
         neWg==
X-Gm-Message-State: AOJu0Yw45BLxmB0a1Ms7zNp+X7QqXO216ALhUgE1bwdJZAtlMSsIOTlh
	DY0GRb8rvAuMDLJiq7Mla7Ls971dDzKoUsq+Zv1XC78JovKa7d01Rbbc0Fr4VeNETHE=
X-Gm-Gg: AR+sD13zYVVeUueG5JgFFBmOq95+i5SHvUztyJBcIQ67wwF02LXO+CBEa//MLd2bvWo
	tlomXsEtz/0xWGy6z/yHeRPFnv8+zUkxW9vaLn8ckitTrFre5IgzudkK4nVzg27aqak+girlCrg
	pgJ+2UTr74zDeKiBwvADntypwAxjCmxwuOs6f7+mxaOlBVg3zisGeZ712Au6CcOA/38oDgr6BnW
	0rJqeoZ/VZjTYx+tNslNuY4BOEcgFmZIEhOFCzlchkUWUq/p6nvKYNIPX3r4qxTPVXmVfU34HpN
	NwnP8A42OQBrN6pcpTmjrE0vb7cvBu0mte5b1QHZrjZNyRZbwiM6n1mk41joqmVA8Ckz//YYEvp
	2Lwst/NEpdqGSH/A7vxyIxRw1gI29wlB6gUzc234U5TZBeXILlS64jo15wEcYJ0aLa+KNJdHcTO
	8aCZhCMlSFYnBipl9AtYfXjnVfdiByw/nekjlpVih8xkvyE2SnYr98BIEe6zNul2T6o3Jw+2QZ5
	Cm/LhIQ7yFoRtlDYZ5iC9xURGqpEvjpblLr+d0=
X-Received: by 2002:a05:6871:c91d:b0:448:768a:49ee with SMTP id 586e51a60fabf-45905dd7d52mr10874364fac.13.1785682094364;
        Sun, 02 Aug 2026 07:48:14 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:5487:2b6e:1057:d3d3? ([2600:8803:e7e4:500:5487:2b6e:1057:d3d3])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f6064843sm6446172fac.4.2026.08.02.07.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 07:48:13 -0700 (PDT)
Message-ID: <f8670ea5-1e76-4a04-9c5e-e43ffac92be0@baylibre.com>
Date: Sun, 2 Aug 2026 09:48:11 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: humidity: htc100c: Fix checkpatch warn unnecessary
 else
To: Adi Nata <adinata.softwareengineer@gmail.com>, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, u.kleine-koenig@baylibre.com,
 mazziesaccount@gmail.com, bhelgaas@google.com, o-takashi@sakamocchi.jp,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev
References: <20260802014417.15485-1-adinata.softwareengineer@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260802014417.15485-1-adinata.softwareengineer@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/1/26 8:44 PM, Adi Nata wrote:
> Checkpatch warning:

Making checkpatch happy is not a good reason for a change on it's own.
It is only there for guidance. It is not a strict rule that has to be
followed.

I think this is a good change because it reduces duplication of the
return statements and eliminates an unreachable break statement. So
write the commit message with that reasoning and don't mention checkpatch.

> 
> WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
> +			return IIO_VAL_FRACTIONAL;
> +		} else {
> 
> Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
> ---
>  drivers/iio/humidity/hdc100x.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/humidity/hdc100x.c b/drivers/iio/humidity/hdc100x.c
> index bc452cc8fbcf..38903239fb9a 100644
> --- a/drivers/iio/humidity/hdc100x.c
> +++ b/drivers/iio/humidity/hdc100x.c
> @@ -229,13 +229,11 @@ static int hdc100x_read_raw(struct iio_dev *indio_dev,
>  		if (chan->type == IIO_TEMP) {
>  			*val = 165000;
>  			*val2 = 65536;
> -			return IIO_VAL_FRACTIONAL;
>  		} else {
>  			*val = 100000;
>  			*val2 = 65536;
> -			return IIO_VAL_FRACTIONAL;
>  		}
> -		break;
> +		return IIO_VAL_FRACTIONAL;
>  	case IIO_CHAN_INFO_OFFSET:
>  		*val = -15887;
>  		*val2 = 515151;

