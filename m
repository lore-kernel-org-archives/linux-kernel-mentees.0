Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD54F80035
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Oct 2024 14:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729347249; cv=none; b=UqPm7QKHsDwt7cao4pGGGdFoKsB5AO+Z+4rYVFMwu+Vb7+WFF2pfuzUf3rNDbfnmRhqiyWWt220sPT/V0IMrF9X0Y7AltAZTO3nx+n8yR5exzy7XUaZvFzb+9j5VksH0IoggJT3Jy/f6gmdi49g/YAzHSCxO7IiJno5xSSc1+Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729347249; c=relaxed/simple;
	bh=/YJl37u3gb3ecEanff2bjSph5gRr1jPvWS/wj+kZ9q4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HIdlzMjStEpweEVLVYNhnL2fkztGqfTrb/16bfiiQiiTLEUEBsGqfgQQzcLlh8xjp8bJ3wtQDdf3vtnDhHEHLBtPr3HdEp4+XHWooWVQ41cUep0f4/+cRXlZ+JpSDzekrBEiiWkDIqP4tT3dmORbtU1lkEj8A82F4FsmdiooNRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJOK5MCu; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJOK5MCu"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A3C44013C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Oct 2024 14:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmGLaxW0maHL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Oct 2024 14:14:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D039400FB
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D039400FB
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PJOK5MCu
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6D039400FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 19 Oct 2024 14:14:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39C8BA4061E;
	Sat, 19 Oct 2024 14:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA69C4CEC5;
	Sat, 19 Oct 2024 14:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729347243;
	bh=/YJl37u3gb3ecEanff2bjSph5gRr1jPvWS/wj+kZ9q4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PJOK5MCuq81Fzh3S2E4zUpwptLihRWgb5qRhugJY1xYzlDxrciLg3c3RAZS56kkac
	 rJxVks/RuKKG4+KMozWI/8IwbfCR8KxXmJTrYhr4uTxN9j3IH0isJPPHuyNbeiXyUL
	 08ST0+8HGmUJd2C0PyT5ituXxYNPESjG+obW7tTqxZJHfN8akl6BJp6vCA5y8CYwjp
	 g3r9MwIUzqx0hWkkHsHvOoPp8/Oxfp9XarspMSJjTxoSDzsVkjgMFu0JHvp+IZX8z4
	 0BGS7R+n5X7X7qTojd+jtkt/y9Gahe14GekUPTFuKVY/UbcmzVaqXiF8ex14GMNtIU
	 ysFUCM814Q3mQ==
Date: Sat, 19 Oct 2024 15:13:39 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, ricardo@marliere.net,
 skhan@linuxfoundation.org, Lars-Peter Clausen <lars@metafoo.de>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: gyro: list adis16137 in Kconfig description
Message-ID: <20241019151339.553ee396@jic23-huawei>
In-Reply-To: <20241019034213.429464-1-0xff07@gmail.com>
References: <20241019034213.429464-1-0xff07@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Oct 2024 11:42:05 +0800
"Yo-Jung (Leo) Lin" <0xff07@gmail.com> wrote:

> The adis16136 driver also supports the adis16137 model, but it is not
> mentioned in the Kconfig help. Add it to the description in Kconfig.
> 
> Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
Applied.
> ---
>  drivers/iio/gyro/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/gyro/Kconfig b/drivers/iio/gyro/Kconfig
> index 97b86c4a53a6..3e193ee0fb61 100644
> --- a/drivers/iio/gyro/Kconfig
> +++ b/drivers/iio/gyro/Kconfig
> @@ -27,7 +27,7 @@ config ADIS16136
>  	select IIO_ADIS_LIB_BUFFER if IIO_BUFFER
>  	help
>  	  Say yes here to build support for the Analog Devices ADIS16133, ADIS16135,
> -	  ADIS16136 gyroscope devices.
> +	  ADIS16136, ADIS16137 gyroscope devices.
>  
>  config ADIS16260
>  	tristate "Analog Devices ADIS16260 Digital Gyroscope Sensor SPI driver"

