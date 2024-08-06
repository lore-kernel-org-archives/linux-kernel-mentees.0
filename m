Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC46447A66
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722961960; cv=none; b=oHNDMVi5tRQHAuqtUoo3SE26/n2+c74xjf6njmgD+a2CLNKPzObhGgVYgFh6qd+gXlm/EUjN7Rsxup83dusEN+kqbkStuvfdmWkWuQg6NQH9rZ+3kJw0862p6Rx5TKL5PJCm6qApZRDWqkLwf6WqoACecQgnpcIUO9TrEzqO9LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722961960; c=relaxed/simple;
	bh=0eny/Vsu4sJKj0EvuFo6PYlBjSKdQR/M070SUXqqkUI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e05x/lUW9cJJLOQc0KeydzXH6nw/hsF/WuXULyN+ZdnR6rTLqYPsCDQ+DwBnwhiN+IidNUamHZfTryL28MGhtidJY0SaMseiEKlk9jQOZuna47jhwif34gBaquT+xpojixMKa8AXWujJ8Vu+AkBggkB2gqkBPtZVdCzxQx69mFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5hBe0HM; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5hBe0HM"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7752B401F3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 16:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CW3UZIB5sN-y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Aug 2024 16:32:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7520D401F0
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7520D401F0
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u5hBe0HM
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7520D401F0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  6 Aug 2024 16:32:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F85E61040;
	Tue,  6 Aug 2024 16:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DDAC32786;
	Tue,  6 Aug 2024 16:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722961955;
	bh=0eny/Vsu4sJKj0EvuFo6PYlBjSKdQR/M070SUXqqkUI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u5hBe0HMGJ70cTJe0Kb9gvemtKIOvTzhhhfVqXHtIERGgx11A0mqoiKngH5XldSMH
	 pjInfnfJpGzOM297JCj3woAk9TIB0CaZ93DeSFKad7Npf197+jEC8Dph4Euxc0DnSg
	 snM4uyOrl8YVIZQ6HsXgOEHVJr+yLBpu4E8WFaAiTFxsx4MQpAX8IWtSkuvOWX4NfD
	 ixR1Buo/b4eL3ydZabUI84gBoIuCfraD8izt3iUpfjHAovLhIl1u8gk3dtE7rxysbU
	 bq0GtbWhsi5vuZitU0WbjitxERelrwJaZZiolnUIp6aFcoYo+vxhYmlMkhECJcCkyV
	 LEyKDMl3qDYXQ==
Date: Tue, 6 Aug 2024 17:32:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: lars@metafoo.de, andriy.shevchenko@linux.intel.com,
 biju.das.jz@bp.renesas.com, nuno.sa@analog.com, skhan@linuxfoundation.org,
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: accel: bma180: Fix dataready interrupt to use INT2
 pin
Message-ID: <20240806173228.264f0114@jic23-huawei>
In-Reply-To: <20240805173237.475797-1-abhishektamboli9@gmail.com>
References: <20240805173237.475797-1-abhishektamboli9@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  5 Aug 2024 23:02:37 +0530
Abhishek Tamboli <abhishektamboli9@gmail.com> wrote:

> Update the interrupt configuration to use the INT2 pin for
> the dataready interrupt.
> 
> Address the FIXME: support using the INT2 pin.
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
Hi Abhishek,

That's not the intent of that FIXME.  It's pointing out that the driver
does not currently support the wiring configuration where only INT2 is
connected.  The change you have here breaks the configuration where
only INT1 is wired or both are wired (as it will register the
interrupt handler on the int1 pin, not int2).

I'm guessing that is the situation you have is int2 only?

To handle this you need to add the firmware queries to identify the
interrupt by name. See for example driver/iio/imu/bmi323_core.c
bmi323_trigger_probe()

	fwnode = dev_fwnode(data->dev);
	if (!fwnode)
		return -ENODEV;

	irq = fwnode_irq_get_byname(fwnode, "INT1");
	if (irq > 0) {
		irq_pin = BMI323_IRQ_INT1;
	} else {
		irq = fwnode_irq_get_byname(fwnode, "INT2");
		if (irq < 0)
			return 0;

		irq_pin = BMI323_IRQ_INT2;
	}

This defaults to INT1 if available, but will find INT2
if interrupt-names is provided in DT and specifies that only INT2
is present.

Jonathan

> ---
>  drivers/iio/accel/bma180.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
> index 6581772cb0c4..d44409afffbf 100644
> --- a/drivers/iio/accel/bma180.c
> +++ b/drivers/iio/accel/bma180.c
> @@ -126,7 +126,7 @@ struct bma180_part_info {
>  #define BMA250_SUSPEND_MASK	BIT(7) /* chip will sleep */
>  #define BMA250_LOWPOWER_MASK	BIT(6)
>  #define BMA250_DATA_INTEN_MASK	BIT(4)
> -#define BMA250_INT1_DATA_MASK	BIT(0)
> +#define BMA250_INT2_DATA_MASK	BIT(7)
>  #define BMA250_INT_RESET_MASK	BIT(7) /* Reset pending interrupts */
>  
>  struct bma180_data {
> @@ -425,10 +425,9 @@ static int bma250_chip_config(struct bma180_data *data)
>  	if (ret)
>  		goto err;
>  	/*
> -	 * This enables dataready interrupt on the INT1 pin
> -	 * FIXME: support using the INT2 pin
> +	 * This enables dataready interrupt on the INT2 pin
>  	 */
> -	ret = bma180_set_bits(data, BMA250_INT_MAP_REG, BMA250_INT1_DATA_MASK, 1);
> +	ret = bma180_set_bits(data, BMA250_INT_MAP_REG, BMA250_INT2_DATA_MASK, 1);
>  	if (ret)
>  		goto err;
>  

