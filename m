Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0324D526
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 10 Dec 2023 13:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+u5501+"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66A5E6104D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 10 Dec 2023 13:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66A5E6104D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c+u5501+
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1WM0PmUnXc_1
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 10 Dec 2023 13:39:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7503060B90
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 10 Dec 2023 13:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7503060B90
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 983B6B803F4;
	Sun, 10 Dec 2023 13:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE144C433C8;
	Sun, 10 Dec 2023 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702215552;
	bh=avQGx1khJq85b1wqGdR8Nraqua+bOgRavFBFOL0oL0g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c+u5501+Z7AkUNDfgRWa6dbaByLXiqMukJRuFtnLzBvS69MfOyQRkAM+xGjeeWelk
	 S9Bx5gJ1HA+LuhPzWiJ9bcUCmR1ep71GdfXK06Q+MxJOwYdmXkp3MD4EwrsPdGOVta
	 Uhk4ETWGtDWRX9GFuuArs7uHGE1OJXTsBVEQMMTEhqf6RKXFGrOQb1hSHBWeJn94ZN
	 D2VePs2y/Dd6igp1wBhV1B/9CyDadpTyRYncVay7PE8VUSLipEYo7OCsw4W1WqiJ/w
	 1NCHHH7kXT14eHmCRyifkEqcHda3VrRqe+1CuPqSIXm1+DJ8CIRQMQCJ1izU1UbO1l
	 4thf5+f1Ee2Tg==
Date: Sun, 10 Dec 2023 13:39:06 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3 2/2] iio: light: driver for Lite-On ltr390
Message-ID: <20231210133906.3050a145@jic23-huawei>
In-Reply-To: <20231208102211.413019-2-anshulusr@gmail.com>
References: <20231208102211.413019-1-anshulusr@gmail.com>
	<20231208102211.413019-2-anshulusr@gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  8 Dec 2023 15:52:10 +0530
Anshul Dalal <anshulusr@gmail.com> wrote:

> Implements driver for the Ambient/UV Light sensor LTR390.
> The driver exposes two ways of getting sensor readings:
>   1. Raw UV Counts directly from the sensor
>   2. The computed UV Index value with a percision of 2 decimal places
> 
> [NOTE] Ambient light sensing has not been implemented yet.
> 
> Driver tested on RPi Zero 2W
> 
> Datasheet: https://optoelectronics.liteon.com/upload/download/DS86-2015-0004/LTR-390UV_Final_%20DS_V1%201.pdf
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>

I fixed up the case where you use dev_err_probe() in a path called from
places other than the probe() callback.

Applied to the togreg branch of iio.git and initially pushed out as testing for 0-day
to take a look and see if it can find things we missed

Thanks,

Jonathan


> +
> +static int ltr390_register_read(struct ltr390_data *data, u8 register_address)
> +{
> +	struct device *dev = &data->client->dev;
> +	int ret;
> +	u8 recieve_buffer[3];
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret = regmap_bulk_read(data->regmap, register_address, recieve_buffer,
> +			       sizeof(recieve_buffer));
> +	if (ret)
> +		return dev_err_probe(dev, ret,
dev_err_probe() is only intended for use in probe() and functions that are
only called from probe()
> +				     "failed to read measurement data");
> +
> +	return get_unaligned_le24(recieve_buffer);
> +}

