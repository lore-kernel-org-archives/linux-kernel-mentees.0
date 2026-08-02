Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83E53BCD04
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Aug 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785683680; cv=none; b=Z85fMIdR9ZEQGwWSu+t8jPMQfnktviKTm4VLuC7GNB4fLdK3oZVLUSKVbgzkC0MeHqB11o5/xR4ZiL7Z+/IQLPIlyqcM1867yKQWm7EPSZIPRLOUJivgY9F/pgCMEyaVmhsCPkd2htK8D4qh/yBffgqn/329seecxD220+oGo0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785683680; c=relaxed/simple;
	bh=PLLcLqMx1gfzbLZ/bw5r7C+UIrKhF4+HRnGPl4TA7eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hy5MI7w4IKoJUMDy/A2fYhvoLG7Vrv8fQeDCYoAWMx7lUR8BwsLS0FTW8VHk6/+GHx3q2WKZltUXWtktiQfymy/mIf0+4Kb5e87XLO/hcSMvQ9xw7qOuH370iAgI4vyWCp71QqkZwTeTlBSP+NegVlKxC8/dKzIkOHkTSQ5hZ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jUmKLQBb; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jUmKLQBb"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9d7464b71so1188417a34.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 02 Aug 2026 08:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785683676; x=1786288476; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rr0TzZh8MRzpbub91JNUFmvt27M8H9CPFD+akea5yMo=;
        b=jUmKLQBbds+JFjskVnGHI9Z8/DgPqePpwfpH1I4TII0GaEhLbyyrEPNKkZa/YsGASB
         51MDBrXGT2JgQUW11Zu5c8w0iGP+YvHNZmbZMagTT2EHixes45Qj3Ltn1kWE2rr5Hibz
         Db+pu2wW2vc94yr35A16BqlqYfkBh4UhE22vSLVvc/1gb44txJ3wgQJw3loltMMba+QQ
         4ssKVXreoMkKnA3dop5yZqwmsXCxmtKNMHQJLXcgrg6lbrq5IfPYdswovjBWDHmn5hPf
         +RT8z/CCKktR024EX20FHLTisnEim2IvYeGfpAoOl5+reM09UfMb8lls0+7aBMtHAGhZ
         5apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785683676; x=1786288476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rr0TzZh8MRzpbub91JNUFmvt27M8H9CPFD+akea5yMo=;
        b=UvEBngmifU0wVARhUhNf6t4/RjMBqK67ifm0BpaTKq6sXjJU+gzo3uW//n54dRjeM1
         KfqM05KZAvhoNcbEYuwVrqNhe93OQVrWp/L8op1iYwBGc1fQeuRuB0P3iejQNdkq8uFR
         GJlF5u2WWf0UR/PxoqZ6lS36Myv7iP6gnPxIJ0zWOfGGdOS+1Js4G0KQeb8UoaMLOTOy
         cB2x4hWuXawjnG3tr/SubWO5Jc+xDKRADEiURrhIrrzWwCAKOzdwU5pZNpdeCZfVoyEI
         306YtLh8JC8eJh54WvHoBfRGDoEw+2mIPHpJoaVsUqdqj0+ItjDbF+4iL22meek0tOzF
         PBGQ==
X-Gm-Message-State: AOJu0Yy2kbRn0bMjSsfhb65lvmWoiGsQpNZBOHNOqofevrVQZtcAYp1h
	w/1SmkoHKkKRHzYEjxB6AxVJbb+iRJZgiaLBbLSth7u/mFWcxGOtoNIbDTn5/fI3XQE=
X-Gm-Gg: AR+sD13rtwstKp27SXhM7gQhL96cQHZ+ionNH+zLJMd0G9w/Hm22kZjE5w+zOVSTEpm
	JkzZpawxMTV2tHxhxTIxsoINpK5wi1vEPJAa9jw14FFoIcKABGCNdjZlnimti99x8SUrgCtjbG9
	s6aa729YwyMVdBd2QGxwFRthhD51wB11XeMpPtZMD8vgYOs52KRhR68h4p/2Buy3lUfv9fNNyv4
	0S/A78KRzeRGNviWU4Txk0r1tCj6CGsAC+9t98q6HKjGf2MZEW6wugNIoSpRg7IBlPz46r6AlkM
	vOrI7gyny4VlFTFngs6OWrE9KNTEE8ISpaOgY7k9p7QK90Ad2xmmRZctIEfQWv7uOhaMR+B2tEG
	072+VMkKYUNj/lZbDUPlSpIt6B04E1mCgtPWh4CnKm6AN/jRHpD9U+0ADzlxiHRT6l4ub2xf2qe
	/Wu9EvnDWkcx2H68WHBNeW3mijyRT1EMcTxd4zrbwL67rlP3NwSUA9ZbwICCaUZR/BUktQlTc4s
	X1kRLKpuRonuaQWzIxcY57VsCyGZvpt8ah4/Vg=
X-Received: by 2002:a05:6830:2409:b0:7e7:8dc0:3951 with SMTP id 46e09a7af769-7f196cf6adbmr12788526a34.8.1785683676486;
        Sun, 02 Aug 2026 08:14:36 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:5487:2b6e:1057:d3d3? ([2600:8803:e7e4:500:5487:2b6e:1057:d3d3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18e8cc0efsm5219109a34.0.2026.08.02.08.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 08:14:34 -0700 (PDT)
Message-ID: <349e5f1c-b162-4e10-a4b8-87c2c3b83554@baylibre.com>
Date: Sun, 2 Aug 2026 10:14:32 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iio: chemical: ccs811: cleanup checkpatch __packed
 warning
To: Adi Nata <adinata.softwareengineer@gmail.com>, joshua.crofts1@gmail.com,
 jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org,
 u.kleine-koenig@baylibre.com, email@sirat.me, mazziesaccount@gmail.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev
References: <20260723235312.432a895c@systembl0wer>
 <20260802022559.23138-1-adinata.softwareengineer@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260802022559.23138-1-adinata.softwareengineer@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/1/26 9:25 PM, Adi Nata wrote:
> Change instance of __attribute__((__packed__)) to __packed per
> checkpatch.pl warning.
> 
> Reported by checkpatch:
> FILE: drivers/iio/chemical/ccs811.c

This same feedback applies to all of the other patches you have been
sending. Making checkpatch happy is not a good reason on it's own.
Find out the reason why checkpatch makes this suggestion in the first
place and use that as the justification for such changes.

> 
> WARNING: Prefer __packed over __attribute__((__packed__))
> +} __attribute__((__packed__));
> 
> Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
> 
> v2:
> - Rename commit message to include driver name
> 
> ---
>  drivers/iio/chemical/ccs811.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/chemical/ccs811.c b/drivers/iio/chemical/ccs811.c
> index ce7187ccd706..0e5c79b775a2 100644
> --- a/drivers/iio/chemical/ccs811.c
> +++ b/drivers/iio/chemical/ccs811.c
> @@ -70,7 +70,7 @@ struct ccs811_reading {
>  	u8 status;
>  	u8 error;
>  	__be16 raw_data;
> -} __attribute__((__packed__));
> +} __packed;
>  
>  struct ccs811_data {
>  	struct i2c_client *client;

